FROM ubuntu:latest

# Install necessary packages
RUN apt update && apt upgrade -y && apt install openjdk-17-jre apache2 unzip -y

WORKDIR /var/www/localhost/htdocs

RUN wget https://www.tooplate.com/download/2137_barista_cafe && \
    tar -xvf *.tar.gz && \
    rm -rf *.tar.gz
    
WORKDIR /var/www/html/

RUN mv /var/www/localhost/2137_barista_cafe/* .

EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D". "FOREGROUND"]
