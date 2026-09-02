# Offline checks on `Kuber.register!`: the plug point that replaces 0.2.x's
# `KuberContext(apimodule)` for generated layers Kuber does not ship.
#
# The fixture is a hand-written stand-in for a generated group module — the
# registry only needs a `Client`, model types and operation functions, so nothing
# here needs a spec or a server. Every registration made in this file is undone
# in a `finally`: the tables are process-global, and test/registry.jl asserts
# invariants over all of them, so residue left behind would fail that suite
# depending on which ran first.
using Kuber, Test

const R = Kuber.ApiImpl

module FakeGroups

# stands in for one generated group module
module MetricsFakeV1
    struct Client
        server::String
        Client(server::String; kwargs...) = new(server)
    end
    struct NodeStat
        kind::String
    end
    struct NodeStatList
        kind::String
    end
    struct Pod          # a kind name core already serves, on purpose
        kind::String
    end
    listfakev1nodestat(client; kwargs...) = nothing
    readfakev1nodestat(client, name::String; kwargs...) = nothing
    watchfakev1nodestat(client; kwargs...) = nothing     # never registrable
end

# a second module, to collide with the first
module OtherFakeV1
    struct Client
        server::String
        Client(server::String; kwargs...) = new(server)
    end
    struct NodeStat
        kind::String
    end
end

const GV = "fake.kuber.test/v1"

const GROUP_MODULES = Dict{String,Module}(GV => MetricsFakeV1)
const MODULE_GVS = Dict{Module,String}(MetricsFakeV1 => GV)
const KIND_TYPES = Dict{Tuple{String,String},Type}(
    (GV, "NodeStat") => MetricsFakeV1.NodeStat,
    (GV, "NodeStatList") => MetricsFakeV1.NodeStatList,
    (GV, "Pod") => MetricsFakeV1.Pod,
)
const OPS = Dict{Tuple{Module,Symbol,Symbol,Symbol},Function}(
    (MetricsFakeV1, :list, :NodeStat, :cluster) => MetricsFakeV1.listfakev1nodestat,
    (MetricsFakeV1, :get, :NodeStat, :cluster) => MetricsFakeV1.readfakev1nodestat,
)
const OP_PARAMS = Dict{Tuple{Module,Symbol,Symbol,Symbol},Vector{Symbol}}(
    (MetricsFakeV1, :list, :NodeStat, :cluster) => Symbol[],
    (MetricsFakeV1, :get, :NodeStat, :cluster) => [:name],
)
const OP_BODIES = Dict{Tuple{Module,Symbol,Symbol,Symbol},Tuple{Type,Vector{String}}}()

"""The six tables as keyword arguments, so a test can perturb one of them."""
tables(; kwargs...) = merge((
        group_modules = copy(GROUP_MODULES),
        module_gvs = copy(MODULE_GVS),
        kind_types = copy(KIND_TYPES),
        ops = copy(OPS),
        op_params = copy(OP_PARAMS),
        op_bodies = copy(OP_BODIES),
    ), NamedTuple(kwargs))

end # module FakeGroups

module NotARegistry end

const FAKE = FakeGroups.MetricsFakeV1
const FAKE_GV = FakeGroups.GV

"""Run `f()` with the fixture registered, and unregister it whatever happens."""
function with_fake(f)
    mods = Kuber.register!(FakeGroups)
    try
        f(mods)
    finally
        Kuber.unregister!(FakeGroups)
    end
end

