CREATE TABLE t_unique_example (
  id int UNIQUE,
  combined_unique_1 text,
  combined_unique_2 text,
  UNIQUE (combined_unique_1, combined_unique_2)
);

INSERT INTO t_unique_example VALUES (1, 'a', 'b');
INSERT INTO t_unique_example VALUES (2, 'a', NULL);
INSERT INTO t_unique_example VALUES (3, 'a', NULL);
INSERT INTO t_unique_example VALUES (NULL, 'a', NULL);
