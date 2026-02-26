FROM maven:3.8.6-eclipse-temurin-17 AS build

COPY src /leolaptop/spring-mvc/src
COPY pom.xml /leolaptop/spring-mvc

WORKDIR /leolaptop/spring-mvc

RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre-alpine

COPY --from=build /leolaptop/spring-mvc/target/*.war /leolaptop/spring-mvc/app.war
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/leolaptop/spring-mvc/app.war"]