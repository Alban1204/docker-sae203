FROM debian:latest
RUN  apt-get update && \
    apt-get -y install
COPY ./html/ /usr/local/apache2/htdocs/
EXPOSE 80
