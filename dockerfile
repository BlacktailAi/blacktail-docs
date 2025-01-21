FROM nginx:alpine
WORKDIR /build
COPY . /build
COPY /build/.docker-build/ /usr/share/nginx/html