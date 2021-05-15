#!/bin/bash
mkdir -p ~/.ssh
touch ~/.ssh/config
echo "Host ${PLUGIN_HOST}
  StrictHostKeyChecking no" > ~/.ssh/config

