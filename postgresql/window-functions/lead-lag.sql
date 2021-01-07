SELECT ts, point,
  lag(point, 1, -1) OVER (ORDER BY ts) last_point
  FROM t_purchase;

SELECT ts, point,
  lead(point, 2, -1) OVER (ORDER BY ts) forward_2
  FROM t_purchase;
