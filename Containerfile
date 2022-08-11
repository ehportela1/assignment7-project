FROM fedora:latest
RUN dnf -yqq update \
	&& dnf -yqq install httpd \
	&& mkdir /structure  \
	&& chmod 777 /structure \
	&& useradd collin
USER sync
RUN mkdir /structure/sync-work
USER nobody
RUN mkdir /structure/nobody-work
USER root
EXPOSE 80
ADD index.html /var/www/html/
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

