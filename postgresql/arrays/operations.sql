-- 連結
SELECT int_array || '{90, 80}'::int[] FROM t_array_example;

-- 重複ある？
SELECT int_array && '{2, 20, 200}'::int[] FROM t_array_example;

-- 左辺は右辺に含まれる？
SELECT '{2, 4}'::int[] <@ int_array FROM t_array_example;

SELECT array_length(int_array, 1) FROM t_array_example;

SELECT string_to_array('12#45#5', '#');

SELECT array_to_string(text_array, ' ; ') FROM t_array_example;

-- 要素を行ごとに展開
SELECT int_number FROM unnest('{1, 4, 5}'::int[]) AS int_number;

SELECT unnest(int_array) FROM t_array_example;
