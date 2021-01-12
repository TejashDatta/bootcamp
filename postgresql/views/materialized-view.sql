-- MATERIALIZED VIEWは特に集計のSELECT分の負荷軽減に役に立つ
-- WITH NO DATA　記述すればまずREFRESHする必要となります

CREATE MATERIALIZED VIEW mv_monthly_average AS
  SELECT to_char(ts, 'YYYY-MM') AS month, avg(point)
  FROM t_purchase GROUP BY month ORDER BY month
  WITH NO DATA;

REFRESH MATERIALIZED VIEW mv_monthly_average;

-- CONCURRENT REFRESHにUNQIUE INDEXの必要

CREATE UNIQUE INDEX ON mv_monthly_average(month);

REFRESH MATERIALIZED VIEW CONCURRENTLY mv_monthly_average;

DROP MATERIALIZED VIEW mv_monthly_average;
