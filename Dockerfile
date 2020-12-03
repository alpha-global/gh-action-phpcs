FROM php:7.3-alpine3.12
LABEL "version"="1.0"
LABEL "description"="Github Action Linting Build"
LABEL "author"="Dave Johnson"
LABEL "com.github.actions.icon"="check-circle"
LABEL "com.github.actions.color"="green"
LABEL "com.github.actions.name"="PHPCS Code Review"
LABEL "com.github.actions.description"="This will run phpcs on PRs"

### Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

### Install PHPCS and WPCS globally with composer
RUN composer global require squizlabs/php_codesniffer wp-coding-standards/wpcs \
	&& ~/.composer/vendor/bin/phpcs --config-set installed_paths ~/.composer/vendor/wp-coding-standards/wpcs

COPY entrypoint.sh \
     problem-matcher.json \
     /action/

RUN chmod +x /action/entrypoint.sh

ENTRYPOINT ["/action/entrypoint.sh"]