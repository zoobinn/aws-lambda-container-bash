#!/bin/sh
function handler () {
  set -e
  EVENT_DATA=$1
  echo "0-$EVENT_DATA" 1>&2;
  echo "A-$EVENT_DATA" 1>&2;
  echo "B-ANOTHER-ID:$AWS_ACCESS_KEY_ID" 1>&2;
  echo "C-Try" 1>&2;
  aws sts get-caller-identity --output text 1>&2;
  aws s3 ls --output text 1>&2;
  jq --version 1>&2;
  echo $EVENT_DATA | jq '.key1' 1>&2;
  echo "F-{\"success\": true}"
}
