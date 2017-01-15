#! /bin/bash
if [ ! -e "$CATALINA_HOME/conf/ssl/keystore.jks" ]; then
	mkdir -p "$CATALINA_HOME/conf/ssl"
	chmod go-rwx "$CATALINA_HOME/conf/ssl"
	keytool -keystore "$CATALINA_HOME/conf/ssl/keystore.jks" \
	-alias mykey -genkey -keyalg RSA -sigalg SHA256withRSA \
	-validity 1095 -storepass changeit -keypass changeit \
	-ext BC:true=ca:true \
	-dname "cn=$HOST"
fi
exec catalina.sh run
