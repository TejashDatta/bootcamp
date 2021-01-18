BEGIN;
INSERT INTO t_course VALUES
  ('EV10', 'Environment Science', 'Dr. Smith', 2);
UPDATE t_student SET major_course = 'EV10' WHERE name = 'Tejash';
END;
