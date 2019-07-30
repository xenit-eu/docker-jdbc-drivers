# docker-jdbc-drivers

[![Build Status](https://jenkins-2.xenit.eu/buildStatus/icon?job=Xenit+Github%2Fdocker-jdbc-drivers%2Fmaster)](https://jenkins-2.xenit.eu/job/Xenit%20Github/job/docker-jdbc-drivers/job/master/)
[![License: LGPL v3](https://img.shields.io/badge/License-LGPL%20v3-blue.svg)](https://www.gnu.org/licenses/lgpl-3.0)

This project builds docker images with JDBC drivers.

## Building and resulting images

When the master branch is built on Jenkins, 
the resulting images are published to Docker Hub under the following image names:  
* [xeniteu/jdbc-mysql](https://hub.docker.com/r/xeniteu/jdbc-mysql)  
* [xeniteu/jdbc-mariadb](https://hub.docker.com/r/xeniteu/jdbc-mariadb)    

Building locally produces images with the same name on your system but does not push them. 
You can do this with the `./gradlew buildDockerImage` task.

## Usage 

You can use these images in docker-compose setups like the example below. 
It shares a `jdbc` volume between the `alfresco` and the `jdbc-driver` service. 
This volume is referred to in the custom environment variables of the `alfresco` service.  

```
version: '2.1'

services:
  alfresco:
    volumes:
    - jdbc:/jdbc/
    environment:
    - DB_URL=jdbc:mysql://database/alfresco?useUnicode=yes\&characterEncoding=UTF-8
    - JAVA_OPTS_JDBC_DRIVER=-Dtomcat.common.loader.append=/jdbc/*.jar

  database:
    image: mariadb:10.1
    volumes:
    - mariadb:/var/lib/mysql
    environment:
    - MYSQL_ROOT_PASSWORD=root
    - MYSQL_USER=alfresco
    - MYSQL_PASSWORD=admin
    - MYSQL_DATABASE=alfresco

  jdbc-driver:
    image: xeniteu/jdbc-mariadb:2.2.5
    volumes:
    - jdbc:/jdbc/

volumes:
  mariadb:
  jdbc:
```




