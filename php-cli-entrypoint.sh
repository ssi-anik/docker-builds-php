#!/bin/sh
set -e

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
