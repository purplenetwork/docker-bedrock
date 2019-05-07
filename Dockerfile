# Build arguments
FROM purplenetworksrl/php

# Add the source
ONBUILD ARG APP_PATH=.
ONBUILD ADD ${APP_PATH} /app
ONBUILD ADD --chown=application ${APP_PATH} /app

# Set the working directory
ONBUILD WORKDIR /app

# Add WP CLI
ONBUILD RUN curl -L https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o wp
ONBUILD RUN chmod a+x wp
ONBUILD RUN mv wp /usr/local/bin/wp

# Run composer
ONBUILD USER application
ONBUILD RUN composer install --no-ansi --no-interaction --no-progress --optimize-autoloader --no-dev --no-scripts