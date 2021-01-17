-- database permissions

-- to create schema in db1
GRANT CREATE ON DATABASE db1 TO user1;

-- granted by default
REVOKE CONNECT, TEMPORARY ON DATABASE FROM user1;

-- schema permissions

GRANT USAGE, CREATE ON SCHEMA schema1 TO user1;
