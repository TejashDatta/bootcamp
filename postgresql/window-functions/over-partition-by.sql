-- average in every row

SELECT ts, point, avg(point) OVER () FROM t_purchase;

-- average by month

SELECT ts, point, avg(point) OVER (PARTITION BY to_char(ts, 'Mon')) FROM t_purchase ORDER BY ts;
