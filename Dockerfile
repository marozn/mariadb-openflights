FROM  mariadb:11.8

COPY  openflights/data/*.dat /data/

COPY  openflights/sql/create.sql /docker-entrypoint-initdb.d/1-create.sql
COPY  openflights/sql/load-data.sql /docker-entrypoint-initdb.d/2-load-data.sql
