
convert{T<:SwaggerModel}(::Type{T}, json::String) = convert(T, JSON.parse(json))

is_json_mime(mime::String) = ("*/*" == mime) || ismatch(r"(?i)application/json(;.*)?", mime)

function kuber_type(T, resp::Response)
    ctype = get(resp.headers, "Content-Type", "application/json")
    !is_json_mime(ctype) && return T
    kuber_type(T, String(resp.data))
end

function kuber_type(T, data::String)
    j = JSON.parse(data)
    try
        if "kind" in keys(j)
            T = eval(Symbol(j["kind"]))
        end
    catch
        println(STDERR, "Type not found: $(j["kind"]) in JSON $data")
    end
    T
end

macro K_str(s)
    quote
        j = JSON.parse($s)
        convert(eval(Symbol(j["kind"])), j)
    end
end

##
# default global context to make apis easy

const DEFAULT_NAMESPACE = "default"
const DEFAULT_URI = "http://localhost:8001/"

type KuberContext
    api::DefaultApi
    namespace::String

    function KuberContext()
        new(DefaultApi(Swagger.Client(DEFAULT_URI)), DEFAULT_NAMESPACE)
    end
end

const _global_ctx = KuberContext()

function set_server(uri::String=DEFAULT_URI)
    global _global_ctx
    client = Swagger.Client(uri; get_return_type=kuber_type)
    _global_ctx.api = DefaultApi(client)
end

function set_ns(namespace::String)
    global _global_ctx
    _global_ctx.namespace = namespace
end

# generate easy wrappers
for fn in (:get, :put!, :update!, :delete!)
    @eval begin
        $fn{T<:SwaggerModel}(::Type{T}, args...; kwargs...) = $fn(_global_ctx, T, args...; kwargs...)
        $fn{T<:SwaggerModel}(t::T, args...; kwargs...) = $fn(_global_ctx, t, args...; kwargs...)

        $fn{T<:SwaggerModel}(f::Function, ::Type{T}, args...; kwargs...) = f($fn(_global_ctx, T, args...; kwargs...))
        $fn{T<:SwaggerModel}(f::Function, t::T, args...; kwargs...) = f($fn(_global_ctx, t, args...; kwargs...))
    end
end
