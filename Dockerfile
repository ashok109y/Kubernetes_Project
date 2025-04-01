FROM ubuntu:latest

# Install necessary packages
RUN apt update && apt upgrade -y && apt install openjdk-17-jre apache2 unzip -y

WORKDIR /var/www/

RUN wget https://www.tooplate.com/download/2137_barista_cafe && \
    tar -xvf *.tar.gz && \
    rm -rf *.tar.gz
    
WORKDIR /var/www/html/

RUN rm -rf /var/www/html/index.html
    mv /var/www/2137_barista_cafe/* .

EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D". "FOREGROUND"]
