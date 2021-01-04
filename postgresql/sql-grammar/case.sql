SELECT reg_name,
  CASE
    WHEN typ = 'free' THEN 'f'
    WHEN typ = 'premium' THEN 'p'
    ELSE 'default' END AS f_or_p
  FROM t_user;
  
SELECT kaiin_no, reg_name,
  CASE typ
    WHEN 'free' THEN 'f'
    WHEN 'premium' THEN 'p'
    ELSE 'default' END AS "f or p"
  FROM t_user;
  