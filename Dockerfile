# Use an official Tomcat runtime as a parent image
FROM tomcat:9.0.58-jdk17-openjdk

# Set environment variables
ENV JAVA_OPTS="-Dspring.datasource.url=jdbc:mysql://${monorail.proxy.rlwy.net}:${51676}/${railway} -Dspring.datasource.username=${root} -Dspring.datasource.password=${SPbhSgWERoNgPdVaGFZnKEKbxaMNXxux}"

# Copy the WAR file to the webapps directory of Tomcat
COPY target/mydiary-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

# Expose the port that Tomcat runs on
EXPOSE 8080

# Run Tomcat
CMD ["catalina.sh", "run"]
