using CSTParser

"""
Represents one API alias.

LHS is the undecorated function name
RHS is the API version specific function name
"""
struct KuberAPIAlias
    lhs_fn_name::String
    rhs_fn_name::String
    args::Vector{Pair{String,String}}
    kwargs::Vector{Pair{String,String}}
end

"""
List of all aliases parsed.
Used to maintain state and write out the aliases file at the end.
"""
const KuberAPIAliasesSet = Dict{String,Vector{KuberAPIAlias}}

"""
Returns one `KuberAPIAlias` instance for the function expression.
Returns `nothing` if it is not required to have an alias for the function.
"""
function emit_alias(fn_expr::CSTParser.EXPR, api_decoration::String)
    fn_name = CSTParser.str_value(CSTParser.get_name(fn_expr))
    undec_fn_name = join(split(fn_name, api_decoration))

    (fn_name == undec_fn_name) && (return nothing)
    fn_sig = CSTParser.get_sig(fn_expr)
    fn_args = filter(x->((x.typ === CSTParser.BinaryOpCall) || (x.typ === CSTParser.IDENTIFIER)), fn_sig.args[3:end])
    fn_kwargs_container = filter(x->(x.typ === CSTParser.Parameters), fn_sig.args[3:end])
    fn_kwargs = isempty(fn_kwargs_container) ? [] : filter(x->(x.typ === CSTParser.Kw), fn_kwargs_container[1].args)

    arg_pairs = map(x->CSTParser.str_value(CSTParser.get_name(x))=>((x.typ === CSTParser.IDENTIFIER) ? "" : CSTParser.str_value(x.args[3])), fn_args)
    kwarg_pairs = map(x->CSTParser.str_value(CSTParser.get_name(x.args[1]))=>CSTParser.str_value(x.args[3]), fn_kwargs)

    KuberAPIAlias(undec_fn_name, fn_name, arg_pairs, kwarg_pairs)
end

"""
Returns all API aliases detected in the specified file.
"""
function kuberapi(file::String)
    api_decoration = ""
    aliases = Vector{KuberAPIAlias}()

    x, ps = CSTParser.parse(ParseState(String(readchomp(file))))

    while !ps.done
        if CSTParser.defines_struct(x)
            structsig = CSTParser.get_sig(x)
            if structsig.typ === CSTParser.BinaryOpCall
                op = structsig.args[2]
                if CSTParser.is_issubt(op)
                    subtyp = CSTParser.str_value(CSTParser.get_name(structsig.args[3]))
                    if subtyp == "SwaggerApi"
                        typename = CSTParser.str_value(CSTParser.get_name(structsig.args[1]))
                        if endswith(typename, "Api")
                            api_decoration = typename[1:(end-3)]
                        end
                    end
                end
            end
        elseif !isempty(api_decoration)
            # Note: We are guaranteed to receive the struct definition before methods
            #       because of the sequence in which Swagger code is generated and also
            #       because of the Julia restriction of type being defined before use
            fn_expr = ((x.typ === CSTParser.MacroCall) && CSTParser.defines_function(x.args[3])) ? x.args[3] : CSTParser.defines_function(x) ? x : nothing
            if fn_expr !== nothing
                fn_name = CSTParser.str_value(CSTParser.get_name(fn_expr))
                if !startswith(fn_name, "_swaggerinternal_")
                    alias = emit_alias(fn_expr, api_decoration)
                    (alias === nothing) || push!(aliases, alias)
                end
            end
        end
        x, ps = CSTParser.parse(ps)
    end

    aliases
end

function detect_aliases(folder::String)
    aliases_set = KuberAPIAliasesSet()

    for file in filter(x->startswith(x, "api_"), readdir(folder))
        @info("    - " * file)
        for alias in kuberapi(joinpath(folder, file))
            @info("        - " * alias.lhs_fn_name * " => " * alias.rhs_fn_name)
            push!(get!(()->Vector{KuberAPIAlias}(), aliases_set, alias.lhs_fn_name), alias)
        end
    end
    @info("got $(length(aliases_set)) sets with $(sum(map(length, values(aliases_set)))) aliases")
    aliases_set
end

function gen_aliases(folder::String, output::String)
    @info("reading $folder/api_*.jl")
    @info("generating $output")

    aliases_set = detect_aliases(folder)

    open("$output", "w") do faliases
        for (api_name, api_aliases) in aliases_set
            println(faliases, "# ", api_name)
            for api_alias in api_aliases
                if isempty(api_alias.args)
                    lhs_args = rhs_args = ""
                else
                    lhs_args = join(map(x->(isempty(x[2]) ? x[1] : join(x,"::")), api_alias.args), ", ")
                    rhs_args = join(map(x->x[1], api_alias.args), ", ")
                end
                if isempty(api_alias.kwargs)
                    lhs_kwargs = rhs_kwargs = ""
                else
                    lhs_kwargs = "; " * join(map(x->join(x,'='), api_alias.kwargs), ", ")
                    rhs_kwargs = "; " * join(map(x->join((x[1],x[1]),'='), api_alias.kwargs), ", ")
                end
                println(faliases, api_alias.lhs_fn_name, "(", lhs_args, lhs_kwargs, ") = ", api_alias.rhs_fn_name, "(", rhs_args, rhs_kwargs, ")")
            end
            println(faliases, "export ", api_name, "\n")
        end
    end
end

function main()
    DIR = dirname(@__FILE__)
    gen_aliases(joinpath(DIR, "../src/ApiImpl/api"), joinpath(DIR, "../src/ApiImpl/apialiases.jl"))
end

main()
