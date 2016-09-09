#!/bin/bash

export ROOT_FOLDER=$( pwd )
export REPO_RESOURCE=repo
export TOOLS_RESOURCE=tools
export CONCOURSE_RESOURCE=concourse
export VERSION_RESOURCE=version
export OUTPUT_RESOURCE=out

echo "Root folder is [${ROOT_FOLDER}]"
echo "Repo resource folder is [${REPO_RESOURCE}]"
echo "Tools resource folder is [${TOOLS_RESOURCE}]"
echo "Concourse resource folder is [${CONCOURSE_RESOURCE}]"
echo "Version resource folder is [${VERSION_RESOURCE}]"

source ${ROOT_FOLDER}/${CONCOURSE_RESOURCE}/tasks/pipeline.sh

echo "Generating settings.xml for Maven in local m2"
. ${ROOT_FOLDER}/${CONCOURSE_RESOURCE}/tasks/generate-settings.sh

echo "Building and uploading the projects artifacts"
cd ${REPO_RESOURCE}

# settings.xml should come with the box, I can't deploy the artifacts
#./mvnw clean verify deploy -Dversion=${PIPELINE_VERSION}
#./mvnw clean verify install -Dversion=${PIPELINE_VERSION}

echo "Tagging the project with dev tag"
echo "dev/${PIPELINE_VERSION}" > ${ROOT_FOLDER}/${OUTPUT_RESOURCE}/tag

# WE CAN USE OUTPUT TO ARCHIVE THE RESULTS?
#mkdir -p ${OUTPUT_RESOURCE}/junit
#find . -type f -regex ".*/target/.*-reports/.*" -exec cp {} ${OUTPUT_RESOURCE}/junit/ \;
