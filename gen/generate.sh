#!/usr/bin/env bash

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "Usage: generate.sh <path to kubernetes specifications folder> [output path]"
    echo "  - output path is optional, if not specified '../src/ApiImpl/api' folder relative to this script will be used"
    echo "Ensure:"
    echo "  - 'julia' is in PATH or set in environment variable 'JULIA'."
    echo "  - package directory is writable."
    echo "  - CSTParser v3.3.0 is installed."
    echo "Note:"
    echo "  - the 'api' folder in the output path will be renamed to 'api_bak'"
    echo "  - existing 'api_bak' folder if any in output folder will be deleted"
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
cstpver=`${JULIA} -e 'using Pkg, UUIDs; println(Pkg.dependencies()[UUID("00ebfdb7-1f24-5e51-bd34-a7502290713f")].version == v"3.3.0")'`
if [ "$cstpver" != "true" ]
then
    echo "CSTParser v3.3.0 is required"
    exit -1
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SPECDIR=$1
if [ $# -eq 2 ]; then
    APIIMPLDIR=$2
else
    GENDIR="$( cd "$( dirname "${DIR}" )" && pwd )"
    APIIMPLDIR=${GENDIR}/src/ApiImpl
fi
#TEMPGENDIR=${GENDIR}/_tmp
TEMPGENDIR=`mktemp -d`
#SPECFILE=root_swagger.json
SPECFILE=swagger.json
SWAGGERDIR=`${JULIA} -e 'import Swagger; print(normpath(joinpath(dirname(pathof(Swagger)), "..")))'`

echo "Swagger is at $SWAGGERDIR"
echo "Generating into $TEMPGENDIR, moving into $APIIMPLDIR"
mkdir -p ${TEMPGENDIR}
${SWAGGERDIR}/plugin/generate.sh -i ${SPECDIR}/${SPECFILE} -o ${TEMPGENDIR} -c ${DIR}/config.json
rm -rf ${APIIMPLDIR}/api_bak
mv ${APIIMPLDIR}/api ${APIIMPLDIR}/api_bak
mkdir ${APIIMPLDIR}/api
mv ${TEMPGENDIR}/src/* ${APIIMPLDIR}/api/
mv ${TEMPGENDIR}/*.jl ${APIIMPLDIR}/api/
rm ${TEMPGENDIR}/LICENSE
rm -r ${TEMPGENDIR}

${JULIA} ${DIR}/genapialiases.jl ${APIIMPLDIR}
${JULIA} ${DIR}/gentypealiases.jl ${APIIMPLDIR}

# the following models are not generated correctly by Swagger, hand code them for now
cp ${DIR}/model_IoK8sApimachineryPkgApisMetaV1Time.jl ${APIIMPLDIR}/api/
cp ${DIR}/model_IoK8sApimachineryPkgUtilIntstrIntOrString.jl ${APIIMPLDIR}/api/
cp ${DIR}/model_IoK8sApimachineryPkgApisMetaV1WatchEvent.jl ${APIIMPLDIR}/api/
