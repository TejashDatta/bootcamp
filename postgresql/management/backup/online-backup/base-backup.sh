# -D <バックアップ先>
pg_basebackup -D /var/lib/pgsql/10/backups/data20210116

# tablespace
pg_basebackup --tablespace-mapping= tablespace-directory = backup-directory


# restore

cp -ar /var/lib/pgsql/10/backups/data20210116 /var/lib/pgsql/10/data
