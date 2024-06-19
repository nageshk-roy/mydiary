# Start with a base image that includes Java 17 and Tomcat
FROM tomcat:9.0-jdk17-temurin

# Maintainer information
LABEL maintainer="your-email@example.com"

# Remove the default webapps to keep the image lightweight
RUN rm -rf /mydiary/target/*

# Copy the WAR file to the webapps directory of Tomcat
COPY mydiary-0.0.1-SNAPSHOT.war /mydiary/target/mydiary-0.0.1-SNAPSHOT.war

# Expose the port that Tomcat is running on
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]


