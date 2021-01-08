SELECT ts, point,
  first_value(point) OVER (ORDER BY ts) first_point
  FROM t_purchase;

-- wrong output

SELECT ts, point,
  last_value(point) OVER (ORDER BY ts) last_point
  FROM t_purchase;

-- fix: make upper limit unbounded

SELECT ts, point,
  last_value(point) OVER (ORDER BY ts ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) last_point
  FROM t_purchase ORDER BY ts DESC;


SELECT ts, point,
  nth_value(point, 5) OVER (ORDER BY ts) fifth_point
  FROM t_purchase;
