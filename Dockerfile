# Stage 1 - Build Application

FROM maven:3.9.6-eclipse-temurin-17 AS build

WORKDIR /app

COPY . .

RUN mvn clean install -DskipTests


# Stage 2 - Run Application

FROM eclipse-temurin:17-jdk-alpine

WORKDIR /opt/app

COPY --from=build /app/target/ExpressCinema-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 2025

ENTRYPOINT ["java", "-jar", "app.jar"]
