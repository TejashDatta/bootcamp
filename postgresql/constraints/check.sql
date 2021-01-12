CREATE TABLE t_check_example (
  age int CHECK (age >= 18),
  parent_age int,
  full_name text CHECK (full_name SIMILAR TO '[[:alnum:]^[:digit:]]+ [[:alnum:]^[:digit:]]+'),
  CHECK (age < parent_age)
);

INSERT INTO t_check_example VALUES
  (20, 40, 'Tej Data');

-- wrong examples

INSERT INTO t_check_example VALUES
  (10, 40, 'Tej');

INSERT INTO t_check_example VALUES
  (30, 20, 'Tej');

INSERT INTO t_check_example VALUES
  (20, 40, 'Tej');


