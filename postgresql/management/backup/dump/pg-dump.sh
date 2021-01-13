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

# db1 doesn't exist yet
pg_restore -U postgres -d postgres -C db1.dump


# -C create database
pg_restore -U postgres -C -d db1 all_db.sql
