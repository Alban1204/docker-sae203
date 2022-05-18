
FROM debian:latest

# Install services, packages and do cleanup
RUN  apt-get update && \
    apt-get -y install  \
    apache2 
    
RUN mkdir /data

# Copy files
COPY ./html /var/www/html

# Expose Apache
EXPOSE 80
