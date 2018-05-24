#!/bin/sh
# using the virtualEnv
. ./venv/bin/activate
# This shell script installs python dependencies required by geekapk server
python -m pip install ujson bottle pgcli records websockets
