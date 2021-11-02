FROM httpd:2.4

WORKDIR /usr/local/apache2/htdocs

COPY website-S3 .

EXPOSE 8080
