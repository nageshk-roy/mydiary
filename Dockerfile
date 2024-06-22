FROM openjdk:17-jdk

WORKDIR /app

COPY ./mydiary-0.0.1-SNAPSHOT.war /app/mydiary-0.0.1-SNAPSHOT.war

CMD ["java", "-jar", "mydiary-0.0.1-SNAPSHOT.war"]
