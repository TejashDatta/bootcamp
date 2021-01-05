-- 色んな日付時刻データ型の実装

CREATE TABLE t_time_example (
  timestamp1 timestamp,
  timestamp2 timestamptz,
  timestamp3 timestamp(0),
  time1 time,
  time2 timetz,
  date1 date,
  interval1 interval
);

INSERT INTO t_time_example VALUES (
  '2020-06-20 15:45:11.44',
  '2020-06-20 15:45:11.44 IST',
  '2020-06-20 15:45:11',
  '15:45:11',
  '15:45:11 IST',
  '2020-06-20',
  '5 days 8 hours 20 mins'
);

INSERT INTO t_time_example VALUES (
  'epoch',
  '2020-06-20 15:45:11.44 +5:30',
  '-infinity',
  'now'
);
