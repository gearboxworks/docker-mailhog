#!/bin/sh

echo "Hello from build-mailhog.sh"
if [ -d "/build/rootfs/" ]
then
	rsync -HvaxP /build/rootfs/ /
fi

apk --no-cache add ca-certificates

apk --no-cache add --virtual build-dependencies go git

mkdir -p /build/gocode
export GOPATH=/build/gocode
go get github.com/mailhog/MailHog
mv /build/gocode/bin/MailHog /usr/local/bin
rm -rf /build/gocode
apk del --purge build-dependencies

adduser -D -u 1001 mailhog

