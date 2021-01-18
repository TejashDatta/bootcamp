# setup

vi /var/lib/pgsql/10/data/postgresql.conf
wal_level = logical

initdb -D /var/lib/pgsql/10/data2 --no-locale --encoding=UTF8

pg_ctl start -D /var/lib/pgsql/10/data2 -o '-p 5434'

createdb -p 5434 db2

pg_dump -p 5432 -s db1 -Fc -f 10/backups/db1.pg_dump

pg_restore -p 5434 -d db2 10/backups/db1.pg_dump

# create publication and subscription

psql -p 5432 db1

CREATE PUBLICATION pub1 FOR TABLE t_user, t_user_history;

psql -p 5434 db2

CREATE SUBSCRIPTION sub1
  CONNECTION 'host = localhost port = 5432 user = postgres dbname = db1'
  PUBLICATION pub1;

# delete publication and subscription

psql -p 5434 db2

DROP SUBSCRIPTION sub1;

psql -p 5432 db1

DROP PUBLICATION pub1;

# if subscription is not deleted properly
psql -p 5432 db1
SELECT pg_drop_replication_slot('sub1');

# other options

CREATE PUBLICATION pub2 FOR ALL TABLES WITH publish = 'insert, delete';

# don't initialize data
CREATE SUBSCRIPTION sub1
  CONNECTION 'host = localhost port = 5432 user = postgres dbname = db1'
  PUBLICATION pub1
  WITH copy_data = false;
