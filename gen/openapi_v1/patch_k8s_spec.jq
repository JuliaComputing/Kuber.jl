# Spec patch for the trial's generation pipeline — the "middle path" of
# OpenAPIv1TrialBranchPlan.md §2.2: nullable rules only, no /watch/ path
# rewriting. Watching goes through the regular list operations with
# `watch=true` plus an accept-scoped codec (§4.5), so the deprecated /watch/
# paths — and the 70-path rewrite the prototype needed for them — are not
# involved.
#
# Every rule is guarded, so the patch applies cleanly to documents that lack
# the schema (including CRD-backed group documents).
#
# 1. meta.v1.Time nullable      — wire: "lastProbeTime": null
# 2. meta.v1.MicroTime nullable — wire: "eventTime": null
# 3. every array-typed property nullable: Go marshals nil slices as JSON null,
#    so ANY array can arrive null even when the spec calls it required
#    (seen live: CSINodeSpec.drivers on storage.k8s.io/v1)
# 4. request bodies documented as `*/*` become `application/json`. k8s declares
#    `*/*` for every create/replace body (and for the optional DeleteOptions
#    body), which is not a media type a client can encode to: the runtime has no
#    `*/*` encoder and would send `Content-Type: */*` even if it did. We always
#    send JSON, and k8s always accepts it, so saying so makes the document true.
#    Patch bodies are untouched — those name their five media types explicitly.
# 5. DELETE 2xx response schemas become the empty schema (anything). k8s
#    documents `Status`, but a delete usually answers with the deleted object
#    instead (verified live: deleting a Job returns the Job), so strict decoding
#    against `Status` fails on `/status` — an object where Status wants a string.
#    This is the lie the old client's get_return_type payload sniffing hid.
#    `oneOf: [Status, resource]` was tried and rejected: the generator emits one
#    wrapper type per response code per media type (eight for a single delete).
#    The empty schema says what is actually true — we do not know which of two
#    shapes will arrive — and Kuber restores the type from the payload's
#    kind/apiVersion through KIND_TYPES, the same second-stage decode watch
#    frames use. Strict validation stays on everywhere.
# 6. `application/json-patch+json` request bodies become an array. k8s documents
#    ONE schema — meta.v1.Patch, `type: object` — for all five patch media types,
#    but a JSON Patch body is an array of operations (RFC 6902), never an object.
#    The generated Patch model can only hold an object, so every consumer that
#    patches with `[Dict("op" => "replace", …)]` — which is every json-patch
#    caller in JuliaRun and JobLoops — failed to encode. The array is declared
#    once as a component (meta.v1.JSONPatch) and referenced, rather than inlined
#    per operation: inlining makes the generator emit one item type per patch
#    operation (132 of them in apps/v1 alone, +27 KiB), the shared component
#    emits one (+3.4 KiB). Items stay `type: object` with no required keys —
#    `move`/`copy` use `from`, `remove` has no `value`, so anything stricter
#    would reject valid patches under strict request validation.
# 7. `allOf`-wrapped `$ref`s collapse to the `$ref`. k8s never writes a bare
#    `$ref` for a property: it wraps it in a single-element `allOf` so it can
#    hang a `description` (and often `default: {}`) beside it, because a `$ref`
#    with siblings is undefined in OAS 3.0. The generator reads that wrapper as
#    a *new* schema and mints a type for it, named after its position — so
#    `Pod.spec` was `IoK8sApiCoreV1PodSpec2` (the `2` disambiguating it from the
#    real `PodSpec`, which nothing referenced), every kind had its own
#    `…Metadata` instead of the shared `ObjectMeta`, and every `…List.items` had
#    its own element type instead of the kind's own — `PodList.items` was
#    `Vector{IoK8sApiCoreV1PodListItemsItem}`, so `item isa
#    kind_to_type(ctx, :Pod)` was false (OpenAPIv1ConsumerGaps.md G18). On
#    `master` those were all one type, so it was a regression.
#
#    1290 sites across the 18 documents, in exactly two positions: property
#    schemas and the `items` of array properties. Both are scoped explicitly
#    rather than walked recursively, because `apiextensions`' `JSONSchemaProps`
#    describes JSON Schema itself and so has *properties named* `allOf`,
#    `nullable` and `items` — a recursive walk rewrites that map and corrupts
#    the CRD document.
#
#    Guarded on the shape rather than trusting the survey: collapse only a
#    single-element `allOf` whose element is a bare `$ref`. A future spec that
#    introduces a two-element `allOf`, or a `$ref` carrying siblings inside it,
#    is left alone to be noticed rather than silently mangled. No `allOf` in
#    either position carries `nullable`, so nothing nullable is dropped by this.
# 8. `resourceVersion` is declared on single-object read operations. k8s
#    documents it on every *list* operation and on none of the reads, but the
#    apiserver honours it on both — verified live: `GET …/configmaps/x?
#    resourceVersion=0` answers 200, and a version the cluster has never reached
#    answers 504 "Too large resource version". So a consumer asking for a read
#    "not older than" a version it already saw — which is what `K8sReflector`
#    does (`K8sReflector.jl:136-141`) — had no parameter to send (G17).
#
#    Added only to paths ending in `{name}`: the object read itself, not
#    subresources like `pods/log`, where a resource version is meaningless. 31
#    operations in core v1, none of which declared it already.
#
#    Held back until G19/G20 were settled, because the natural failure of this
#    parameter is a 504 that blocks for the apiserver's wait, and until then the
#    retry budget multiplied that by five without `max_tries` bounding it.
#
# Expect this list to grow: a strict-validation failure against a real cluster
# is signal that the spec lies about another field, and the fix is a new rule
# here — never validate_responses=false.
def collapse_allof:
  if type == "object" and has("allOf") and (.allOf | type == "array")
     and (.allOf | length) == 1 and (.allOf[0] | keys) == ["$ref"]
  then {"$ref": .allOf[0]["$ref"]}
  else . end;
