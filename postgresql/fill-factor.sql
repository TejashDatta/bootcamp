CREATE TABLE t_fill_factor_example (
  id int
) WITH (fillfactor = 70);

ALTER TABLE t_fill_factor_example SET (fillfactor = 100);
