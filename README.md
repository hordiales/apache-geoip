# Docker build

$ docker build -t my-apache2 .
$ docker run -dit --name my-apache-geo -p 8080:80 my-apache2

# Only in linux
    $ sudo docker run -it --name my-apache-geo -v $PWD/public-html:/var/www/html --net="host" my-apache2
    $ docker exec -it my-apache-geo /bin/bash

# Country CODES

https://en.wikipedia.org/wiki/ISO_3166-1

# htaccess rewrite rules exampls

    <IfModule mod_geoip.c>

    RewriteEngine on
    # Argentina
    RewriteCond %{ENV:GEOIP_COUNTRY_CODE} ^AR$ 
    RewriteRule ^(.*)$ /Deny-AR [L]

    # Colombia
    RewriteCond %{ENV:GEOIP_COUNTRY_CODE} ^CO$ 
    RewriteRule ^(.*)$ /Allow-CO [L]

    # USA
    RewriteCond %{ENV:GEOIP_COUNTRY_CODE} ^US$ 
    RewriteRule ^(.*)$ https://another.com [L]

    # Resto del mundo que no sea ni AR, ni CO
    RewriteCond %{ENV:GEOIP_COUNTRY_CODE} !^[AR|CO]$
    RewriteRule ^(.*)$ /Allow-ALL [L]

    </IfModule>
    j
    <IfModule mod_geoip.c>
    RewriteEngine off

    SetEnvIf GEOIP_COUNTRY_CODE AR BlockCountry
    Deny from env=BlockCountry
    </IfModule>
