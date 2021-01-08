CREATE TABLE t_default_example (
  age int DEFAULT 18,
  name text DEFAULT 'Blank name'
);

INSERT INTO t_default_example(age) VALUES (10);

INSERT INTO t_default_example VALUES (10, DEFAULT);

INSERT INTO t_default_example DEFAULT VALUES;
