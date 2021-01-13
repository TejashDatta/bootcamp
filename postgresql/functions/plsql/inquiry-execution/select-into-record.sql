CREATE OR REPLACE FUNCTION f_select_into_record(a_kaiin_no int) 
  RETURNS text STRICT LANGUAGE plpgsql AS $func$
    DECLARE
      v_employee RECORD;
    BEGIN
      SELECT INTO v_employee
        * FROM t_user WHERE kaiin_no = a_kaiin_no;
      IF FOUND THEN
        RETURN v_employee.reg_name;
      ELSE
        RETURN 'none';
      END IF;
    END
  $func$;

SELECT f_select_into_record(1001);
