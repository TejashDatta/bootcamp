su - postgresql
cd /var/lib/pgsql/10/backups

# -F plain is sql statements
# -C add commands to create database
pg_dump -U postgres -F plain -C -f db1.sql db1

# -F custom: compressed binary
pg_dump -U postgres -F custom -f db1.dump db1

# directory for each table and compressed table data
pg_dump -U postgres -F directory -f db1_dump db1

# single uncompressed file with table directories
pg_dump -U postgres -F tar -f db1_dump.tar db1

# dump all databases in plain format
pg_dumpall -U postgres -f all_db.sql

# dump only global data not in each database
pg_dumpall -U postgres -f global.sql -g


# restore

psql -U postgres -f global.sql

# db1 doesn't exist yet, -C create database
pg_restore -U postgres -d postgres -C db1.dump


# other options

# data only
pg_dump -U postgres --data-only -F plain -C -f db1.sql db1
pg_dump -U postgres -a -F plain -C -f db1.sql db1

# only object definitions
pg_dump -U postgres --schema-only -F plain -C -f db1.sql db1
pg_dump -U postgres -s -F plain -C -f db1.sql db1

# specific table
pg_dump -U postgres --table t_user -F plain -C -f db1.sql db1
pg_dump -U postgres -t t_user -F plain -C -f db1.sql db1

# spefic schema namespace
pg_dump -U postgres --schema public -F plain -C -f db1.sql db1
pg_dump -U postgres -n public -F plain -C -f db1.sql db1
