#!/bin/bash
/generate_ssh_config.sh
/generate_lftp_exludes.sh
/generate_lftp_config.sh
export LFTP_PASSWORD="${PLUGIN_PASSWORD}"
if [ -n "${PLUGIN_DEBUG}" ]
then
  LFTP_COMMAND="debug;"
else
  LFTP_COMMAND=""
fi

LFTP_COMMAND+="mkdir -p -f ${PLUGIN_TARGET};"
LFTP_COMMAND+="mirror -eRvvv --scan-all-first --exclude-rx-from=/lftp_excludes.rx --delete-excluded ${PLUGIN_SOURCE} ${PLUGIN_TARGET};"
LFTP_COMMAND+="bye"
echo "start transfer from '${PLUGIN_SOURCE}' to '${PLUGIN_HOST}:${PLUGIN_TARGET}' ..." | ts
lftp --env-password "sftp://${PLUGIN_USERNAME}@${PLUGIN_HOST}"  -e "${LFTP_COMMAND}" | ts
echo "done" | ts
