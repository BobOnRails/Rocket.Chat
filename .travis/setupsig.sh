#!/bin/bash
set -x
set -euvo pipefail
IFS=$'\n\t'

cp .travis/sign.key.gpg  /tmp
gpg --yes --batch --passphrase=12345 /tmp/sign.key.gpg # was $mypass
gpg --allow-secret-key-import --import /tmp/sign.key
rm /tmp/sign.key
