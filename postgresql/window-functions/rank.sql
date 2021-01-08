SELECT ts, point,
  rank() OVER (PARTITION BY to_char(ts, 'MMYY') ORDER BY point DESC) AS month_rank,
  rank() OVER (PARTITION BY to_char(ts, 'YY') ORDER BY point DESC) AS year_rank
  FROM t_purchase ORDER BY ts;

SELECT ts, point,
  rank() OVER (ORDER BY point DESC) AS month_rank
  FROM t_purchase ORDER BY month_rank;

SELECT ts, point,
  dense_rank() OVER (ORDER BY point DESC) AS month_rank
  FROM t_purchase ORDER BY month_rank;

SELECT ts, point,
  row_number() OVER (ORDER BY point DESC) AS month_rank
  FROM t_purchase ORDER BY month_rank;
