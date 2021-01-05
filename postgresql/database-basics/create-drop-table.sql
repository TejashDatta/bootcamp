CREATE TABLE t_visa_application (
  country text,
  applicant_name text PRIMARY KEY,
  application_status varchar(7),
  applicant_age int,
  application_start timestamp,
  granted boolean
);

INSERT INTO t_visa_application VALUES
 ('Japan', 'Tejash', 'unknown', 22, '2021-04-01', FALSE);

DROP TABLE t_visa_application;
