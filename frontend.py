#!/usr/bin/env python3

import flask
from flask import render_template
from flaskext.markdown import Markdown

from db import get_submissions

app = flask.Flask(__name__)
Markdown(app)
app.config["DEBUG"] = True


@app.route('/', methods=['GET'])
def home():
    submissions = get_submissions()
    return render_template('index.html', submissions=submissions)


app.run()
