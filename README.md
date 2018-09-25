# Apache Tomcat with SSL configuration
Build from official [tomcat:9](https://hub.docker.com/_/tomcat/) image, only SSL config added. Please read the official README for further information.

## Usage
You need to attach the certificates in a shared directory to `/usr/local/tomcat/certs`. The certs should be in `.pem` format, and the following files are used by Tomcat: `cert.pem, privkey.pem, chain.pem`

### Example
```bash
docker run -p 8080:8080 -p 8443:8443 \
  -v tomcat_conf:/usr/local/tomcat/conf \
  -v certs:/usr/local/tomcat/certs \
  tellsoftware/tomcat-ssl
```
> This repo is based on [hbdesiato/docker-tomcat-ssl](https://github.com/hbdesiato/docker-tomcat-ssl). Thanks.
