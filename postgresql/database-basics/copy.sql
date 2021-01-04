TRUNCATE TABLE t_user;

COPY t_user FROM '/var/lib/pgsql/sample/t_user.csv' WITH (FORMAT CSV);
COPY t_user TO '/var/lib/pgsql/sample/t_user.csv' WITH (FORMAT CSV);


\copy t_user FROM './sample/t_user.csv' WITH (FORMAT CSV);
\copy t_user TO './sample/t_user.csv' WITH (FORMAT TEXT);

