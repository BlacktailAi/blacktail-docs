FROM nginx:alpine

# Create the app directory that Railway expects
WORKDIR /app

# Copy static files to the app directory
COPY .docker-build/ /app/

# Configure nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY <<'EOF' /etc/nginx/conf.d/default.conf
server {
    listen 8080;
    listen [::]:8080;
    server_name _;
    
    # Set root to /app where Railway expects it
    root /app;
    index index.html;
    error_page 404 /404.html;
    
    location / {
        try_files $uri $uri/ /index.html =404;
        add_header Cache-Control "no-cache";
    }
    
    location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ {
        expires 30d;
    }
}
EOF

# Set proper permissions for the app directory
RUN chown -R nginx:nginx /app && \
    chmod -R 755 /app

CMD ["nginx", "-g", "daemon off;"]