#!/usr/bin/bash

confd -onetime -backend env
composer install
php artisan migrate
exec /usr/bin/supervisord -n -c /etc/supervisor/conf.d/supervisord.conf