CREATE OR REPLACE FUNCTION f_plpgsql_case_condition(a_int int) RETURNS int STRICT
  LANGUAGE plpgsql AS $func$
    DECLARE
      v_comparer int;
    BEGIN
      v_comparer := 10;
      CASE WHEN a_int > v_comparer THEN
        RETURN 1;
      WHEN a_int < v_comparer THEN
        RETURN -1;
      ELSE
        RETURN 0;
      END CASE;      
    END;
  $func$;
