CREATE OR REPLACE FUNCTION f_plpgsql_loop() RETURNS SETOF int
  LANGUAGE plpgsql AS $func$
    DECLARE
      v_loop_counter int;
    BEGIN
      v_loop_counter := 1;
      LOOP
        v_loop_counter := v_loop_counter + 1;
        CONTINUE WHEN v_loop_counter = 3;
        RETURN NEXT v_loop_counter;
        EXIT WHEN v_loop_counter > 5;
      END LOOP; 
    END;
  $func$;
