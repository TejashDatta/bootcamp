SELECT * FROM t_user;
SELECT reg_name, email, typ FROM t_user;
SELECT kaiin_no AS emp_no, reg_name AS name, email, typ FROM t_user;

SELECT 1+1 AS add;

SELECT * FROM t_purchase 
  WHERE ts > '2017-04-07 00:00:00' AND ts < '2017-06-07 00:00:00'
  AND (point > 100 OR point < 30);
