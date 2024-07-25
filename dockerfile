# Set the base image
FROM maven:3.8.4-openjdk-11-slim

# Set the working directory
WORKDIR /app

# Copy the project files
COPY . .

# Make the mvnw script executable
RUN chmod +x ./mvnw

# Run the Maven package command without tests
RUN ./mvnw clean package -DskipTests
