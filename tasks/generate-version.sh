#!/bin/bash

VERSION=1.0.0.M1-`date +%Y%m%d_%H%M%S`-VERSION
#VERSION=1.0.0.M1
MESSAGE="[Concourse CI] Bump to Next Version ($VERSION)"

cd out

cp -r ../version/. ./
echo "Bump to ${VERSION}"
echo "${VERSION}" > version

apt-get update && yes | apt-get install git

git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git add version
git commit -m "${MESSAGE}"
