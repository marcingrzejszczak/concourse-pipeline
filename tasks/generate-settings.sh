#!/bin/bash

[[ -z "${M2_REPO}" ]] && M2_REPO=~/.m2/

mkdir -p ${M2_REPO}

echo "Writing settings xml"

#set +x
cat > ${M2_REPO}/settings.xml <<EOF

<settings xmlns="http://maven.apache.org/SETTINGS/1.0.0"
      xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation="http://maven.apache.org/SETTINGS/1.0.0
                          https://maven.apache.org/xsd/settings-1.0.0.xsd">
      <servers>
        <server>
          <id>${M2_SETTINGS_REPO_ID}</id>
          <username>${M2_SETTINGS_REPO_USERNAME}</username>
          <password>${M2_SETTINGS_REPO_PASSWORD}</password>
        </server>
      </servers>
</settings>

EOF
#set -x

cat ${M2_REPO}/settings.xml

echo "Settings xml written"