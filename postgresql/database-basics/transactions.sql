BEGIN;
UPDATE t_user SET reg_name = 'Tejash Sen' WHERE reg_name = 'Tejash';
SELECT * FROM t_user;
ROLLBACK;
SELECT * FROM t_user;

BEGIN;
UPDATE t_user SET reg_name = 'Tejash Sen' WHERE reg_name = 'Tejash';
COMMIT;
SELECT * FROM t_user;
