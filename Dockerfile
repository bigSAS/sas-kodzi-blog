FROM node:12.8.1-buster-slim as builder

RUN mkdir /opt/app
COPY . /opt/app/
WORKDIR /opt/app


RUN npm install && npm run generate

FROM nginx:1.18-alpine

COPY --from=builder /opt/app/dist /usr/share/nginx/html/
EXPOSE 80
