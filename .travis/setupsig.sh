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
sed '/no-tty/d' ~/.gnupg/gpg.conf
sed --version
echo sed --version
sed '$d' ~/.gnupg/gpg.conf
cat ~/.gnupg/gpg.conf
# rm /tmp/sign.key
