#!/bin/bash

CREDENTIALS=${1:-credentials.yml}

echo y | fly -t main sp -p sample-pipeline -c pipeline.yml -l ${CREDENTIALS}
