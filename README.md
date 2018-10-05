# Squid proxy for Docker based on Alpine Linux

## Quick Start
* Go to the folder with file Dockerfile.
* Build:

      docker build -t mara88/docker-alpine-squid .
* Run:

      docker run --name=squid -h squid -d --privileged=true -v $(pwd)/squid.conf:/etc/squid/squid.conf:ro -p 172.17.0.1:3128:3128 mara88/docker-alpine-squid
      
* Show log:

      docker logs squid
      
* Run shell into container

      docker exec -it squid /bin/sh

* Install as systemd service:

      docker stop squid
      cp docker.squid.service /etc/systemd/system/
      systemctl enable docker.squid
      systemctl start docker.squid
