#!/usr/bin/env bash

if [ $# -ne 1 ]; then
    echo "Usage: generate.sh <path to kubernetes specifications folder>"
    echo "Ensure:"
    echo "  - 'julia' is in PATH or set in environment variable 'JULIA'."
    echo "  - package directory is writable."
    echo "  - CSTParser v2.1.0 is installed."
    echo "Note:"
    echo "  - your current 'src/api' folder in the package will be renamed to 'src/api_bak'"
    echo "  - existing 'src/api_bak' folder if any will be deleted"
    echo "Ref:"
    echo "  - API conventions: https://github.com/kubernetes/community/blob/master/contributors/devel/api-conventions.md"
    echo "  - API: https://kubernetes.io/docs/concepts/overview/kubernetes-api/"
    exit 1
fi

if [ -z "$JULIA" ]
then
    JULIA=julia
fi

# ensure CSTParser is of right version
cstpver=`${JULIA} -e 'using Pkg; println(Pkg.installed()["CSTParser"] == v"2.1.0")'`
if [ "$cstpver" != "true" ]
then
    echo "CSTParser v2.1.0 is required"
    exit -1
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
cp ${DIR}/model_IoK8sApimachineryPkgApisMetaV1Time.jl ${GENDIR}/src/api/
cp ${DIR}/model_IoK8sApimachineryPkgUtilIntstrIntOrString.jl ${GENDIR}/src/api/
