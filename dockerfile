FROM mcr.microsoft.com/dotnet/sdk:7.0 AS builder
WORKDIR /build
COPY . /build

FROM httpd:latest
COPY --from=builder /build/.docker-build/ /usr/local/apache2/htdocs/