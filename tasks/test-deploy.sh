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

PIPELINE_VERSION=1.0.0.M1

echo "Testing the built application on test environment"
cd ${ROOT_FOLDER}/${REPO_RESOURCE}
. ${SCRIPTS_OUTPUT_FOLDER}/test_deploy.sh
