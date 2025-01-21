FROM nginx:alpine

COPY .docker-build/ /usr/share/nginx/html/

RUN chmod -R 755 /usr/share/nginx/html