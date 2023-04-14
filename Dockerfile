ARG COMMIT_HASH

FROM node:18-alpine

# Set working directory
WORKDIR /var/www/dockerize-nuxt/nuxt-app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm install

# Copy application files and build
COPY . .
RUN npm run build

# Expose port and set environment variables
EXPOSE 4000
COPY config.env .
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=4000
ENV API_URL=${API_URL}
ENV API_KEY=${API_KEY}

# Set a label for the commit hash
LABEL commit_hash=$COMMIT_HASH

# Start the application
CMD [ "npm", "start" ]
