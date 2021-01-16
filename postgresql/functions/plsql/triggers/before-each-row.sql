CREATE OR REPLACE FUNCTION f_trigger_edit_row() RETURNS trigger
  LANGUAGE plpgsql AS $func$
    BEGIN
      NEW.reg_name = OLD.reg_name || ' edited';
      RETURN NEW;
    END
  $func$;

CREATE TRIGGER trg_edit_row BEFORE UPDATE ON t_user
  FOR EACH ROW EXECUTE PROCEDURE f_trigger_edit_row();

INSERT INTO t_user VALUES (1011, 'Gopal', 'gopal@email.com' ,'free');
UPDATE t_user SET kaiin_no = 1012 WHERE kaiin_no = 1011;
