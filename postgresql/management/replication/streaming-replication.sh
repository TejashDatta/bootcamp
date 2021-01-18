# creation

# -h: address of primary, -R use replication settings
pg_basebackup -h localhost -D /var/lib/pgsql/10/standby_data -R

# permit replication connection in pg_hba.conf


# start

pg_ctl start -D /var/lib/pgsql/10/standby_data -o '-p 5433'


# confirm connection

psql -p 5432 -c 'SELECT * FROM pg_stat_replication'

# promote to independant server

pg_ctl promote -D /var/lib/pgsql/10/standby_data
