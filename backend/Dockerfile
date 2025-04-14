# Use official lightweight Node.js image
FROM node:14-alpine3.12

# Set working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose the correct port your app uses
EXPOSE 8080

# Run the app
CMD ["node", "index.js"]
