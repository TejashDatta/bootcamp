-- temporary table

CREATE TEMP TABLE t_temp_example (id int);
CREATE TEMP TABLE t_temp_example (id int) ON COMMIT DELETE ROWS;
CREATE TEMP TABLE t_temp_example (id int) ON COMMIT DROP;

-- unlogged table

CREATE UNLOGGED TABLE t_unlogged_example (id int);
