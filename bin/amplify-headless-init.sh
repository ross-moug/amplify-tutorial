#!/usr/bin/env sh
set -e
IFS='|'

AMPLIFY="{\"projectName\":\"amplifyTutorial\", \"envName\":\"dev\"}"
ANGULAR="{ \"SourceDir\":\"src\", \"DistributionDir\":\"dist/amplify-tutorial\", \"BuildCommand\":\"npm.cmd run-script build\", \"StartCommand\":\"ng serve\" }"
FRONTEND="{\"frontend\": \"javascript\", \"framework\": \"angular\", \"config\": $ANGULAR}"

mkdir ~/.aws
echo "[default]" > ~/.aws/credentials
echo "aws_access_key_id=$AWS_ACCESS_KEY_ID" >> ~/.aws/credentials
echo "aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" >> ~/.aws/credentials
echo "" >> ~/.aws/credentials

echo "[default]" > ~/.aws/config
echo "region=$AWS_DEFAULT_REGION" >> ~/.aws/config
echo "" >> ~/.aws/config

AWSCLOUDFORMATION="{\
    \"configLevel\":\"project\",\
    \"useProfile\":true,\
    \"profileName\":\"default\"\
    }"

PROVIDERS="{
      \"awscloudformation\":$AWSCLOUDFORMATION
      }"

amplify init \
  --amplify $AMPLIFY \
  --frontend $FRONTEND \
  --providers $PROVIDERS \
  --yes
