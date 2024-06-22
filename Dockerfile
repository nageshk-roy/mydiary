
#From maven:3.8.5-openjdk-17  As build
#COPY . .
#RUN mvn clean package -DskipTests

#From openjdk:17.0.1-jdk-slim
#COPY --from=build /target/mydiary-0.0.1-SNAPSHOT.jar mydiary.jar
#ENV JAVA_OPTS="-Dspring.datasource.url=jdbc:mysql://${DB_HOST}:${DB_PORT}/${DB_NAME} -Dspring.datasource.username=${DB_USER} -Dspring.datasource.password=${DB_PASSWORD}"
#EXPOSE 8080
#ENTRYPOINT ["java","-jar","mydiary.jar"]
From maven:3.8.5-openjdk-17  As build
COPY . .
RUN mvn clean package -DskipTests

# Use the official OpenJDK image from the Docker Hub
From openjdk:17.0.1-jdk-slim

# Set the working directory inside the container
#WORKDIR /mydiary

# Copy the JAR file to the container
COPY --from=build /target/mydiary-0.0.1-SNAPSHOT.jar mydiary.jar

# Expose the port that the application runs on
EXPOSE 8080

# Set environment variables for the database connection
ENV SPRING_DATASOURCE_URL=jdbc:mysql://${DB_HOST}:${DB_PORT}/${DB_NAME}
ENV SPRING_DATASOURCE_USERNAME=${DB_USER}
ENV SPRING_DATASOURCE_PASSWORD=${DB_PASSWORD}

ENV SERVER_PORT=9090

# Run the application with the custom port
ENTRYPOINT ["java", "-jar", "mydiary.jar", "--server.port=${SERVER_PORT}"]

