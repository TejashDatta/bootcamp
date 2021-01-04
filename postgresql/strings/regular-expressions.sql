SELECT * FROM t_user WHERE email LIKE '%yahoo%';
SELECT * FROM t_user WHERE email ILIKE '_aki%';
SELECT * FROM t_user WHERE email SIMILAR TO '[[:alnum:]]*@%';
SELECT * FROM t_user WHERE email SIMILAR TO '[[:alnum:]]*';
SELECT * FROM t_user WHERE email ~* '[[:alnum:]]*';
SELECT regexp_matches(email, '[[:alnum:]]*') from t_user;
SELECT regexp_replace(email, '.*@', 'same@') from t_user;
