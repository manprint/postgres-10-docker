FROM postgres:10.14

RUN localedef -i it_IT -c -f UTF-8 -A /usr/share/locale/locale.alias it_IT.UTF-8
ENV LANG it_IT.utf8

ENV TZ=Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN rm -f /usr/local/bin/docker-entrypoint.sh
RUN rm -f /docker-entrypoint.sh

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /

ENV PGBACKUP_WAL=/var/lib/postgresql/wal
ENV PGBACKUP_BASE=/var/lib/postgresql/base

RUN mkdir -p $PGBACKUP_WAL
RUN mkdir -p $PGBACKUP_BASE

RUN chown -R postgres:postgres $PGBACKUP_WAL && chmod 700 $PGBACKUP_WAL
RUN chown -R postgres:postgres $PGBACKUP_BASE && chmod 700 $PGBACKUP_BASE

VOLUME /var/lib/postgresql/wal
VOLUME /var/lib/postgresql/base

# check
RUN ls -alFh /var/lib/postgresql
