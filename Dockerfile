# A simple apache container, based on fedora

FROM rhel

MAINTAINER Johan Swensson <kupo at kupo dot se>

RUN yum install deltarpm yum-utils -y && yum update -y && yum install httpd -y && yum clean all
ADD index.html /var/www/html/index.html
RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf && chmod -R 755 /run/httpd && chmod 777 /etc/httpd/logs
EXPOSE 8080
USER 1001
CMD /bin/bash -c 'echo Starting httpd... ; /usr/sbin/httpd -DFOREGROUND || echo Apache start failed: $?'

