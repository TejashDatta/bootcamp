-- insertion

INSERT INTO t_user SELECT * FROM t_user_preopen;

-- deletion

DELETE FROM t_user WHERE kaiin_no IN (SELECT kaiin_no FROM t_user_preopen);

DELETE FROM t_user u USING t_user_preopen p WHERE u.kaiin_no = p.kaiin_no;

-- updation

UPDATE t_user_auth a SET method = 'google' FROM t_user u
  WHERE a.kaiin_no = u.kaiin_no AND u.reg_name = 'Hifming';
