#!/bin/bash
echo "generate /lftp_exludes.rx" | ts
touch /lftp_exludes.rx
if [ -n "${PLUGIN_EXCLUDE}" ]
then
  IFS=','
  read -a RX_EXLUDES <<< "${PLUGIN_EXCLUDE}"
  # Print each value of the array by using the loop
  for RX_PATTERN in "${RX_EXLUDES[@]}";
  do
    echo -E "${RX_PATTERN}" >>/lftp_exludes.rx
  done
fi
echo "done" | ts
