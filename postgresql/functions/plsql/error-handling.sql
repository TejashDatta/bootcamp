CREATE OR REPLACE FUNCTION f_errors(option int) RETURNS int
  LANGUAGE plpgsql AS $func$
  BEGIN
    CASE option
    WHEN 0 THEN RETURN 10/0;
    ELSE
      RAISE EXCEPTION 'custom error' USING ERRCODE = 'PX001', 
        DETAIL = 'this is my custome error';
    END CASE;
  EXCEPTION
    WHEN division_by_zero THEN
      RAISE NOTICE 'caught divide by zero error';
      RETURN 0;
    WHEN SQLSTATE 'PX001' THEN
      RAISE NOTICE 'caught custom error';
      RETURN 0;
    WHEN others THEN
      RAISE NOTICE 're-raise other error';
      RAISE;
  END
  $func$;

\errverbose
