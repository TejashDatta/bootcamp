-- 交差結合

SELECT u.kaiin_no, u.reg_name, a.kaiin_no, a.method
  FROM t_user u, t_user_auth a;

-- 内部結合

SELECT u.kaiin_no, u.reg_name, a.kaiin_no, a.method
  FROM t_user u, t_user_auth a WHERE u.kaiin_no = a.kaiin_no;

SELECT u.kaiin_no, u.reg_name, a.method
  FROM t_user u, t_user_auth a WHERE u.kaiin_no = a.kaiin_no;

SELECT h.*, u.reg_name FROM t_user_history h, t_user u
  WHERE h.kaiin_no = u.kaiin_no;
