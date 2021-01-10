CREATE TABLE t_alter_example (
  first_name text
);

ALTER TABLE t_alter_example ALTER first_name SET DEFAULT 'first-name';
ALTER TABLE t_alter_example ALTER first_name DROP DEFAULT;

ALTER TABLE t_alter_example ALTER first_name SET NOT NULL;
ALTER TABLE t_alter_example ALTER first_name DROP NOT NULL;

ALTER TABLE t_check_example DROP CONSTRAINT t_check_example_age_check;

ALTER TABLE t_alter_example ADD last_name text;
ALTER TABLE t_alter_example ALTER last_name TYPE varchar(20);
ALTER TABLE t_alter_example DROP last_name;
