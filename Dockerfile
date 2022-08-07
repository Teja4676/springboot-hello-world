FROM openjdk:8
ADD target/spring-boot-hello-world-1.0.0.jar app.jar
EXPOSE 8090
ENTRYPOINT ["java","-jar","app.jar"]
