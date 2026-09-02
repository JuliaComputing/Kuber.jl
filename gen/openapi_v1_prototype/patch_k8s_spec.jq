# Bake-pipeline spec patch, robust across k8s group documents:
# 1. meta.v1.Time and meta.v1.MicroTime nullable (wire: lastProbeTime/eventTime
#    arrive as explicit null) — only when the schema is present in the document
# 2. every array-typed property nullable: Go marshals nil slices as JSON null,
#    so ANY array can arrive as null even when the spec calls it required
#    (seen live: CSINodeSpec.drivers)
# 3. every dedicated /watch/ path's application/json response schema -> WatchEvent
(if (.components.schemas | has("io.k8s.apimachinery.pkg.apis.meta.v1.Time"))
 then .components.schemas."io.k8s.apimachinery.pkg.apis.meta.v1.Time".nullable = true
 else . end)
| (if (.components.schemas | has("io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime"))
   then .components.schemas."io.k8s.apimachinery.pkg.apis.meta.v1.MicroTime".nullable = true
   else . end)
| (.components.schemas[] | objects | .properties // empty | .[]
   | objects | select(.type == "array")).nullable = true
| reduce (.paths | keys[] | select(contains("/watch/"))) as $p (.;
    (.paths[$p][] | objects | select(has("responses")) | .responses[]
     | select(has("content")) | .content
     | select(has("application/json")) | ."application/json".schema)
    |= {"$ref": "#/components/schemas/io.k8s.apimachinery.pkg.apis.meta.v1.WatchEvent"})
