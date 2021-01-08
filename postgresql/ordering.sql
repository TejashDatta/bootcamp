-- ordering
SELECT * FROM t_user_history ORDER BY kaiin_no ASC, ts DESC NULLS LAST; 

-- pagination
SELECT * FROM t_user_history ORDER BY kaiin_no ASC, ts DESC NULLS LAST LIMIT 2 OFFSET 4; 
