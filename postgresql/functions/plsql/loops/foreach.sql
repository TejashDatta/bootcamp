CREATE OR REPLACE FUNCTION f_plpgsql_foreach_loop() RETURNS SETOF int
  LANGUAGE plpgsql AS $func$
    DECLARE
      v_array int[];
      v_array_element int;
    BEGIN
      v_array := '{1, 5, 6, 7, 9}';
      FOREACH v_array_element IN ARRAY v_array LOOP
        RETURN NEXT v_array_element;
      END LOOP;
    END
  $func$;
