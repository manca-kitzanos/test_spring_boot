FROM amazoncorretto:17.0.8-alpine3.17
ENV TZ="Europe/Rome"
EXPOSE 8080
ADD /target/test_spring_boot-0.0.1-SNAPSHOT.jar test_spring_boot-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java", "-jar","test_spring_boot-0.0.1-SNAPSHOT.jar"]
