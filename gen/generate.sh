#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "Usage: generate.sh <path to kubernetes specifications folder>"
    exit 1
fi

if [ -z "$JULIA" ]
then
    JULIA=julia
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
GENDIR="$( readlink -e "${DIR}/../" )"
TEMPGENDIR=${GENDIR}/_tmp
SPECDIR=$1
#SPECFILE=root_swagger.json
SPECFILE=swagger.json
SWAGGERDIR=`${JULIA} -e 'import Swagger; print(normpath(joinpath(dirname(pathof(Swagger)), "..")))'`

echo "Swagger is at $SWAGGERDIR"
echo "Generating into $TEMPGENDIR, moving into $GENDIR"
mkdir -p ${TEMPGENDIR}
${SWAGGERDIR}/plugin/generate.sh -i ${SPECDIR}/${SPECFILE} -o ${TEMPGENDIR} -c ${DIR}/config.json
rm -rf ${GENDIR}/src/api_bak
mv ${GENDIR}/src/api ${GENDIR}/src/api_bak
mkdir ${GENDIR}/src/api
mv ${TEMPGENDIR}/src/* ${GENDIR}/src/api/
rm ${TEMPGENDIR}/LICENSE
rm -r ${TEMPGENDIR}

${JULIA} ${DIR}/genapialiases.jl
${JULIA} ${DIR}/gentypealiases.jl

# the following models are not generated correctly by Swagger, hand code them for now
cp ${DIR}/model_io_k8s_apimachinery_pkg_api_resource_Quantity.jl ${GENDIR}/src/api/
cp ${DIR}/model_io_k8s_apimachinery_pkg_apis_meta_v1_Time.jl ${GENDIR}/src/api/
cp ${DIR}/model_io_k8s_apimachinery_pkg_util_intstr_IntOrString.jl ${GENDIR}/src/api/
