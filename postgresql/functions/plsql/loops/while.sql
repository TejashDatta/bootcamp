CREATE OR REPLACE FUNCTION f_plpgsql_while_loop() RETURNS SETOF int
  LANGUAGE plpgsql AS $func$
    DECLARE
      v_loop_counter int;
    BEGIN
      v_loop_counter := 1;
      WHILE v_loop_counter <= 5 LOOP
        RETURN NEXT v_loop_counter;
        v_loop_counter := v_loop_counter + 1;
      END LOOP; 
    END;
  $func$;
