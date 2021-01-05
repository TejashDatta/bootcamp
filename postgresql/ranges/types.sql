CREATE TABLE t_range_example (
  integer_range int4range,
  big_integer_range int8range,
  number_range numrange,
  timestamp_range tsrange,
  timestamp_timezone_range tstzrange,
  date_range daterange
);

INSERT INTO t_range_example VALUES (
  '[2, 5]',
  '[, 10)',
  '[-1.5, 2.8]',
  '[2019-10-20 00:00:00,)',
  '[2019-10-20 00:00:00 CET, 2019-11-20 10:00:00 CET]',
  '[2020-1-1, 2020-2-1]'
);
