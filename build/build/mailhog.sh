#!/bin/bash
# Created on 2020-03-14T01:39:07+1100, using template:mailhog.sh.tmpl and json:gearbox.json

test -f /etc/gearbox/bin/colors.sh && . /etc/gearbox/bin/colors.sh

c_ok "Started."

c_ok "Installing packages."
if [ -f /etc/gearbox/build/mailhog.apks ]
then
	APKS="$(cat /etc/gearbox/build/mailhog.apks)"
	apk update && apk add --no-cache ${APKS}; checkExit
fi

if [ -f /etc/gearbox/build/mailhog.env ]
then
	. /etc/gearbox/build/mailhog.env
fi

if [ ! -d /usr/local/bin ]
then
	mkdir -p /usr/local/bin; checkExit
fi

wget -q -O /usr/local/bin/MailHog --no-check-certificate https://github.com/mailhog/MailHog/releases/download/v1.0.0/MailHog_linux_amd64; checkExit
chmod a+x /usr/local/bin/MailHog; checkExit

c_ok "Adding mailhog user."
adduser -D mailhog; checkExit

c_ok "Finished."
