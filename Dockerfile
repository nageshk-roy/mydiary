
From maven:3.8.5-openjdk-17  As build
COPY . .
RUN mvn clean package -DskipTests

From openjdk:17.0.1-jdk-slim
COPY --from=build /target/mydiary-0.0.1-SNAPSHOT.jar mydiary.jar
ENV JAVA_OPTS="-Dspring.datasource.url=jdbc:mysql://${DB_HOST}:${DB_PORT}/${DB_NAME} -Dspring.datasource.username=${DB_USER} -Dspring.datasource.password=${DB_PASSWORD}"
EXPOSE 8080
ENTRYPOINT ["java","-jar","mydiary.jar"]
