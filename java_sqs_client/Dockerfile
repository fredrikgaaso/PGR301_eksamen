FROM maven:3.9.0-eclipse-temurin-17 AS build

WORKDIR /app

COPY pom.xml .
RUN mvn dependency:go-offline

COPY src ./src

RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim

WORKDIR /app

COPY --from=build /app/target/*SNAPSHOT.jar app.jar

ENV SQS_QUEUE_URL = "https://sqs.eu-west-1.amazonaws.com/244530008913/lambda_sqs_queue_75"

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
