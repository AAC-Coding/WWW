FROM node:18-alpine as builder

RUN apk add --update nodejs npm

WORKDIR /app

COPY . /app

RUN npm cache clean --force && npm install
EXPOSE 3000
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000
RUN source .env && npm run build

FROM nginx:1.23-alpine
COPY nginx.conf /etc/nginx/conf.d
COPY --from=builder /app/.nuxt/dist/server /usr/share/nginx/html
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
