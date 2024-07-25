# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy the Maven wrapper and source code
COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY src ./src

# Package the application using Maven
RUN ./mvnw clean package -DskipTests

# Expose the port the app runs on
EXPOSE 8080

# Run the application
ENTRYPOINT ["java","-jar","target/*.jar"]
