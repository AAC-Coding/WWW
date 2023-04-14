FROM node:18-alpine as builder

WORKDIR /app

COPY . /app

RUN npm cache clean --force && npm install
EXPOSE 4000 9876
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=4000
RUN source .env && npm run build


FROM nginx:1.23-alpine
COPY nginx.conf /etc/nginx/conf.d

COPY --from=builder /app/dist/www /usr/share/nginx/html
EXPOSE 80