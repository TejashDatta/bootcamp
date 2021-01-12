-- 修飾子

CREATE TABLE t_primary_key_example_1 (
  id int PRIMARY KEY,
  full_name text
);

-- 複数列

CREATE TABLE t_primary_key_example_2 (
  full_name text,
  age int,
  PRIMARY KEY (full_name, age)
);
