SELECT max(point) FROM t_purchase;
SELECT min(point) AS min_point FROM t_purchase;
SELECT sum(point) FROM t_purchase;
SELECT count(*) FROM t_purchase;
SELECT count(md5pass) FROM t_user_auth;

-- statistics

SELECT stddev_pop(point) FROM t_purchase;
SELECT stddev_samp(point) FROM t_purchase;

SELECT corr(point, extract(day FROM ts)) FROM t_purchase;

-- aggregation

SELECT array_agg(reg_name) FROM t_user;
SELECT string_agg(reg_name, ' : ') FROM t_user;
