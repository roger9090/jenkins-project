FROM node:14-alpine3.12

# Set working directory inside the container
WORKDIR /app

# Copy only the backend folder into /app
COPY backend ./backend

# Set working directory to backend
WORKDIR /app/backend

# Install dependencies from backend folder
COPY backend/package*.json ./
RUN npm install

# Copy all backend code (again if needed)
COPY backend .

# Expose the port used by your app
EXPOSE 8080

# Run the backend app
CMD ["node", "index.js"]
