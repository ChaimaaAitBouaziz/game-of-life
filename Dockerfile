FROM openjdk:8-jre-alpine

COPY target/gameoflife.war /opt/gameoflife.jar
CMD ["java", "-jar", "/opt/gameoflife.jar"]

EXPOSE 9090
