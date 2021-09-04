#!/usr/bin/env python3

import flask
import requests
from requests.exceptions import MissingSchema
from flask import render_template
from db import get_submissions
from flaskext.markdown import Markdown

app = flask.Flask(__name__)
Markdown(app)
app.config["DEBUG"] = True


def is_image(image_url):
    image_formats = ("image/png", "image/jpeg", "image/jpg")
    try:
        r = requests.head(image_url, verify=False)
        if r.headers["content-type"] in image_formats:
            return True
    except MissingSchema:
        return False
    except KeyError:
        return False
    return False


app.jinja_env.globals.update(is_image=is_image)


@app.route('/', methods=['GET'])
def home():
    submissions = get_submissions()
    return render_template('index.html', submissions=submissions)


app.run()
