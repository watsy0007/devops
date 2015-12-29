#!/bin/bash
set -e

set_listen_addresses() {
  sedEscapedValue="$(echo "$1" | sed 's/[\/&]/\\&/g')"
  sed -ri "s/^#?(listen_addresses\s*=\s*)\S+/\1'$sedEscapedValue'/" "$PGDATA/postgresql.conf"
}

if [ "$1" = 'postgres' ]; then
  mkdir -p "$PGDATA"
  chown -R postgres "$PGDATA"

  chmod g+s /run/postgresql
  chown -R postgres /run/postgresql

  # look specifically for PG_VERSION, as it is expected in the DB dir
  if [ ! -s "$PGDATA/PG_VERSION" ]; then
    gosu postgres initdb  #切换到postgres用户执行 initdb命令

    # check password first so we can output the warning before postgres
    # messes it up
    if [ "$POSTGRES_PASSWORD" ]; then
      pass="PASSWORD '$POSTGRES_PASSWORD'"
      authMethod=md5
    else
      pass=
      authMethod=trust
    fi

    { echo; echo "host all all 0.0.0.0/0 $authMethod"; } >> "$PGDATA/pg_hba.conf"

    # internal start of server in order to allow set-up using psql-client
    # does not listen on TCP/IP and waits until start finishes
    gosu postgres pg_ctl -D "$PGDATA" \
      -o "-c listen_addresses=''" \
      -w start

    : ${POSTGRES_USER:=postgres}
    : ${POSTGRES_DB:=$POSTGRES_USER}
    export POSTGRES_USER POSTGRES_DB

    if [ "$POSTGRES_DB" != 'postgres' ]; then
      echo "CREATE DATABASE $POSTGRES_DB ;" | psql --username postgres
    fi

    if [ "$POSTGRES_USER" = 'postgres' ]; then
      op='ALTER'
    else
      op='CREATE'
    fi

    echo "$op USER $POSTGRES_USER WITH SUPERUSER $pass ;" | psql --username postgres

    echo
    for f in /docker-entrypoint-initdb.d/*; do
      case "$f" in
        *.sh)  echo "$0: running $f"; . "$f" ;;
        *.sql) echo "$0: running $f"; psql --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" < "$f" && echo ;;
        *)     echo "$0: ignoring $f" ;;
      esac
      echo
    done

    gosu postgres pg_ctl -D "$PGDATA" -m fast -w stop
    cp /postgresql.conf $PGDATA/postgresql.conf

    echo
    echo 'PostgreSQL init process complete; ready for start up.'
    echo
  fi

  exec gosu postgres "$@"
fi

exec "$@"
