FROM centos:7

MAINTAINER Rolf Krahl <rolf.krahl@helmholtz-berlin.de>

# Enable EPEL
RUN curl --silent --show-error --location \
        --output /root/epel-release-7-8.noarch.rpm \
        http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-8.noarch.rpm && \
    rpm -i /root/epel-release-7-8.noarch.rpm && \
    rm -f /root/epel-release-7-8.noarch.rpm

# Install tiny-init
RUN curl --silent --show-error --location \
        --output /etc/yum.repos.d/Rotkraut.repo \
        http://download.opensuse.org/repositories/home:Rotkraut:Docker/CentOS_7/home:Rotkraut:Docker.repo && \
    yum -y install tiny-init

# Further packages
RUN yum -y install \
        pwgen

ENTRYPOINT ["/usr/sbin/tiny-init"]
