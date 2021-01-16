CREATE OR REPLACE FUNCTION f_execute_insert(a_kaiin_no int, a_reg_name text)
  RETURNS void LANGUAGE plpgsql AS $func$
    BEGIN
      EXECUTE
        $sql$ INSERT INTO t_user(kaiin_no, reg_name) VALUES($1, $2) $sql$
        USING a_kaiin_no, a_reg_name;
    END
  $func$;

SELECT f_execute_insert(1020, 'Adam');
