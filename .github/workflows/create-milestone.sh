#!/bin/bash

repository=$1
title=$2
due_time=$3

milestone=$(curl -XPOST \
  https://api.github.com/repos/${repository}/milestones \
  -H "Authorization: token ${GITHUB_TOKEN}" \
  -H "Content-Type: application/json" \
  -d @- <<EOS
{
  "title": "${title}",
  "state": "open",
  "description": "${title}",
  "due_on": "${due_time}"
}
EOS
)

echo ${milestone} | jq '.number'
