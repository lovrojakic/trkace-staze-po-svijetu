#!/bin/bash

source .venv/bin/activate
waitress-serve --port=8080 --call app:get_app
