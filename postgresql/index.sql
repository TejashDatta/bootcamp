CREATE INDEX ON t_message (from_no);

DROP INDEX t_message_from_no_idx;

-- primary key -> automatic index

ALTER TABLE t_message ADD PRIMARY KEY (from_no, to_no, ts);
