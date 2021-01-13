CREATE OR REPLACE FUNCTION f_perform() RETURNS void
  LANGUAGE plpgsql AS $func$
    BEGIN
      PERFORM f_select_loop();
    END
  $func$;
  