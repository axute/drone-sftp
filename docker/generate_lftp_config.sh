#!/bin/bash
echo "generate ~/.lftptc ..." | ts
if [ -n "${PLUGIN_DEBUG}" ]; then
  tee ~/.lftprc < /.lftprc| ts
else
  cat /.lftprc > ~/.lftprc
fi

echo "... done" | ts
