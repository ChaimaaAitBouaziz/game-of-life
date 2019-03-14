FROM openjdk:8-jre-alpine

COPY target/gameoflife.war /opt/gameoflife.jar
CMD ["java", "-jar", "/opt/gameoflife.jar"]

EXPOSE 9090

FROM tomcat:8-jre8

RUN rm -rf /usr/local/tomcat/webapps/*

COPY target/gameoflife.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]
