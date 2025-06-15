# Use official Node.js image
FROM node:18

# Install Python (needed by yt-dlp-exec or similar)
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean

# Create app directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the app files
COPY . .

# Expose the port Railway will use
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
