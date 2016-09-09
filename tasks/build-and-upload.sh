#!/bin/bash

source pipeline.sh

echo "Generating settings.xml for Maven in local m2"
. ./generate-settings.sh

echo "Building and uploading the projects artifacts"
. ./${SCRIPTS_OUTPUT_FOLDER}/build-and-upload.sh

echo "Tagging the project with dev tag"
git tag dev/${PIPELINE_VERSION} -a -m "[Concourse CI] Dev version (${PIPELINE_VERSION})"

mkdir -p ${OUTPUT_RESOURCE}/junit
find . -type f -regex ".*/target/.*-reports/.*" -exec cp {} ${OUTPUT_RESOURCE}/junit/ \;
