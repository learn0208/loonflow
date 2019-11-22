#!/bin/sh
set -e

#RUN python manage.py makemigrations
python manage.py collectstatic --noinput
python manage.py makemigrations
python manage.py migrate

celery -A tasks worker -l info -Q loonflow &

exec "$@"