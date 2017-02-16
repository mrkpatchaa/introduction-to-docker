#!/bin/bash

# Install dependencies
cd /var/www && hhvm /opt/composer/composer.phar install

# It will execute whatever parameter comes after, either from the CMD directive, or from docker run parameters
exec "$@"
