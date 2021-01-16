CREATE OR REPLACE FUNCTION f_plpgsql_case_value(a_int int) RETURNS int STRICT
  LANGUAGE plpgsql AS $func$
    BEGIN
      CASE a_int
      WHEN 10 THEN
        RETURN 1;
      WHEN 20 THEN
        RETURN -1;
      ELSE
        RETURN 0;
      END CASE;
    END;
  $func$;