@testset "register!" begin
    # snapshot the shipped tables, so every testset can assert it left no residue
    shipped = (
        length(R.GROUP_MODULES), length(R.MODULE_GVS), length(R.KIND_TYPES),
        length(R.OPS), length(R.OP_PARAMS), length(R.OP_BODIES),
    )
    sizes() = (
        length(R.GROUP_MODULES), length(R.MODULE_GVS), length(R.KIND_TYPES),
        length(R.OPS), length(R.OP_PARAMS), length(R.OP_BODIES),
    )

    @testset "a registry module merges into the tables" begin
        with_fake() do mods
            @test mods == [FAKE]
            @test R.GROUP_MODULES[FAKE_GV] === FAKE
            @test R.MODULE_GVS[FAKE] == FAKE_GV
            @test R.KIND_TYPES[(FAKE_GV, "NodeStat")] === FAKE.NodeStat
            @test R.OPS[(FAKE, :list, :NodeStat, :cluster)] === FAKE.listfakev1nodestat
            @test R.OP_PARAMS[(FAKE, :get, :NodeStat, :cluster)] == [:name]
            # nothing shipped was displaced
            @test parentmodule(R.KIND_TYPES[("v1", "Pod")]) === R.GROUP_MODULES["v1"]
            @test haskey(R.OPS, (R.GROUP_MODULES["v1"], :list, :Pod, :namespaced))
        end
        @test sizes() == shipped
        @test !haskey(R.GROUP_MODULES, FAKE_GV)
    end

    @testset "the verb layer resolves registered kinds" begin
        with_fake() do _
            ctx = KuberContext()
            ctx.initialized = true                  # pretend discovery ran

            # by explicit apiversion, with no discovery involved at all
            @test Kuber._resolve_module(ctx, :NodeStat, FAKE_GV) === FAKE
            @test kind_to_type(ctx, :NodeStat, FAKE_GV) === FAKE.NodeStat
            key, f, params, scope = Kuber._find_op(FAKE, :get, :NodeStat, "default")
            @test f === FAKE.readfakev1nodestat
            @test params == [:name]
            @test scope === :cluster            # falls back past :namespaced, as before

            # and through discovery, once the group is in ctx.apis
            ctx.apis[:Core] = [R.GROUP_MODULES["v1"]]
            ctx.apis[:FakeKuberTest] = [FAKE]
            Kuber.build_model_api_map(ctx)
            @test ctx.modelapi[:NodeStat] === FAKE
            @test Kuber._resolve_module(ctx, :NodeStat, nothing) === FAKE
            # a kind name two groups declare goes to core, by build order rather
            # than registration order — apiversion= is the way to be explicit
            @test ctx.modelapi[:Pod] === R.GROUP_MODULES["v1"]
            @test Kuber._resolve_module(ctx, :Pod, FAKE_GV) === FAKE
        end
        @test sizes() == shipped
    end

    @testset "registering the same content twice is a no-op" begin
        with_fake() do _
            n = sizes()
            @test Kuber.register!(FakeGroups) == [FAKE]
            @test sizes() == n
        end
        @test sizes() == shipped
    end

    @testset "conflicts are refused" begin
        with_fake() do _
            # another module claiming the group version
            other = FakeGroups.OtherFakeV1
            @test_throws ArgumentError Kuber.register!(;
                group_modules = Dict{String,Module}(FAKE_GV => other),
                module_gvs = Dict{Module,String}(other => FAKE_GV),
                kind_types = Dict{Tuple{String,String},Type}((FAKE_GV, "NodeStat") => other.NodeStat),
                ops = Dict{Tuple{Module,Symbol,Symbol,Symbol},Function}(),
                op_params = Dict{Tuple{Module,Symbol,Symbol,Symbol},Vector{Symbol}}(),
            )
            @test R.GROUP_MODULES[FAKE_GV] === FAKE

            # the same module claiming a second group version
            @test_throws ArgumentError Kuber.register!(;
                group_modules = Dict{String,Module}("fake.kuber.test/v2" => FAKE),
                module_gvs = Dict{Module,String}(FAKE => "fake.kuber.test/v2"),
                kind_types = Dict{Tuple{String,String},Type}(),
                ops = Dict{Tuple{Module,Symbol,Symbol,Symbol},Function}(),
                op_params = Dict{Tuple{Module,Symbol,Symbol,Symbol},Vector{Symbol}}(),
            )
            @test !haskey(R.GROUP_MODULES, "fake.kuber.test/v2")
        end
        # a shipped group version cannot be taken over either
        @test_throws ArgumentError Kuber.register!(;
            group_modules = Dict{String,Module}("v1" => FAKE),
            module_gvs = Dict{Module,String}(FAKE => "v1"),
            kind_types = Dict{Tuple{String,String},Type}(),
            ops = Dict{Tuple{Module,Symbol,Symbol,Symbol},Function}(),
            op_params = Dict{Tuple{Module,Symbol,Symbol,Symbol},Vector{Symbol}}(),
        )
        @test R.GROUP_MODULES["v1"] !== FAKE
        @test sizes() == shipped
    end

    @testset "malformed tables are refused before anything is merged" begin
        T = FakeGroups
        bad = [
            # not a registry module at all
            () -> Kuber.register!(NotARegistry),
            # MODULE_GVS is not the inverse
            () -> Kuber.register!(; T.tables(module_gvs = Dict{Module,String}(FAKE => "other/v1"))...),
            () -> Kuber.register!(; T.tables(module_gvs = Dict{Module,String}())...),
            # the group module has no Client
            () -> Kuber.register!(; T.tables(
                group_modules = Dict{String,Module}(FAKE_GV => NotARegistry),
                module_gvs = Dict{Module,String}(NotARegistry => FAKE_GV))...),
            # a kind in a group version that is not being registered
            () -> Kuber.register!(; T.tables(kind_types = Dict{Tuple{String,String},Type}(
                ("elsewhere/v1", "NodeStat") => FAKE.NodeStat))...),
            # a type that lives in another module
            () -> Kuber.register!(; T.tables(kind_types = Dict{Tuple{String,String},Type}(
                (FAKE_GV, "NodeStat") => FakeGroups.OtherFakeV1.NodeStat))...),
            # an operation without its positional argument names
            () -> Kuber.register!(; T.tables(
                op_params = Dict{Tuple{Module,Symbol,Symbol,Symbol},Vector{Symbol}}())...),
            # an unknown verb, and an unknown scope
            () -> Kuber.register!(; T.tables(
                ops = Dict{Tuple{Module,Symbol,Symbol,Symbol},Function}(
                    (FAKE, :frobnicate, :NodeStat, :cluster) => FAKE.listfakev1nodestat),
                op_params = Dict{Tuple{Module,Symbol,Symbol,Symbol},Vector{Symbol}}(
                    (FAKE, :frobnicate, :NodeStat, :cluster) => Symbol[]))...),
            () -> Kuber.register!(; T.tables(
                ops = Dict{Tuple{Module,Symbol,Symbol,Symbol},Function}(
                    (FAKE, :list, :NodeStat, :everywhere) => FAKE.listfakev1nodestat),
                op_params = Dict{Tuple{Module,Symbol,Symbol,Symbol},Vector{Symbol}}(
                    (FAKE, :list, :NodeStat, :everywhere) => Symbol[]))...),
            # a deprecated /watch/ operation
            () -> Kuber.register!(; T.tables(
                ops = Dict{Tuple{Module,Symbol,Symbol,Symbol},Function}(
                    (FAKE, :list, :NodeStat, :cluster) => FAKE.watchfakev1nodestat),
                op_params = Dict{Tuple{Module,Symbol,Symbol,Symbol},Vector{Symbol}}(
                    (FAKE, :list, :NodeStat, :cluster) => Symbol[]))...),
            # a namespaced operation whose positional arguments skip the namespace
            () -> Kuber.register!(; T.tables(
                ops = Dict{Tuple{Module,Symbol,Symbol,Symbol},Function}(
                    (FAKE, :get, :NodeStat, :namespaced) => FAKE.readfakev1nodestat),
                op_params = Dict{Tuple{Module,Symbol,Symbol,Symbol},Vector{Symbol}}(
                    (FAKE, :get, :NodeStat, :namespaced) => [:name]))...),
            # a cluster-scoped operation that takes one anyway
            () -> Kuber.register!(; T.tables(
                ops = Dict{Tuple{Module,Symbol,Symbol,Symbol},Function}(
                    (FAKE, :get, :NodeStat, :cluster) => FAKE.readfakev1nodestat),
                op_params = Dict{Tuple{Module,Symbol,Symbol,Symbol},Vector{Symbol}}(
                    (FAKE, :get, :NodeStat, :cluster) => [:namespace, :name]))...),
            # a body that is not the last positional argument, and a verb that
            # sends no body at all
            () -> Kuber.register!(; T.tables(
                ops = Dict{Tuple{Module,Symbol,Symbol,Symbol},Function}(
                    (FAKE, :create, :NodeStat, :cluster) => FAKE.readfakev1nodestat),
                op_params = Dict{Tuple{Module,Symbol,Symbol,Symbol},Vector{Symbol}}(
                    (FAKE, :create, :NodeStat, :cluster) => [:body, :name]))...),
            () -> Kuber.register!(; T.tables(
                ops = Dict{Tuple{Module,Symbol,Symbol,Symbol},Function}(
                    (FAKE, :delete, :NodeStat, :cluster) => FAKE.readfakev1nodestat),
                op_params = Dict{Tuple{Module,Symbol,Symbol,Symbol},Vector{Symbol}}(
                    (FAKE, :delete, :NodeStat, :cluster) => [:name, :body]))...),
            # a body for an operation that is not registered
            () -> Kuber.register!(; T.tables(
                op_bodies = Dict{Tuple{Module,Symbol,Symbol,Symbol},Tuple{Type,Vector{String}}}(
                    (FAKE, :create, :NodeStat, :cluster) => (FAKE.NodeStat, ["application/json"])))...),
        ]
        for f in bad
            @test_throws ArgumentError f()
        end
        @test sizes() == shipped        # every rejection was atomic
    end

    @testset "unregister!" begin
        Kuber.register!(FakeGroups)
        @test Kuber.unregister!(FAKE) == [FAKE]                 # by group module
        @test sizes() == shipped
        @test !haskey(R.MODULE_GVS, FAKE)
        @test !any(k -> k[1] == FAKE_GV, keys(R.KIND_TYPES))
        @test !any(k -> k[1] === FAKE, keys(R.OPS))

        @test Kuber.unregister!(FAKE) == Module[]               # idempotent
        @test Kuber.unregister!(NotARegistry) == Module[]       # and lenient

        Kuber.register!(FakeGroups)
        @test Kuber.unregister!(FakeGroups) == [FAKE]           # by registry module
        @test sizes() == shipped

        # what Kuber ships stays put
        @test_throws ArgumentError Kuber.unregister!(R.GROUP_MODULES["v1"])
        @test sizes() == shipped
    end
end
