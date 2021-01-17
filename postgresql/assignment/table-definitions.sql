CREATE TABLE t_course (
  code char(4) PRIMARY KEY,
  subject varchar(20),
  professor varchar(20) NOT NULL,
  total_credits int CHECK (credits > 0 AND credits <= 5) NOT NULL
);

CREATE TABLE t_student (
  id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY(START 1000),
  name varchar(20) NOT NULL,
  birthday date,
  gender char(1) CHECK (gender IN ('m', 'f')),
  major_course char(4) REFERENCES t_course(code) NOT NULL
);

CREATE INDEX ON t_student (name);
