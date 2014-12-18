FROM centos:centos6

MAINTAINER Linus Chien <linus_chien@mail.gss.com.tw>

RUN yum install -y openssh-server java-1.7.0-openjdk wget tar python-setuptools mysql-server

# setup root's password
RUN echo 'root:gss@1234' | chpasswd

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

# init SSH keys
RUN /sbin/service sshd start && /sbin/service sshd stop

# init MySQL database
RUN /sbin/service mysqld start && /sbin/service mysqld stop

ENV TOMCAT_SITE https://archive.apache.org/dist/tomcat
ENV TOMCAT_MAJOR_VERSION 7
ENV TOMCAT_MINOR_VERSION 7.0.57

RUN wget -q ${TOMCAT_SITE}/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz && \
    wget -qO- ${TOMCAT_SITE}/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 | md5sum -c - && \
    tar zxf apache-tomcat-*.tar.gz && \
    rm apache-tomcat-*.tar.gz && \
    mv apache-tomcat* /opt/

RUN easy_install supervisor

ADD supervisord.conf /etc/supervisord.conf

EXPOSE 22 3306 8080

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
