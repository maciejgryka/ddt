#!/bin/bash

echo starting gunicorn...
exec gunicorn helloworld.wsgi:application --bind 0.0.0.0:8000 --workers 3