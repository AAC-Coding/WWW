# Dockerfile
FROM node:18-alpine

# create destination directory
RUN mkdir -p /usr/src/www
WORKDIR /usr/src/www

# update and install dependency
RUN apk update && apk upgrade
RUN apk add git

# copy the app, note .dockerignore
COPY . /usr/src/www/

ARG API_URL ${API_URL}
ARG API_KEY ${API_KEY}

RUN npm install
RUN npm run build

# Create a non-root user and switch to that user
RUN adduser -D www
USER www

EXPOSE 3000

# Start the application
CMD [ "npm", "run", "start" ]