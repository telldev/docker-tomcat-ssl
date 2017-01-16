#! /bin/bash
if [ ! -e "$CATALINA_HOME/conf/ssl/keystore.jks" ]; then
	mkdir -p "$CATALINA_HOME/conf/ssl"
	chmod go-rwx "$CATALINA_HOME/conf/ssl"
	keytool -keystore "$CATALINA_HOME/conf/ssl/keystore.jks" \
	-alias mykey -genkey -keyalg RSA -sigalg SHA256withRSA \
	-validity 1095 -storepass changeit -keypass changeit \
	-ext BC:true=ca:true \
	-dname "cn=$HOST"
	
	keytool -exportcert -keystore "$CATALINA_HOME/conf/ssl/keystore.jks" -storepass changeit -file "$CATALINA_HOME/conf/ssl/selfsigned.cer"
	keytool -importcert -keystore "$CATALINA_HOME/conf/ssl/keystore.jks" -storepass changeit -file "$CATALINA_HOME/conf/ssl/selfsigned.cer" -alias ca -noprompt
fi
exec catalina.sh run
