FROM php:7.4-apache

RUN a2enmod rewrite

WORKDIR /var/www/html/

COPY . .

RUN chown -R www-data:www-data /var/www/html/

EXPOSE 80

CMD ["apache2-foreground"]