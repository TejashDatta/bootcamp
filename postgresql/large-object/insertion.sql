INSERT INTO t_user_profile VALUES
  (1001, lo_import('/var/lib/pgsql/sample/01234.jpg'));

INSERT INTO t_user_profile VALUES
  (1002, lo_from_bytea(2, '\x0101'));
