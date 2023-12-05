# FROM maven:3.8.5-openjdk-17 AS build
# COPY . .
# RUN mvn clean package -DskipTests

# FROM openjdk:17.0.1-jdk-slim
# COPY --from=build /target/demo-0.0.1-SNAPSHOT.jar demo.jar
# EXPOSE 8080
# ENTRYPOINT ["java","-jar","demo.jar"]

FROM maven:3.8.3-openjdk-17-slim

RUN mvn clean package -DskipTests

FROM openjdk:17.0.1-jdk-slim-bullseye

COPY --from=build /target/spring-boot-0.0.1-SNAPSHOT.jar /spring-boot.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/spring-boot.jar"]