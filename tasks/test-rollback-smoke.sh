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

echo "Testing the rolled back built application on test environment"
cd ${ROOT_FOLDER}/${REPO_RESOURCE}

echo "Retrieving group and artifact id - it can take a while..."
retrieveGroupId
retrieveArtifactId
projectGroupId=$( retrieveGroupId )
projectArtifactId=$( retrieveArtifactId )
mkdir target
logInToCf ${REDOWNLOAD_INFRA} ${CF_TEST_USERNAME} ${CF_TEST_PASSWORD} ${CF_TEST_ORG} ${CF_TEST_SPACE} ${CF_API_URL}
propagatePropertiesForTests ${projectArtifactId}
readTestPropertiesFromFile

echo "Resolving latest prod tag"
LATEST_PROD_TAG=$( findLatestProdTag )

echo "Retrieved application and stub runner urls"
if [[ -z "${LATEST_PROD_TAG}" || "${LATEST_PROD_TAG}" == "master" ]]; then
    echo "No prod release took place - skipping this step"
else
    git checkout "${LATEST_PROD_TAG}"
    . ${SCRIPTS_OUTPUT_FOLDER}/test_rollback_smoke.sh
fi
