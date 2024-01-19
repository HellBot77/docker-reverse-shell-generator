FROM httpd:alpine

COPY ./reverse-shell-generator /usr/local/apache2/htdocs/
