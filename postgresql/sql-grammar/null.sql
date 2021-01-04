SELECT coalesce(typ, 'unknown') typ FROM t_user WHERE kaiin_no = 1008;
SELECT count(nullif(typ, 'free')) FROM t_user;

\pset null N00L
