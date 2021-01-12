-- 排他制御

CREATE TABLE t_exclude_example (
  int_range int4range,
  EXCLUDE USING gist(int_range WITH &&)
);

INSERT INTO t_exclude_example VALUES ('[5, 8]');

-- エラーになる

INSERT INTO t_exclude_example VALUES ('[7, 10)');
