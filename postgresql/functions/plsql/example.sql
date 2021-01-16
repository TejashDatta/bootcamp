CREATE OR REPLACE FUNCTION f_add_message(a_from int, a_to int, a_message text)
  RETURNS boolean STRICT LANGUAGE plpgsql AS $func$
    DECLARE
      v_timestamp timestamp;
      v_count int;
    BEGIN
      v_timestamp := CURRENT_TIMESTAMP;
      SELECT INTO v_count
        count(*) FROM t_user WHERE kaiin_no IN (a_from, a_to);
      IF v_count != 2 THEN
        RAISE NOTICE '';
        RETURN FALSE;
      END IF;
      INSERT INTO t_message VALUES
        (a_from, a_to, v_timestamp, a_message);
      RETURN TRUE;
    
    EXCEPTION
      WHEN unique_violation THEN
        RAISE NOTICE 'Harmless collision!';
        RETURN FALSE;
    END;
  $func$;
