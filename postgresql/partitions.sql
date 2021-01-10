CREATE TABLE t_message_p (
  from_no int,
  to_no int,
  ts timestamp(0),
  mes text
) PARTITION BY RANGE (ts);

CREATE TABLE t_message_2017 PARTITION OF t_message_p
  (PRIMARY KEY (from_no, to_no, ts))
  FOR VALUES FROM ('2017-01-01') TO ('2018-01-01');

CREATE TABLE t_message_2018 PARTITION OF t_message_p
  (PRIMARY KEY (from_no, to_no, ts))
  FOR VALUES FROM ('2018-01-01') TO ('2019-01-01');

INSERT INTO t_message_p SELECT * FROM t_message;
