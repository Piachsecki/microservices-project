# Use the official OpenJDK 21 image as the base image
FROM openjdk:21-jdk

# Set the working directory inside the container
WORKDIR /app

# Copy the jar file of the application to the container
COPY target/order-service-3.3.4.jar /app/order-service.jar

# Expose the port on which the application will run
EXPOSE 8082

# Set the entry point to run the jar file
ENTRYPOINT ["java", "-jar", "/app/order-service.jar", "--server.port=8081"]