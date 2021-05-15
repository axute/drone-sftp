#!/bin/bash
mkdir -p ~/.ssh
touch ~/.ssh/config
echo "Host *
  StrictHostKeyChecking no" > ~/.ssh/config

export LFTP_PASSWORD="${PLUGIN_PASSWORD}"
lftp --env-password "sftp://${PLUGIN_USERNAME}@${PLUGIN_HOST}"  -e "mkdir -p -f ${PLUGIN_TARGET};mirror -eR ${PLUGIN_SOURCE} ${PLUGIN_TARGET}; bye"
