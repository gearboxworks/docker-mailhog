#!/bin/sh

# See gearboxworks/gearbox-base for details.
test -f /build/include-me.sh && . /build/include-me.sh

c_ok "Started."

c_ok "Installing MailHog GoLang."
if [ -f /build/build-mailhog.env ]
then
	. /build/build-mailhog.env
fi

wget -q -O /usr/local/bin/MailHog --no-check-certificate ${URL}; checkExit
chmod a+x /usr/local/bin/MailHog; checkExit

c_ok "Adding mailhog user."
adduser -D mailhog; checkExit

c_ok "Finished."
