-- ALWAYS

CREATE TABLE t_generated_example_1 (
  id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY
);

INSERT INTO t_generated_example_1 DEFAULT VALUES; 
INSERT INTO t_generated_example_1 DEFAULT VALUES; 
INSERT INTO t_generated_example_1 DEFAULT VALUES; 

-- error
INSERT INTO t_generated_example_2 VALUES (90);

-- 全オプション with DEFAULT

CREATE TABLE t_generated_example_2 (
  id int PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY (MINVALUE 10 MAXVALUE 20 START 15 INCREMENT 5)
);

INSERT INTO t_generated_example_2 DEFAULT VALUES; 

INSERT INTO t_generated_example_2 VALUES (90);

-- without cycle

CREATE TABLE t_generated_example_3 (
  id int PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY (MINVALUE 10 MAXVALUE 20 START 15 INCREMENT 5)
);

INSERT INTO t_generated_example_3 DEFAULT VALUES; 
INSERT INTO t_generated_example_3 DEFAULT VALUES; 

-- error
INSERT INTO t_generated_example_3 DEFAULT VALUES; 
