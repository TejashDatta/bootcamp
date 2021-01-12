-- tablespace specifies physical organization of data

mkdir /var/lib/pgsql/10/space1

CREATE TABLESPACE space1 LOCATION '/var/lib/pgsql/10/space1';

CREATE TABLE t_space1_example (id int PRIMARY KEY) TABLESPACE space1;

ALTER TABLE t_space1_example SET TABLESPACE pg_default;

ALTER INDEX t_space1_example_pkey SET TABLESPACE pg_default;

DROP TABLESPACE space1;
