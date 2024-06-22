# Use an official Tomcat runtime as a parent image
FROM tomcat:9.0.58-jdk17-openjdk

# Set environment variables
ENV JAVA_OPTS="-Dspring.datasource.url=jdbc:mysql://${DB_HOST}:${DB_PORT}/${DB_NAME} -Dspring.datasource.username=${DB_USER} -Dspring.datasource.password=${DB_PASSWORD}"

# Copy the WAR file to the webapps directory of Tomcat
COPY mydiary-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose the port that Tomcat runs on
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]
