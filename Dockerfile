FROM openjdk:8-jre-alpine

COPY target/api.war /opt/api.jar
CMD ["java", "-jar", "/opt/api.jar", "--spring.profiles.active=devdocker"]

EXPOSE 9090
