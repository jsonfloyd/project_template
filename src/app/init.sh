#!/usr/bin/bash

php artisan down

php artisan telescope:install
php artisan migrate

php artisan up
