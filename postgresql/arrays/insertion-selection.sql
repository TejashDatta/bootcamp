CREATE TABLE t_array_example (
  int_array int[],
  text_array text[]
);

INSERT INTO t_array_example VALUES (
  '{2, 4, 5}',
  '{hello, konnichiwa}'
);

INSERT INTO t_array_example VALUES (
  '{20, 40, 50}',
  '{lo, ichiwa, quack}'
);

SELECT int_array[2] FROM t_array_example WHERE text_array[1] = 'hello';