(if (.components.schemas | has("io.k8s.apimachinery.pkg.apis.meta.v1.Time"))
 then .components.schemas."io.k8s.apimachinery.pkg.apis.meta.v1.Time".nullable = true
 else . end)
| (if (.components.schemas | has("io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime"))
   then .components.schemas."io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime".nullable = true
   else . end)
| (.components.schemas[] | objects | .properties // empty | .[]
   | objects | select(.type == "array")).nullable = true
| (.paths[]? | objects | .[]? | objects | select(has("requestBody")) | .requestBody
   | objects | select(.content | has("*/*")) | .content)
  |= with_entries(if .key == "*/*" then .key = "application/json" else . end)
| (if ([.paths[]? | objects | .patch? | objects | .requestBody? | objects
        | .content? | objects | has("application/json-patch+json")] | any)
   then .components.schemas["io.k8s.apimachinery.pkg.apis.meta.v1.JSONPatch"] =
          {"description": "A JSON Patch document (RFC 6902): the sequence of operations to apply to the target object.",
           "type": "array", "items": {"type": "object"}}
   else . end)
| (.paths[]? | objects | .patch? | objects | .requestBody? | objects
   | .content? | objects | .["application/json-patch+json"]? | objects | .schema)
  = {"$ref": "#/components/schemas/io.k8s.apimachinery.pkg.apis.meta.v1.JSONPatch"}
| (.components.schemas[]? | objects | .properties? | objects | .[]) |= collapse_allof
| (.components.schemas[]? | objects | .properties? | objects | .[]
   | objects | select(.type == "array") | .items?) |= collapse_allof
| reduce (.paths | keys[]) as $p (.;
    if (($p | endswith("{name}")) and (.paths[$p] | has("get"))
        and ([.paths[$p].get.parameters[]?.name] | index("resourceVersion") | not))
    then .paths[$p].get.parameters = ((.paths[$p].get.parameters // []) + [{
           "description": "resourceVersion sets a constraint on what resource versions a request may be served from. See https://kubernetes.io/docs/reference/using-api/api-concepts/#resource-versions for details.\n\nDefaults to unset",
           "in": "query",
           "name": "resourceVersion",
           "schema": {"type": "string", "uniqueItems": true}}])
    else . end)
| reduce (.paths | keys[]) as $p (.;
    if (.paths[$p] | has("delete"))
    then reduce (.paths[$p].delete.responses | to_entries[]
                 | select(.key | startswith("2")) | .key) as $c (.;
           if (.paths[$p].delete.responses[$c] | has("content"))
           then (.paths[$p].delete.responses[$c].content) |= with_entries(.value.schema = {})
           else . end)
    else . end)
