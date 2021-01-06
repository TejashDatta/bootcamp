-- 左辺は右辺に含まれる？
SELECT 1 <@ integer_range FROM t_range_example;
SELECT '[3,4]'::int4range <@ integer_range FROM t_range_example;

-- 重複ある？
SELECT '[3,20]'::int4range && integer_range FROM t_range_example;

-- 下限と上限を取得
SELECT lower(date_range), upper(date_range) FROM t_range_example;
