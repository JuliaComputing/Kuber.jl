function kuberapi(io::IO, file::String)
    apiname = split(basename(file), ".")[1]
    contents = readstring(file)
    wrapped = """module $apiname
        $contents
    end"""
    kuberapi(io::IO, parse(wrapped))
end

function findtype(X::Expr, what::Symbol)
    (X.head === what) && (return X)
    for x in X.args
        isa(x, Expr) && (x.head === what) && return x
    end
    error("no $what in expression")
end

function foralltype(X::Expr, what::Symbol, fn)
    if X.head === what
        fn(X)
    end
    if :args in fieldnames(X) && !isempty(X.args)
        for Xsub in X.args
            isa(Xsub, Expr) && foralltype(Xsub, what, fn)
        end
    end
end

function emit_alias(io::IO, X::Expr, apidecoration::String)
    callnode = findtype(X, :call)
    fn_name = string(callnode.args[1])
    undec_fn_name = join(split(fn_name, apidecoration))

    (fn_name == undec_fn_name) && return

    kwparams = []
    rhskwparams = []
    try
        kwparams = map(string, findtype(callnode, :parameters).args)
        rhskwparams = map((p)->join(repmat([split(split(p,'=')[1], ':')[1]], 2), '='), kwparams)
    end
    kwargs = isempty(kwparams) ? "" : ("; " * join(kwparams, ", "))
    rhskwargs = isempty(rhskwparams) ? "" : ("; " * join(rhskwparams, ", "))

    params = []
    rhsparams = []
    if length(callnode.args) > 1
        for arg in callnode.args[2:end]
            isa(arg, Expr) && (arg.head == :parameters) && continue
            push!(params, arg)
        end
        params = map(string, params)
        rhsparams = map((p)->split(split(p,'=')[1], ':')[1], params)
    end
    args = isempty(params) ? "" : join(params, ", ")
    rhsargs = isempty(rhsparams) ? "" : join(rhsparams, ", ")

    sig = "($(args)$(kwargs))"
    rhssig = "($(rhsargs)$(rhskwargs))"
    println(io, undec_fn_name, sig, " = ", fn_name, rhssig)
    println(io, "export ", undec_fn_name)
    println(io, "")
    nothing
end

function kuberapi(io::IO, M::Expr)
    mod = findtype(M, :module)
    modblock = findtype(mod, :block)
    typ = findtype(modblock, :type)
    typedecl = findtype(typ, :<:)
    typename = typedecl.args[1]
    stypename = string(typename)

    endswith(stypename, "Api") || return
    apidecoration = stypename[1:(end-3)]

    foralltype(modblock, :function, x->emit_alias(io, x, apidecoration))
    nothing
end

function gen_aliases(folder::String, output::String)
    info("reading $folder/api_*.jl")
    info("generating $output")

    open("$output", "w") do faliases
        for file in readdir(folder)
            if startswith(file, "api_")
                info("    - ", file)
                kuberapi(faliases, joinpath(folder, file))
            end
        end
    end
end

const DIR = dirname(@__FILE__)
gen_aliases(joinpath(DIR, "../src/api"), joinpath(DIR, "../src/apialiases.jl"))
