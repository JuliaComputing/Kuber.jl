#!/usr/bin/env bash

if [ $# -lt 1 ] || [ $# -gt 2 ]; then
    echo "Usage: generate.sh <path to kubernetes specifications folder> [output path]"
    echo "  - output path is optional, if not specified '../src/ApiImpl/api' folder relative to this script will be used"
    echo "Ensure:"
    echo "  - 'julia' is in PATH or set in environment variable 'JULIA'."
    echo "  - 'java' is in PATH or set in environment variable 'JAVA_CMD'."
    echo "  - 'openapi-generator-cli.jar' is in CLASSPATH or set in environment variable 'JAVA_CMD'."
    echo "  - package directory is writable."
    echo "Note:"
    echo "  - the 'api' folder in the output path will be renamed to 'api_bak'"
    echo "  - existing 'api_bak' folder if any in output folder will be deleted"
    exit 1
fi

if [ -z "$JULIA" ]
then
    JULIA=julia
fi

if [ -z "$JAVA_CMD" ]
then
    JAVA_CMD="java -jar openapi-generator-cli.jar"
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SPECDIR=$1
if [ $# -eq 2 ]; then
    APIIMPLDIR=$2
else
    GENDIR="$( cd "$( dirname "${DIR}" )" && pwd )"
    APIIMPLDIR=${GENDIR}/src/ApiImpl
fi
TEMPGENDIR=`mktemp -d`
mkdir -p ${TEMPGENDIR}
SPECFILE=swagger.json

echo "Generating into $TEMPGENDIR, moving into $APIIMPLDIR"

${JAVA_CMD} generate \
    -i ${SPECDIR}/${SPECFILE} \
    -g julia-client \
    -o ${TEMPGENDIR} \
    --additional-properties=packageName=Kubernetes \
    --additional-properties=exportModels=true \
    --additional-properties=exportOperations=true

rm -rf ${APIIMPLDIR}/api_bak
mv ${APIIMPLDIR}/api ${APIIMPLDIR}/api_bak
mkdir -p ${APIIMPLDIR}/api
mv ${TEMPGENDIR}/src/* ${APIIMPLDIR}/api/
rm -rf ${TEMPGENDIR}

${JULIA} ${DIR}/detect_apis_and_types.jl ${APIIMPLDIR}
