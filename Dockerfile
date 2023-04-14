ARG COMMIT_HASH

FROM node:18-alpine

# Set working directory
WORKDIR /var/www/dockerize-nuxt/nuxt-app

# Copy package.json and install dependencies
COPY package*.json ./
RUN npm cache clean --force && npm install

# Copy application files and build
COPY . .
RUN source .prod.env && npm run build

# Expose port and set environment variables
EXPOSE 4000
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=4000

# Set a label for the commit hash
LABEL commit_hash=$COMMIT_HASH


#-----------------#

FROM nginx:1.23-alpine

RUN rm -rf /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d