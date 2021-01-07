-- t_user_auth tableの一部と結合

SELECT u.*, a.method FROM t_user u JOIN
  (SELECT * FROM t_user_auth WHERE method = 'md5pass') a
  USING (kaiin_no);

WITH a AS (SELECT * FROM t_user_auth WHERE method = 'google')
  SELECT u.*, a.method FROM t_user u JOIN a USING (kaiin_no);
