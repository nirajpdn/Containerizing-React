# Pull base image of node 16
FROM node:16-alpine

# Set working directory
WORKDIR /app

# Set the PATH variable to /app/node_modules/.bin:$PATH
ENV PATH = "/app/node_modules/.bin:$PATH"

# Copy app to the server
COPY . .

# Install dependencies
RUN npm install

# Build the application
RUN npm run build

# Start the application server
CMD ["npm","start"]