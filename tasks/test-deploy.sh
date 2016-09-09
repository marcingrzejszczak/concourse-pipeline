#!/bin/bash

source pipeline.sh

echo "Testing the built application on test environment"
. ./${SCRIPTS_OUTPUT_FOLDER}/test_deploy.sh
