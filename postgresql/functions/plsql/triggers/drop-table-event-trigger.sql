CREATE OR REPLACE FUNCTION f_event_cannot_drop()
  RETURNS event_trigger LANGUAGE plpgsql AS $$
    DECLARE
      rec RECORD;
    BEGIN
      FOR rec IN SELECT * FROM pg_event_trigger_dropped_objects() LOOP
        IF rec.object_name = 't_user' THEN
          RAISE EXCEPTION 'can''t delete';
        END IF;
      END LOOP;
    END
  $$;

CREATE EVENT TRIGGER evt_cannot_drop ON SQL_DROP
  WHEN TAG IN ('DROP TABLE') EXECUTE PROCEDURE f_event_cannot_drop();
