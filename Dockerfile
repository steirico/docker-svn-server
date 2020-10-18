FROM debian:buster-slim

RUN apt-get update && \
	apt-get install -y apache2 libapache2-mod-svn subversion curl php libapache2-mod-php

RUN curl -L https://github.com/mfreiholz/iF.SVNAdmin/archive/stable-1.6.2.tar.gz | tar xvz -C /opt/ && \
	mv /opt/iF.SVNAdmin-stable-1.6.2 /opt/svnadmin &&\
	ln -s /opt/svnadmin /var/www/html/svnadmin

ADD rootfs /
ADD https://raw.githubusercontent.com/docker-library/php/master/7.3/buster/apache/apache2-foreground /usr/local/bin/apache2-foreground

RUN chown -R www-data:www-data /opt/svnadmin/data && \
	chown -R www-data:www-data /var/lib/svn/* && \
	chmod +x /usr/local/bin/apache2-foreground && \
	ln -sf /dev/stdout /var/log/apache2/access.log && \
	ln -sf /dev/stderr /var/log/apache2/error.log

ENV HOME /var/lib/svn
EXPOSE 80
 
CMD ["apache2-foreground"]
