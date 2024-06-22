FROM tomcat:10.0-jdk17

COPY ./mydiary-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
