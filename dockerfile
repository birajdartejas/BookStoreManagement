# Set the base image
FROM maven:3.8.4-openjdk-11-slim

# Set the working directory
WORKDIR /app

# Copy the project files
COPY . .

# Make the mvnw script executable
RUN chmod +x ./mvnw

# Print Maven version to ensure Maven is installed correctly
RUN ./mvnw -v

# Run the Maven package command without tests and with debug output
RUN ./mvnw clean package -DskipTests -X

# Expose the port the app runs on
EXPOSE 8080

# Specify the command to run the app
CMD ["java", "-jar", "target/your-app.jar"]
