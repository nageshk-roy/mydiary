# Use an official Tomcat base image
FROM tomcat:9.0

# Maintainer information
LABEL maintainer="your_email@example.com"

# Add the WAR file to the webapps directory of Tomcat
COPY mydiary-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/

# Expose the port on which Tomcat runs
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
