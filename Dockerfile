# FROM httpd:2.4a #a2enmod cmd is missing in httpd image, https://github.com/docker-library/httpd/issues/135 
FROM debian:stretch

# apache install + geoip module
RUN apt-get update && apt-get install --fix-missing -y apache2 libapache2-mod-geoip
RUN apt clean 

# Enable rewrite (prerequisite)
RUN a2enmod rewrite

# Enable htacces (prerequisite)
#<Directory /var/www/>
#        Options FollowSymLinks
#        AllowOverride All
#        Require all granted
#</Directory>
COPY apache2.conf /etc/apache2/apache2.conf

# Enable GeoIp conf
COPY geoip.conf /etc/apache2/mods-available/geoip.conf
RUN echo "GeoIPEnable On" > /etc/apache2/sites-available/virtualhost.conf
RUN echo "GeoIPDBFile /usr/share/GeoIP/GeoIP.dat" >> /etc/apache2/sites-available/virtualhost.conf
RUN echo "GeoIPScanProxyHeaders On" >> /etc/apache2/sites-available/virtualhost.conf
RUN a2enmod geoip

#html simple site with .htaccess
COPY ./public-html/ /var/www/html/

# forward request and error logs to docker log collector
RUN ln -sf /dev/stdout /var/log/apache2/access.log && ln -sf /dev/stderr /var/log/apache2/error.log

# EXPOSE 80
CMD ["apachectl", "-D", "FOREGROUND"]
