# Build arguments
FROM purplenetworksrl/php
ONBUILD ARG APP_PATH=.

# Add the source
ONBUILD ADD --chown=application ${APP_PATH} /app

# Set the working directory
ONBUILD WORKDIR /app
ONBUILD RUN chmod -R a+rwX /app/web/uploads

# Add WP CLI
ONBUILD RUN curl -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o wp
ONBUILD RUN chmod a+x wp
ONBUILD RUN mv wp /usr/local/bin/wp

# Download and run composer
ONBUILD USER application
ONBUILD RUN composer install --no-ansi --no-interaction --no-progress --optimize-autoloader --no-dev --no-scripts