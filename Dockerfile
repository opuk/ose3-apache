# A simple apache container, based on fedora

FROM rhel

MAINTAINER Johan Swensson <kupo at kupo dot se>

RUN yum install deltarpm yum-utils -y && yum update -y && yum install httpd -y && yum clean all

ADD index.html /var/www/html/index.html

EXPOSE 8080

RUN chmod -R 755 /run/httpd
USER 1001

CMD /bin/bash -c 'echo Starting httpd... ; /usr/sbin/httpd -DFOREGROUND || echo Apache start failed: $?'

