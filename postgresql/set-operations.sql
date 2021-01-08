SELECT reg_name, email FROM t_user UNION
  SELECT reg_name, email FROM t_user_preopen;

-- ALL で重複を除去しない

SELECT reg_name, email FROM t_user UNION ALL
  SELECT reg_name, email FROM t_user_preopen;

SELECT reg_name, email FROM t_user INTERSECT
  SELECT reg_name, email FROM t_user_preopen;

SELECT reg_name, email FROM t_user EXCEPT
  SELECT reg_name, email FROM t_user_preopen;

SELECT DISTINCT kaiin_no FROM t_user_history;
