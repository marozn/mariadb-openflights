FROM  mariadb:11.8

COPY  openflights/structure.sql /docker-entrypoint-initdb.d/1-create-structure.sql
COPY  openflights/data.sql /docker-entrypoint-initdb.d/2-load-data.sql
