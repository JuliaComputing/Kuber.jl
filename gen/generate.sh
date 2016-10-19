#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "Usage: generage.sh <path to kubernetes specifications folder>"
    exit 1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
GENDIR="$( readlink -e "${DIR}/../" )"
SPECDIR=$1
SPECFILE=root_swagger.json
SWAGGERDIR=`julia -e 'println(Pkg.dir("Swagger"))'`

echo "Swagger is at $SWAGGERDIR"
echo "Generating into $GENDIR"
${SWAGGERDIR}/plugin/generate.sh -i ${SPECDIR}/${SPECFILE} -o ${GENDIR} -c ${DIR}/config.json

# model for Patch is not generated because of https://github.com/swagger-api/swagger-codegen/issues/2856
# add a hand coded module for now
cp ${DIR}/model_unversioned_Patch.jl ${GENDIR}/src/
rm ${GENDIR}/LICENSE
