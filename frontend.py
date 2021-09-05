#!/usr/bin/env python3

import flask
from flask import render_template, request, jsonify
from flaskext.markdown import Markdown

from db import get_submissions, update_classification

app = flask.Flask(__name__)
Markdown(app)
app.config["DEBUG"] = True


@app.route('/classify/<submission_id>', methods=['POST'])
def classify(submission_id):
    spam_ham = request.data.decode('utf-8')
    print(spam_ham)
    update_classification(submission_id, spam_ham)
    return jsonify(success=True)


@app.route('/', methods=['GET'])
def home():
    submissions = get_submissions()
    return render_template('index.html', submissions=submissions)


app.run()
