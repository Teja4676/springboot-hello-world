FROM openjdk:8
ADD target/spring-boot-hello-world-1.0.0.war app.war
ENTRYPOINT ["java","-jar","app.war"]
