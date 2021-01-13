systemctl stop postgresql-10

tar czf backup20210113.tar.gz -C /var/lib/pgsql/10/data .

systemctl start postgresql-10
