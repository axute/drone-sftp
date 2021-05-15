#!/bin/bash
echo "generate /lftp_excludes.rx ..." | ts
touch /lftp_excludes.rx
if [ -n "${PLUGIN_EXCLUDE}" ]
then
  IFS=','
  read -a RX_EXLUDES <<< "${PLUGIN_EXCLUDE}"
  # Print each value of the array by using the loop
  for RX_PATTERN in "${RX_EXLUDES[@]}";
  do
    echo -E "${RX_PATTERN}" >>/lftp_excludes.rx
  done
  if [ -n "${PLUGIN_DEBUG}" ]; then
    ts < /lftp_excludes.rx
  fi

fi
echo "... done" | ts
