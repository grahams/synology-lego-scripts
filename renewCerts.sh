#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "${DIR}/config.sh"

LEGO_FOLDER="${DIR}/.lego/certificates"
#SYNOLOGY_FOLDER="/usr/syno/etc/certificate/_archive/${SYNOLOGY_CERT_ID}"
SYNOLOGY_FOLDER="/usr/syno/etc/certificate/system/default/"

docker run --rm -e LINODE_TOKEN_FILE=/ssl/linode-key -e LINODE_POLLING_INTERVAL=60 -e LINODE_PROPAGATION_TIMEOUT=0 -v "${DIR}":/ssl goacme/lego -a -k rsa4096 -d ${LE_DOMAIN} -m ${LE_EMAIL_ADDRESS} --dns=linodev4 --path=/ssl/.lego renew --days 20 | grep -i "no renewal" > /dev/null

code=$?
if [ $code -ne 0 ]; then
    echo "Certificates renewed"
	source "${DIR}/installCerts.sh"
fi
