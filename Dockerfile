# Use a base Java image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /mydiary/src/app

# Copy the WAR file into the container at /app
COPY mydiary-0.0.1-SNAPSHOT.war /app

# Expose the port your application runs on
EXPOSE 8080

# Command to run your application
CMD ["java", "-jar", "application.war"]
