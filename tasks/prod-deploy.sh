#!/bin/bash

export ROOT_FOLDER=$( pwd )
export REPO_RESOURCE=repo
export TOOLS_RESOURCE=tools
export CONCOURSE_RESOURCE=concourse
export VERSION_RESOURCE=version
export OUTPUT_RESOURCE=output

echo "Root folder is [${ROOT_FOLDER}]"
echo "Repo resource folder is [${REPO_RESOURCE}]"
echo "Tools resource folder is [${TOOLS_RESOURCE}]"
echo "Concourse resource folder is [${CONCOURSE_RESOURCE}]"
echo "Version resource folder is [${VERSION_RESOURCE}]"

source ${ROOT_FOLDER}/${CONCOURSE_RESOURCE}/tasks/pipeline.sh

# Should come with the image
apt-get update && yes | apt-get install curl

echo "Deploying the built application on prod environment"
cd ${ROOT_FOLDER}/${REPO_RESOURCE}

echo "Retrieving group and artifact id - it can take a while..."
retrieveGroupId
retrieveArtifactId
. ${SCRIPTS_OUTPUT_FOLDER}/prod_deploy.sh

echo "Tagging the project with prod tag"
mkdir -p ${ROOT_FOLDER}/${REPO_RESOURCE}/target/
echo "prod/${PIPELINE_VERSION}" > ${ROOT_FOLDER}/${REPO_RESOURCE}/target/tag
cp -r ${ROOT_FOLDER}/${REPO_RESOURCE}/. ${ROOT_FOLDER}/${OUTPUT_RESOURCE}/
