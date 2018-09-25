FROM tomcat:9

COPY connector-ssl.xml .
RUN sed -i '/<Service name="Catalina">/ r connector-ssl.xml' "$CATALINA_HOME/conf/server.xml" && rm connector-ssl.xml

EXPOSE 8080 8443

VOLUME $CATALINA_HOME/conf $CATALINA_HOME/certs

CMD ["catalina.sh", "run"]
