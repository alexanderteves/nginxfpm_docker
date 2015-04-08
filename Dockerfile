# Meta information
FROM ubuntu:14.04
MAINTAINER Alexander Teves <alexander.teves@gmail.com>

# Install software
RUN apt-get update > /dev/null && DEBIAN_FRONTEND=noninteractive apt-get install -y nginx php5-fpm

# Setup configuration
COPY files/www.conf /etc/php5/fpm/pool.d/www.conf
COPY files/phpfpm /etc/nginx/sites-available/phpfpm
RUN rm /etc/nginx/sites-enabled/default
RUN ln -sfT /etc/nginx/sites-available/phpfpm /etc/nginx/sites-enabled/phpfpm
RUN echo "daemon off;" | cat - >> /etc/nginx/nginx.conf

# Create foreground script
COPY files/nginxfpm /usr/local/bin/nginxfpm
RUN chmod +x /usr/local/bin/nginxfpm

# Defaults
EXPOSE 80
VOLUME /var/www
CMD /usr/local/bin/nginxfpm
