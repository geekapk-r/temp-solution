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

import sys
import time

from bottle import route, run, template
from ujson import dumps, loads

# require helper modules
import model
import sock

__author__ = 'geekapk contributors'
__version__ = '1.0-dev'
__license__ = 'AGPL-3.0'


def main():
    print('Starting GeekApk Server v{} at {}'.format(__version__, time.time()))


if __name__ == '__main__':  # pragma: no coverage
    main()
