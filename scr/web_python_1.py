#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from flask import Flask
app = Flask("the_flask_module")

@app.route("/hello")
def hello_page():
    return "I'm a hello page"

@app.route("/hello/details")
def hello_deeper():
    return "I'm a details page"

app.run(host="0.0.0.0", port=5001)