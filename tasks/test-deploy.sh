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

echo "Testing the built application on test environment"
. ./${SCRIPTS_OUTPUT_FOLDER}/test_deploy.sh
