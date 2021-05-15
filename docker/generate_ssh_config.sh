#!/bin/bash
echo "generate ~/.ssh/config ..." | ts
mkdir -p ~/.ssh
touch ~/.ssh/config
echo "Host ${PLUGIN_HOST}
  StrictHostKeyChecking no" > ~/.ssh/config
if [ -n "${PLUGIN_DEBUG}" ]; then
  ts < ~/.ssh/config
fi

echo "... done" | ts
