FROM tomcat:9

COPY connector-ssl.xml .
RUN sed -i '/<Service name="Catalina">/ r connector-ssl.xml' "$CATALINA_HOME/conf/server.xml" && rm connector-ssl.xml

EXPOSE 80, 8443

VOLUME [$CATALINA_HOME/conf, $CATALINA_HOME/certs]

ENTRYPOINT /bin/sh catalina.sh run
