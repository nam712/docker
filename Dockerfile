

FROM mysql:latest
 
ENV MYSQL_ROOT_PASSWORD=root
 
COPY  ./db_ktx.sql /docker-entrypoint-initdb.d
