CREATE OR REPLACE FUNCTION f_plpgsql_for_loop() RETURNS SETOF int
  LANGUAGE plpgsql AS $func$
    DECLARE
      v_loop_counter int;
    BEGIN
      FOR v_loop_counter IN 1..5 LOOP
        RETURN NEXT v_loop_counter;
      END LOOP;
    END;
  $func$;
