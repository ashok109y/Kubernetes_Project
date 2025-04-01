FROM ubuntu:latest

# Install necessary packages
RUN apt update && apt upgrade -y && apt install openjdk-17-jre apache2 unzip wget -y

WORKDIR /var/www/

RUN wget https://www.tooplate.com/download/2137_barista_cafe && \
    mv 2137_barista_cafe 2137_barista_cafe.zip && \
    unzip 2137_barista_cafe.zip && \
    rm -rf 2137_barista_cafe.zip
    
WORKDIR /var/www/html/

RUN rm -rf /var/www/html/index.html && \
    mv /var/www/2137_barista_cafe/* .

EXPOSE 80

# Start Apache in the foreground
CMD ["apachectl", "-D". "FOREGROUND"]
