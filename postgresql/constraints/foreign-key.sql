CREATE TABLE t_foreign_key_example (
  id int PRIMARY KEY,
  name text
);

CREATE TABLE t_foreign_key_reference_example (
  id int,
  foreign_id int REFERENCES t_foreign_key_example(id),
  description text
);

INSERT INTO t_foreign_key_example VALUES
  (10, 'Tej');

INSERT INTO t_foreign_key_reference_example VALUES
  (1, 10, 'a person');

-- wrong
  
INSERT INTO t_foreign_key_reference_example VALUES
  (1, 100, 'a person');

ALTER TABLE t_user_history
  ADD FOREIGN KEY (kaiin_no) REFERENCES t_user_auth (kaiin_no);


