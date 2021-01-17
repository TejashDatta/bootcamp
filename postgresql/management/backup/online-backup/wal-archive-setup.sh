# backup setup

mkdir /var/lib/pgsql/10/archive

vi /var/lib/pgsql/10/data/postgresql.conf

# conf file 以内 
archive_mode = on 
archive_command = 'cp "%p" "/var/lib/pgsql/10/archive/%f"' 


# restore setup

cp /usr/pgsql-10/share/recovery.conf.sample /var/lib/pgsql/10/data/recovery.conf

vi /var/lib/pgsql/10/data/recovery.conf

# conf file 以内 
restore_command = 'cp "/var/lib/pgqsl/10/archive/%f" "%p"' 

# restore uptil given time
recovery_target_time = '2020-01-15 12:00:00 JST'

chown postgres:postgres /var/lib/pgsql/10/data/recovery.conf


# after basebackup, .backup added to names of old wal files
