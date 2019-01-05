FROM centos:latest
MAINTAINER Idan Bidani <iplaman@gmail.com>

RUN yum update -q -y && \
    yum install epel-release -q -y && \
    yum install openvpn unzip -q -y && \
    yum remove epel-release -q -y && \
    yum clean all -q && \
    curl -s https://www.privateinternetaccess.com/openvpn/openvpn.zip -o /tmp/openvpn.zip && \
    unzip -uo /tmp/openvpn.zip -d /opt/openvpn

WORKDIR /opt/openvpn
COPY openvpn.sh /usr/local/bin/openvpn.sh

ENV REGION="US East"
ENTRYPOINT ["openvpn.sh"]
