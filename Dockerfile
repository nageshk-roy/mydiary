# Use an official Tomcat base image
FROM tomcat:9.0

# Maintainer information
LABEL maintainer="your_email@example.com"

# Copy the WAR file to the webapps directory of Tomcat
COPY mydiary-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port
EXPOSE 8005

# Set the environment variable to configure Tomcat (optional)
ENV CATALINA_OPTS=""

# Start Tomcat by running the catalina.sh script
CMD ["catalina.sh", "run"]
