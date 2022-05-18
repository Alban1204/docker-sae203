FROM debian:latest

# Install services, packages and do cleanup
RUN  apt-get update && \
    apt-get -y install  \
    apache2 

# Copy files
COPY ./html /var/www/html

# Expose Apache
EXPOSE 80

# Lancer le service apache au démarrage du conteneur
CMD ["/usr/sbin/apache2ctl","-DFOREGROUND"]
