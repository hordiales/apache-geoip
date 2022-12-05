# Docker build

Ref: https://hub.docker.com/_/httpd


$ docker build -t my-apache2 .
$ docker run -dit --name my-running-app -p 8080:80 my-apache2

# FROM httpd:2.4a
FROM debian:stretch
#a2enmod cmd https://github.com/docker-library/httpd/issues/135 

from debian:stretch
https://www.digitalocean.com/community/tutorials/apache-web-server-dockerfile


# GeoIP Module conf

https://www.cloudbooklet.com/how-to-setup-geoip-block-using-apache/


# para que preserve la IP original del request, agrego --net:host

lo de --net:host, solo fucnionaria en linux

(base) hordiaMac16:apache-docker hordia$ docker run -dit --name my-apache-geo -p 8080:80 --net="host" my-apache2
WARNING: Published ports are discarded when using host network mode
a3e50ad18ebf2d956746befd72144944b02fbdb5f724ed5e46167fdd6e184bfa
