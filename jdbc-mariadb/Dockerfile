FROM alpine:3.7
LABEL MAINTAINER=toon.geens@xenit.eu

ARG MARIADB_JDBC_VERSION
ENV MARIADB_JDBC_VERSION ${MARIADB_JDBC_VERSION:-2.2.5}


ENV JAR_NAME mariadb-java-client-${MARIADB_JDBC_VERSION}.jar

RUN apk add --no-cache --virtual=dependencies curl ca-certificates && \
    curl --create-dirs https://search.maven.org/remotecontent?filepath=org/mariadb/jdbc/mariadb-java-client/${MARIADB_JDBC_VERSION}/${JAR_NAME} --output /jdbc/${JAR_NAME} && \
    chmod o+rx /jdbc/ && \
    apk del dependencies

VOLUME /jdbc