-- evaluated at transaction start time
SELECT CURRENT_TIMESTAMP;
SELECT now();

-- evaluated at execution time
SELECT clock_timestamp();

SELECT extract(hour FROM timestamp1) FROM t_time_example;
SELECT extract(day FROM interval1) FROM t_time_example;

-- truncate till
SELECT date_trunc('hour', timestamp2) FROM t_time_example;
SELECT date_trunc('day', interval1) FROM t_time_example;
