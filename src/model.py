# -*- coding: utf-8 -*-
# This file is a Python module
# SQL model helpers for geekapk, see main.py
# Copyright (C) 2018  geekapk contributors

import os
import records

database = os.environ.get('DB') or 'postgres://geekapk:qwertyGeekApk@localhost/geekapk'
print("Database: ", database)


def init():
    global db
    db = records.Database(database)

