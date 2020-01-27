FROM osixia/openldap
MAINTAINER Arnaud Anouilh <aanouilh@ennov.com>
LABEL description="Sample extension fo osixia openlda image to test pbkdf2 hash."
RUN echo "deb http://ftp.debian.org/debian sid main" > /etc/apt/sources.list.d/sid.list && \
    LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get -y update && \
    LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install slapd-contrib     
ADD bootstrap /container/service/slapd/assets/config/bootstrap
ADD certs /container/service/slapd/assets/certs
ADD environment /container/environment/01-custom
