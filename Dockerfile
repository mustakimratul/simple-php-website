FROM httpd:alpine3.21

RUN apk add --no-cache php php-cli

WORKDIR /usr/local/apache2/htdocs/

COPY . .

EXPOSE 8080

CMD ["php", "-S", "localhost:8080"]