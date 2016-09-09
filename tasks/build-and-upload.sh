#!/bin/bash

export ROOT_FOLDER=$( pwd )
export REPO_RESOURCE=repo
export SCRIPTS_OUTPUT_FOLDER=${ROOT_FOLDER}/${REPO_RESOURCE}/ciscripts
export TOOLS_RESOURCE=tools
export VERSION_RESOURCE=version
export OUTPUT_RESOURCE=output

echo "Root folder is [${ROOT_FOLDER}]"
echo "Repo resource folder is [${REPO_RESOURCE}]"
echo "Tools resource folder is [${TOOLS_RESOURCE}]"
echo "Version resource folder is [${VERSION_RESOURCE}]"
echo "Scripts will be copied to [${SCRIPTS_OUTPUT_FOLDER}]"

source "${TOOLS_RESOURCE}"/tasks/pipeline.sh

echo "Generating settings.xml for Maven in local m2"
. ./generate-settings.sh

echo "Building and uploading the projects artifacts"
. ./${SCRIPTS_OUTPUT_FOLDER}/build-and-upload.sh

echo "Tagging the project with dev tag"
git tag dev/${PIPELINE_VERSION} -a -m "[Concourse CI] Dev version (${PIPELINE_VERSION})"
yes | git push origin --tags

mkdir -p ${OUTPUT_RESOURCE}/junit
find . -type f -regex ".*/target/.*-reports/.*" -exec cp {} ${OUTPUT_RESOURCE}/junit/ \;
