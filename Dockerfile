# A simple apache container, based on fedora

FROM fedora

MAINTAINER Johan Swensson <kupo at kupo dot se>

RUN dnf install deltarpm yum-utils -y && dnf update -y && dnf install httpd -y && dnf clean all

ADD index.html /var/www/html/index.html

EXPOSE 80

CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]


