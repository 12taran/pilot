# Use the official Node.js image from the Docker Hub
FROM node:20

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install Node.js and npm dependencies
RUN npm install

# Copy the rest of your application files into the container
COPY . .

# Expose the port your app runs on
EXPOSE 4000

# Command to run the application
CMD ["npm", "start"]

