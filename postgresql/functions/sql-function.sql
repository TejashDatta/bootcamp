CREATE OR REPLACE FUNCTION f_add_day(ts timestamp) RETURNS timestamp 
  LANGUAGE sql AS $func$ 
    SELECT ts + '1 day'::interval; 
  $func$;

-- strict fucntion option: if parameter null, return null

CREATE OR REPLACE FUNCTION f_add_day_strict (ts timestamp) RETURNS timestamp STRICT
  LANGUAGE sql AS $func$ 
    SELECT ts + '1 day'::interval; 
  $func$;

CREATE OR REPLACE FUNCTION f_all_names() RETURNS SETOF text
  LANGUAGE sql AS $func$
    SELECT reg_name FROM t_user;
  $func$;

DROP FUNCTION f_add_day;
