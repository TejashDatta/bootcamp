SELECT to_char(ts, 'Mon') AS month, count(*) FROM t_purchase GROUP BY month;

SELECT to_char(ts, 'Mon') AS month, count(*) FROM t_purchase GROUP BY month HAVING count(*) > 2000;

SELECT to_char(ts, 'Mon') AS month, to_char(ts, 'Dy') AS day, count(*) FROM t_purchase GROUP BY month, day;

-- grouping sets

SELECT to_char(ts, 'Mon') AS month, to_char(ts, 'Dy') AS day, count(*) FROM t_purchase 
  GROUP BY GROUPING SETS ((day, month), (month), ());

SELECT to_char(ts, 'Mon') AS month, to_char(ts, 'Dy') AS day, count(*) FROM t_purchase 
  GROUP BY ROLLUP (month, day);

SELECT to_char(ts, 'Mon') AS month, to_char(ts, 'Dy') AS day, count(*) FROM t_purchase 
  GROUP BY CUBE (month, day);
