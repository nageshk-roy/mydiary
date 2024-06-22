# Use the official OpenJDK image from the Docker Hub
FROM openjdk:11-jdk-slim

# Set the working directory inside the container
#WORKDIR /app

# Copy the JAR file to the container
COPY target/mydiary-0.0.1-SNAPSHOT.jar app.jar

# Expose the port that the application runs on
EXPOSE 8080

# Set environment variables for the database connection and server port
ENV SPRING_DATASOURCE_URL=jdbc:mysql://${DB_HOST}:${DB_PORT}/${DB_NAME}
ENV SPRING_DATASOURCE_USERNAME=${DB_USER}
ENV SPRING_DATASOURCE_PASSWORD=${DB_PASSWORD}
ENV SERVER_PORT=9090

# Run the application with the custom port
ENTRYPOINT ["java", "-jar", "app.jar", "--server.port=${SERVER_PORT}"]
