FROM alpine:3.7
LABEL MAINTAINER=toon.geens@xenit.eu

ARG MYSQL_JDBC_VERSION
ENV MYSQL_JDBC_VERSION ${MYSQL_JDBC_VERSION:-5.1.42}

ENV JAR_NAME mysql-connector-java-${MYSQL_JDBC_VERSION}.jar

RUN apk add --no-cache --virtual=mysql-dependencies curl ca-certificates && \
    curl --create-dirs https://repo1.maven.org/maven2/mysql/mysql-connector-java/${MYSQL_JDBC_VERSION}/${JAR_NAME} --output /jdbc/${JAR_NAME} && \
    chmod o+rx /jdbc/ && \
    apk del mysql-dependencies

VOLUME /jdbc