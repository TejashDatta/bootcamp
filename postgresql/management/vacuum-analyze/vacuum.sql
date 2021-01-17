VACUUM t_user;

-- vacuum full db
VACUUM;

VACUUM VERBOSE;

-- remove blank lines after vacuum
VACUUM FULL;

-- set XID of all lines
VACUUM FREEZE;

-- analyze at same time
VACUUM ANALYZE;
