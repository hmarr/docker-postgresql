FROM ubuntu:14.04
MAINTAINER Harry Marr <harry.marr@gmail.com>

RUN locale-gen en_US.UTF-8 && echo 'LANG="en_US.UTF-8"' > /etc/default/locale
RUN apt-get -qq update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q postgresql-9.3 postgresql-contrib-9.3 libpq-dev

ADD run /usr/local/bin/run
RUN chmod +x /usr/local/bin/run

EXPOSE 5432
VOLUME  ["/var/log/postgresql", "/var/lib/postgresql"]
CMD ["/usr/local/bin/run"]

