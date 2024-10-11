# Use the official OpenJDK 21 image as the base image
FROM openjdk:21-jdk

# Set the working directory inside the container
WORKDIR /app

# Copy the jar file of the application to the container
COPY target/api-gateway-3.3.4.jar /app/api-gateway.jar

# Expose the port on which the application will run
EXPOSE 9000

# Set the entry point to run the jar file
ENTRYPOINT ["java", "-jar", "/app/api-gateway.jar", "--server.port=9000"]