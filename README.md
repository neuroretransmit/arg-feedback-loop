# arg-feedback-loop

This was a project I started to do baysian classification for **quality** puzzles floating by in plain sight within the r/ARG subreddit and
watch particular users of interest who know how to find them. I social engineered my way to admin of the sub and wanted to flush all the 
garbage analog horror out of it and bring back real puzzles.

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

## DB

![](doc/erd.png)

### Starting Database

Default creds: `root:root`
Default database: `argwatch`

`docker-compose up -d db`

## Running Program

`docker-compose up -d db && ./main.py`

## Useful Scripts

* [scripts/postgres-console.sh](scripts/postgres-console.sh) 
	- launch a PSQL instance on the arg-watch database for quick querying
* [scripts/postgres-nuke.sh](scripts/postgres-nuke.sh)
	- In the event of database getting massively fucked, tear down docker container/images/volumes and DROP/recreate
* [scripts/postgres-backup.sh](scripts/postgres-backup.sh)
	- Backup the current data
* [scripts/postgres-restore.sh](scripts/postgres-restore.sh)
	- Restore data from the dump in `data/`
* [scripts/start-db.sh](scripts/start-db.sh)
