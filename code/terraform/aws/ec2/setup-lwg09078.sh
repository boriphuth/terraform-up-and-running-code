#!/bin/bash
sudo su -
wget  -O Dynatrace-OneAgent-Linux-1.177.216.sh "https://lwg09078.live.dynatrace.com/api/v1/deployment/installer/agent/unix/default/latest?Api-Token=l6z94tfgS3WgKFpvEYnbf&arch=x86&flavor=default"
wget https://ca.dynatrace.com/dt-root.cert.pem ; ( echo 'Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="--SIGNED-INSTALLER"'; echo ; echo ; echo '----SIGNED-INSTALLER' ; cat Dynatrace-OneAgent-Linux-1.177.216.sh ) | openssl cms -verify -CAfile dt-root.cert.pem > /dev/null
 /bin/sh Dynatrace-OneAgent-Linux-1.177.216.sh APP_LOG_CONTENT_ACCESS=1 INFRA_ONLY=0