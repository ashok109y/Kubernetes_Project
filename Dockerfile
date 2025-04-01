FROM ubuntu:latest

# Install necessary packages
RUN apt update && apt upgrade -y && apt install openjdk-17-jre apache2 unzip -y

WORKDIR /var/www/localhost/htdocs

RUN curl -L -o photogenic.zip https://www.free-css.com/assets/files/free-css-templates/download/page254/photogenic.zip && \
    unzip photogenic.zip && \
    rm -rf photogenic photogenic.zip
    
WORKDIR /var/www/html/

RUN mv /var/www/localhost/htdocsphotogenic/* .

EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D". "FOREGROUND"]
