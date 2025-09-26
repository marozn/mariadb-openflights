FROM  mariadb:11.8

COPY  openflights/data/*.dat /docker-entrypoint-initdb.d/data/

COPY  openflights/sql/create.sql /docker-entrypoint-initdb.d/1-create.sql
COPY  openflights/sql/load-data.sql /docker-entrypoint-initdb.d/2-load-data.sql
COPY  openflights/sql/load-other-airport-dbs.sql /docker-entrypoint-initdb.d/3-load-other-airport-dbs.sql
