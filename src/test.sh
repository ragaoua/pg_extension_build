#!/bin/bash

/usr/pgsql-17/bin/initdb
/usr/pgsql-17/bin/pg_ctl start

psql <<EOF
CREATE EXTENSION pg_make_title;
SELECT convert_to_title('create your first extension');
EOF
