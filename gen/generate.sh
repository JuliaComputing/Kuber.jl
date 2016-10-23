#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "Usage: generage.sh <path to kubernetes specifications folder>"
    exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
GENDIR="$( readlink -e "${DIR}/../" )"
TEMPGENDIR=${GENDIR}/_tmp
SPECDIR=$1
SPECFILE=root_swagger.json
SWAGGERDIR=`julia -e 'println(Pkg.dir("Swagger"))'`

echo "Swagger is at $SWAGGERDIR"
echo "Generating into $TEMPGENDIR, moving into $GENDIR"
mkdir -p ${TEMPGENDIR}
${SWAGGERDIR}/plugin/generate.sh -i ${SPECDIR}/${SPECFILE} -o ${TEMPGENDIR} -c ${DIR}/config.json
mv ${TEMPGENDIR}/src/* ${GENDIR}/src/api/
rm ${TEMPGENDIR}/LICENSE
rm -r ${TEMPGENDIR}

# model for Patch is not generated because of https://github.com/swagger-api/swagger-codegen/issues/2856
# add a hand coded module for now
cp ${DIR}/model_unversioned_Patch.jl ${GENDIR}/src/api/
# the following models are not generated correctly by Swagger, hand code them for now
cp ${DIR}/model_resource_Quantity.jl ${GENDIR}/src/api/
cp ${DIR}/model_unversioned_Time.jl ${GENDIR}/src/api/
cp ${DIR}/model_intstr_IntOrString.jl ${GENDIR}/src/api/
