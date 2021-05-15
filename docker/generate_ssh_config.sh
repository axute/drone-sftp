#!/bin/bash
echo "generate ~/.ssh/config" | ts
mkdir -p ~/.ssh
touch ~/.ssh/config
echo "Host ${PLUGIN_HOST}
  StrictHostKeyChecking no" > ~/.ssh/config
echo "done" | ts
