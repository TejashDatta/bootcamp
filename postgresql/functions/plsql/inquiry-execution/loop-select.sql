CREATE OR REPLACE FUNCTION f_select_loop() RETURNS SETOF text
  LANGUAGE plpgsql AS $func$
    DECLARE
      v_user RECORD;
    BEGIN
      FOR v_user IN SELECT * FROM t_user LOOP
        RETURN NEXT v_user.reg_name;
      END LOOP;
    END
  $func$;
