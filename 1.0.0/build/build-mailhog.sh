#!/bin/sh

# See gearboxworks/gearbox-base for details.
test -f /build/include-me.sh && . /build/include-me.sh

c_ok "Started."

c_ok "Installing packages."
apk --no-cache add ca-certificates; checkExit
apk --no-cache add --virtual build-dependencies go git; checkExit

c_ok "Installing MailHog GoLang."
mkdir -p /build/gocode; checkExit
export GOPATH=/build/gocode
go get github.com/mailhog/MailHog; checkExit
mv /build/gocode/bin/MailHog /usr/local/bin; checkExit

c_ok "Adding mailhog user."
adduser -D -u 1001 mailhog; checkExit

c_ok "Cleaning up."
rm -rf /build/gocode; checkExit
apk del --purge build-dependencies; checkExit

c_ok "Finished."
