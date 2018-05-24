#!/usr/bin/env python3 -x
# -*- coding: utf-8 -*-
# This file is a Python module
# GeekApk API Server Program

"""
GeekApk is a super simple and extendable Android application market & community.
It's designed with extension system in mind, to prove a better experience for geeks
This module is a RESTFul API server for GeekApk.
Homepage and documentation: https://geekapk.org/
See: https://gist.github.com/duangsuse/6347abbcc9dea4fa58e3a91231cb443f
Copyright (C) 2018, geekapk contributors.
License: AGPL-3.0 (see LICENSE.md for details)
"""

import os
import sys
import time

from bottle import route, run, template, hook, request, response, error, get, post, abort
from ujson import dumps, loads

# require helper modules
import model
import sock

__author__ = 'geekapk contributors'
__version__ = '1.0-dev'
__license__ = 'AGPL-3.0'

global token_jar


@hook('after_request')
def enable_cross():
    response.headers['Access-Control-Allow-Origin'] = '*'


@hook('after_request')
def enable_json():
    response.content_type = 'application/json; charset=utf-8'


@error(401)
def error401():
    return dumps({
        'status': 401,
        'message': "Unauthorized",
        'request': request
    })


@error(400)
def error400():
    return dumps({
        'status': 400,
        'message': "Bad request",
        'request': request
    })


@error(404)
def error404():
    return dumps({
        'status': 404,
        'message': "Resources was not found",
        'request': request
    })


@error(500)
def error500():
    return dumps({
        'status': 500,
        'message': "Internal error",
        'request': request
    })


@get('/')
def welcome():
    return dumps({
        'server': 'geekapk',
        'version': __version__,
        'author': __author__
    })


@get('/favicon.ico')
def favicon():
    abort(404)


def main():
    print('Starting GeekApk Server v{} at {}'.format(__version__, time.time()))
    host = os.environ.get('HOST', '0.0.0.0')
    port = int(os.environ.get('PORT', 8080))
    print('Launching from {}:{}'.format(host, port))
    run(host=host, port=port)


if __name__ == '__main__':  # pragma: no coverage
    main()
