FROM node:18-alpine as building

RUN apk add --update nodejs npm

WORKDIR /app

COPY . /app

RUN npm cache clean --force && npm install
EXPOSE 3000
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000
RUN source .env && npm run build
RUN npm run generate

FROM nginx:1.23-alpine AS production
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=building /app/dist /usr/share/nginx/html
EXPOSE 80
