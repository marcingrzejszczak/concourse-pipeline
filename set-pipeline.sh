#!/bin/bash

echo y | fly -t tutorial sp -p demo -c pipeline.yml -l credentials.yml
