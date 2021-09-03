# arg-feedback-loop

## Setup

### Creating the Virtual Environment

So you don't have clashes with your own package manager for your Linux distribution, operate the project
in a virtual environment.

Ensure `virtualenv` is installed for Python 3.

```
$ virtualenv venv # Creates venv/ directory in project
$ source venv/bin/activate
```

### Installing Dependencies

`pip install -r requirements.txt`


## Starting Database

Default creds: `root:root`
Default table: `arg-watch`

`docker-compose up -d db`

## Running Program

`./main.py`
