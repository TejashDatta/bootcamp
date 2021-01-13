CREATE OR REPLACE FUNCTION f_plpgsql_if(a_int int) RETURNS int STRICT
  LANGUAGE plpgsql AS $func$
    DECLARE
      v_comparer int;
    BEGIN
      v_comparer := 10;
      IF a_int > v_comparer THEN
        RETURN 1;
      ELSIF a_int < v_comparer THEN
        RETURN -1;
      ELSE
        RETURN 0;
      END IF;
    END;
  $func$;
