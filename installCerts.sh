DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source "${DIR}/config.sh"

LEGO_FOLDER="${DIR}/.lego/certificates"
SYNOLOGY_FOLDER="/usr/syno/etc/certificate/_archive/${SYNOLOGY_CERT_ID}"

cp "${LEGO_FOLDER}"/"${LE_DOMAIN}".crt "${SYNOLOGY_FOLDER}"/cert.pem
cp "${LEGO_FOLDER}"/"${LE_DOMAIN}".issuer.crt "${SYNOLOGY_FOLDER}"/chain.pem
cat "${LEGO_FOLDER}"/"${LE_DOMAIN}".crt "${LEGO_FOLDER}"/"${LE_DOMAIN}".issuer.crt > "${SYNOLOGY_FOLDER}"/fullchain.pem
cp "${LEGO_FOLDER}"/"${LE_DOMAIN}".key "${SYNOLOGY_FOLDER}"/privkey.pem

SYNOLOGY_FOLDER="/usr/syno/etc/certificate/system/default/"

cp "${LEGO_FOLDER}"/"${LE_DOMAIN}".crt "${SYNOLOGY_FOLDER}"/cert.pem
cp "${LEGO_FOLDER}"/"${LE_DOMAIN}".issuer.crt "${SYNOLOGY_FOLDER}"/chain.pem
cat "${LEGO_FOLDER}"/"${LE_DOMAIN}".crt "${LEGO_FOLDER}"/"${LE_DOMAIN}".issuer.crt > "${SYNOLOGY_FOLDER}"/fullchain.pem
cp "${LEGO_FOLDER}"/"${LE_DOMAIN}".key "${SYNOLOGY_FOLDER}"/privkey.pem

SYNOLOGY_FOLDER="/usr/syno/etc/certificate/system/FQDN/"

cp "${LEGO_FOLDER}"/"${LE_DOMAIN}".crt "${SYNOLOGY_FOLDER}"/cert.pem
cp "${LEGO_FOLDER}"/"${LE_DOMAIN}".issuer.crt "${SYNOLOGY_FOLDER}"/chain.pem
cat "${LEGO_FOLDER}"/"${LE_DOMAIN}".crt "${LEGO_FOLDER}"/"${LE_DOMAIN}".issuer.crt > "${SYNOLOGY_FOLDER}"/fullchain.pem
cp "${LEGO_FOLDER}"/"${LE_DOMAIN}".key "${SYNOLOGY_FOLDER}"/privkey.pem

# Restart the Synology nginx server
#/usr/syno/etc/rc.sysv/nginx.sh reload
systemctl reload nginx


