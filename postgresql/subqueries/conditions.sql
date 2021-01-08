SELECT * FROM t_user_history h WHERE
  h.action = (SELECT min(action) FROM t_action_m);

-- 1や1以上の行が返されるか確認する条件

SELECT * FROM t_user u WHERE EXISTS (
  SELECT 1 FROM t_user_history h WHERE h.ts >= '2017-05-01'
  AND h.kaiin_no = u.kaiin_no
);

-- semi-join

SELECT * FROM t_user u WHERE kaiin_no IN
  (SELECT kaiin_no FROM t_user_auth WHERE method = 'md5pass');

-- subqueryが列

SELECT kaiin_no,
  (SELECT min(ts) FROM t_user_history h  WHERE h.kaiin_no = u.kaiin_no) first_time
  FROM t_user u;

