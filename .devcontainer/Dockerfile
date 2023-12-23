FROM node:20.10

# Set the working directory in the Docker image
WORKDIR /usr/src/app

# Copy package.json and package-lock.json from the project root into the Docker image
COPY ../package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of your project from the project root into the Docker image
COPY .. .

# Expose port 3000
EXPOSE 3000

# Define the command to run your app
CMD ["npm", "start"]
