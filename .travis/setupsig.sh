#!/bin/bash
set -x
set -euvo pipefail
IFS=$'\n\t'

cp .travis/sign.key.gpg  /tmp
export mypass="Sm1da,K!" #gpg --gen-key
echo 'no-tty' >> ~/.gnupg/gpg.conf
cat ~/.gnupg/gpg.conf
gpg --yes --batch --passphrase=$mypass /tmp/sign.key.gpg
gpg --allow-secret-key-import --import /tmp/sign.key.gpg
# rm /tmp/sign.key
