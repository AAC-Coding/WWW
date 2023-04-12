# Dockerfile
FROM node:18-alpine

WORKDIR /app
COPY . /app
RUN npm cache clean --force && npm install
RUN source .env && npm run build

EXPOSE 3000

CMD [ "npm", "run", "start" ]