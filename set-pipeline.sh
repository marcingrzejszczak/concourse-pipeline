#!/bin/bash

CREDENTIALS=${1:-credentials.yml}

echo y | fly -t tutorial sp -p demo -c pipeline.yml -l ${CREDENTIALS}
