# /bin/bash

gunzip < dump.sql.gz | psql -U $POSTGRES_USER -d $POSTGRES_DB 

rm dump.sql.gz