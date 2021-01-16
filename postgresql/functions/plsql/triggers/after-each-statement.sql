CREATE OR REPLACE FUNCTION f_trigger_update_notification() RETURNS trigger
  LANGUAGE plpgsql AS $func$
    BEGIN
      RAISE NOTICE 'updated table';
      RETURN NULL;
    END
  $func$;

CREATE TRIGGER trg_update_notification AFTER INSERT OR UPDATE ON t_user
  FOR STATEMENT EXECUTE PROCEDURE f_trigger_update_notification();

UPDATE t_user SET reg_name = 'Oojan' WHERE kaiin_no = 1010;

DROP TRIGGER trg_update_notification ON t_user;
