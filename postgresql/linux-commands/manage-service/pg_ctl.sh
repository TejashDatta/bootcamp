# options:
#   -D directory of cluster, default is PGDATA setting value
#   -l log file location

pg_ctl stop -m fast -D /vatr/lib/pgsql/10/data

# stop -m mode otions:
#   smart - wait for client
#   fast - cut connection with client, default
#   immediate - like alt + f4

pg_ctl start -D /var/lib/pgsql/10/data -l ~/postgres.log

pg_ctl status

pg_ctl reload -D /var/lib/pgsql/10/data
