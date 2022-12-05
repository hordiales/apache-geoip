# FROM httpd:2.4a
FROM debian:stretch
#a2enmod cmd https://github.com/docker-library/httpd/issues/135 

#geoip conf
RUN apt-get update && apt-get install --fix-missing -y apache2 libapache2-mod-geoip
COPY geoip.conf /etc/apache2/mods-available/geoip.conf
RUN a2enmod geoip
RUN apt clean 

RUN echo "GeoIPEnable On" > /etc/apache2/sites-available/virtualhost.conf
RUN echo "GeoIPDBFile /usr/share/GeoIP/GeoIP.dat" >> /etc/apache2/sites-available/virtualhost.conf
RUN echo "GeoIPScanProxyHeaders On" >> /etc/apache2/sites-available/virtualhost.conf

#html simple site
# COPY ./public-html-AR/ /usr/local/apache2/htdocs/
COPY ./public-html-AR/ /var/www/html/

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/apache2/access.log && ln -sf /dev/stderr /var/log/apache2/error.log

# EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]