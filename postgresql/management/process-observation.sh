kill -0 $(head -1 $PGDATA/postmaster.pid)
echo $? 
# 0 if process running

pg_ctl status -D $PGDATA

systemctl status postgresql-10

# check if connection possible
pg_isready -h localhost -p 5432
