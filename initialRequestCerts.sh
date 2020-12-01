#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "${DIR}/config.sh"

LEGO_FOLDER="${DIR}/.lego/certificates"
SYNOLOGY_FOLDER="/usr/syno/etc/certificate/_archive/${SYNOLOGY_CERT_ID}"

docker run --rm -e LINODE_TOKEN_FILE=/ssl/linode-key -e LINODE_POLLING_INTERVAL=60 -e LINODE_PROPAGATION_TIMEOUT=0 -v ~/lego-ssl:/ssl goacme/lego -a -k rsa4096 -d ${LE_DOMAIN} -m ${LE_EMAIL_ADDRESS} --dns=linodev4 --path=/ssl/.lego run

echo "now manually install the certificates in the Synology GUI, then discover the Cert ID from /usr/syno/etc/certificate/_archive/INFO, and insert it into config.sh"

