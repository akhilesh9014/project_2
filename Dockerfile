FROM openjdk:8-alpine

MAINTAINER akhi@gmail.com

RUN apk update && apk add /bin/sh
RUN mkdir -p /opp/app
ENV PROJECT_HOME /opt/app

#RUN mkdir /opt/tomcat/

COPY target/*.war $PROJECT_HOME/myapp.war

WORKDIR $PROJECT_HOME 
EXPOSE 8080

CMD ["java", "run"]
