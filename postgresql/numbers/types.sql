CREATE TABLE example (
  small smallint,
  medium int,
  big bigint,
  deci real,
  big_deci double precision,
  custom1 numeric(3, 2),
  custom2 numeric(3),
  custom3 numeric
);

INSERT INTO example(deci, big_deci, custom1) VALUES
  ('infinity', '-infinity', 'NaN');
