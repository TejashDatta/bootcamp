-- 連結
SELECT '\xa0a0'::bytea || '\x0a0a'::bytea;

SELECT length('\xa0a0'::bytea);

SELECT substring('\xa0a0a0'::bytea FROM 2 FOR 1);

SELECT position('\x0b'::bytea IN '\xa00ba0');

SELECT encode('~'::bytea, 'hex');
SELECT encode('~'::bytea, 'escape');
SELECT encode('~'::bytea, 'base64');

SELECT decode('fg==', 'base64');

-- 文字列変換

SELECT convert_from('\x7e', 'UTF-8');
SELECT convert_to('~', 'UTF-8');
