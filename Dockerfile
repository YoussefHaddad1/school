# Utiliser une image Java officielle
FROM openjdk:17-jdk-slim

# Copier l'application compilée
COPY target/school-1.0.0.jar app.jar

# Exposer le port utilisé par Spring Boot
EXPOSE 8080

# Lancer l'application
ENTRYPOINT ["java", "-jar", "/app.jar"]
