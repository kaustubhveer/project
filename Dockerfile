
FROM php:7.4-apache

# Install necessary PHP extensions and dependencies
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy your PHP code to the container
COPY . /var/www/html

# Set the appropriate permissions
RUN chown -R www-data:www-data /var/www/html

# Set the database connection details as environment variables
ENV DB_HOST=172.31.83.152
ENV DB_PORT=3306
ENV DB_USER='admin'
ENV DB_PASSWORD='debianlinux'
ENV DB_NAME='userdb'

# Expose port 80
EXPOSE 80

# Start Apache web server
CMD ["apache2-foreground"]

