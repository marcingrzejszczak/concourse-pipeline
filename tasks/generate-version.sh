#!/bin/bash

#VERSION=1.0.0.RELEASE-`date +%Y%m%d_%H%M%S`-VERSION
VERSION=1.0.0.M1
MESSAGE="[Concourse CI] Bump to Next Version ($VERSION)"

ls -al version/
cd out

mv -f ../version/* ./
ls -al
echo "Bump to ${VERSION}"
echo "${VERSION}" > version
#git init
#git remote add -f version ${APP_URL}
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git add version
git commit -m "${MESSAGE}"
