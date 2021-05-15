#!/bin/bash
./generate_ssh_config.sh
./generate_lftp_exludes.sh

export LFTP_PASSWORD="${PLUGIN_PASSWORD}"
LFTP_COMMAND=""
LFTP_COMMAND+="mkdir -p -f ${PLUGIN_TARGET};"
LFTP_COMMAND+="mirror -eR --exclude-rx-from=/lftp_exludes.rx --delete-excluded ${PLUGIN_SOURCE} ${PLUGIN_TARGET};"
LFTP_COMMAND+="bye"
lftp --env-password "sftp://${PLUGIN_USERNAME}@${PLUGIN_HOST}"  -e "${LFTP_COMMAND}"
