#!/usr/bin/bash

confd -onetime -backend env

exec /usr/bin/supervisord -n -c /etc/supervisor/conf.d/supervisord.conf