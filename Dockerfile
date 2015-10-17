# A simple apache container, based on fedora

FROM rhel

MAINTAINER Johan Swensson <kupo at kupo dot se>

RUN yum install deltarpm yum-utils -y && yum update -y && yum install httpd -y && yum clean all

ADD index.html /var/www/html/index.html

EXPOSE 80

CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]


