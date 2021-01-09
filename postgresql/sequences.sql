CREATE SEQUENCE seq1 INCREMENT 5 START 10;

SELECT nextval('seq1');
SELECT currval('seq1');
SELECT setval('seq1', 47);

DROP SEQUENCE seq1;
