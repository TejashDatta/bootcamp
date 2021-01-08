-- 交差結合

SELECT u.kaiin_no, u.reg_name, a.kaiin_no, a.method
  FROM t_user u CROSS JOIN t_user_auth a;

-- 内部結合

SELECT u.kaiin_no, u.reg_name, a.kaiin_no, a.method
  FROM t_user u JOIN t_user_auth a USING (kaiin_no);

SELECT u.kaiin_no, u.reg_name, a.method
  FROM t_user u JOIN t_user_auth a ON u.kaiin_no = a.kaiin_no;

-- INNERとは冗長

SELECT u.kaiin_no, u.reg_name, a.kaiin_no, a.method
  FROM t_user u INNER JOIN t_user_auth a USING (kaiin_no);

-- 外部結合

SELECT h.*, u.* FROM t_user_history h LEFT JOIN t_user u USING(kaiin_no);

SELECT h.*, u.* FROM t_user_history h RIGHT JOIN t_user u USING(kaiin_no);

SELECT h.*, u.* FROM t_user_history h FULL JOIN t_user u USING(kaiin_no);

-- OUTERとは冗長

SELECT h.*, u.* FROM t_user_history h LEFT OUTER JOIN t_user u USING(kaiin_no);
