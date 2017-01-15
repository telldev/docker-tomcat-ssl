# docker-tomcat-ssl

### Usage
```bash
docker run -p 8080:8080 -p 8443:8443 \
  -v tomcat_conf:/usr/local/tomcat/conf \
  -e HOST=tomcat.example.com \
  desiato/tomcat-ssl
```
