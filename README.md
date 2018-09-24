# docker-tomcat-ssl

### Usage
```bash
docker run -p 8080:8080 -p 8443:8443 \
  -v tomcat_conf:/usr/local/tomcat/conf \
  -v certs:/usr/local/tomcat/certs \
  telldev/tomcat-ssl
```
