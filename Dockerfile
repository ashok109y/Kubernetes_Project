FROM alpine:latest

# Install necessary packages
RUN apk update && apk add --no-cache \
    openjdk17 \
    apache2 \
    zip \
    unzip \
    curl

# Set working directory
WORKDIR /var/www/localhost/htdocs/

# Download the zip file and extract it
RUN curl -L -o photogenic.zip https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip && \
    unzip photogenic.zip && \
    mv photogenic/* . && \
    rm -rf photogenic photogenic.zip

# Expose Apache HTTP port
EXPOSE 80

# Start Apache in the foreground
CMD ["httpd", "-D", "FOREGROUND"]
