BEGIN;
SELECT lo_unlink(picture) FROM t_user_profile WHERE kaain_no = 1001;
UPDATE t_user_profile SET picture = NULL WHERE kaain_no = 1001;
COMMIT;
