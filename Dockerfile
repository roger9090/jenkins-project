# Use base image
FROM openjdk:11

# Copy jar to container
COPY target/myapp.jar /app.jar

# Run the jar file
ENTRYPOINT ["java", "-jar", "/app.jar"]
