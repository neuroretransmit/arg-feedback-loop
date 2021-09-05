import configparser

import requests
from requests.exceptions import MissingSchema
from sqlalchemy import create_engine, insert
from sqlalchemy.orm import Session
from sqlalchemy_schemadisplay import create_schema_graph

from models import User, Submissions, Subreddits, Archives, Base

config = configparser.RawConfigParser()
config.read('conf/db.conf')
db = dict(config.items('db'))
engine = create_engine(f"postgresql+psycopg2://{db['user']}:{db['pass']}@{db['host']}/{db['db']}",
                       echo=True, connect_args={
        "keepalives": 1,
        "keepalives_idle": 30,
        "keepalives_interval": 10,
        "keepalives_count": 5})  # Show SQL being run by ORM


def init_db():
    # Connect via psycopg2
    engine.connect()
    print("Connected to DB:", engine)
    # Create initial schema
    Base.metadata.create_all(engine)
    print("Generating ERD...")
    graph = create_schema_graph(metadata=Base.metadata)
    graph.write_png('doc/erd.png')


def add_user(id):
    """
    Add subreddit to 'subreddits' table
    :param name: subreddit name - i.e. the name after https://reddit.com/r/
    :return:
    """
    with Session(engine) as session:
        exists = session.query(User.id).filter_by(id=id).first() is not None
        if not exists:
            stmt = insert(User).values(id=id)
            with engine.connect() as conn:
                conn.execute(stmt)


def add_subreddit(name):
    """
    Add subreddit to 'subreddits' table
    :param name: subreddit name - i.e. the name after https://reddit.com/r/
    :return:
    """
    with Session(engine) as session:
        exists = session.query(Subreddits.id).filter_by(id=name).first() is not None
        if not exists:
            stmt = insert(Subreddits).values(id=name)
            with engine.connect() as conn:
                conn.execute(stmt)


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


def add_archive(id, locked, num_comments, permalink, upvotes, upvote_ratio, title, selftext, url):
    """
    Add submission to 'submissions' table
    :param id: post id
    :param locked: was post locked?
    :param num_comments: number of post comments
    :param permalink: link to post - the portion after https://reddit.com
    :param upvotes: number of upvotes
    :param upvote_ratio: ratio of upvotes to total votes
    :param title: post title
    :param selftext: post contents
    :param url: the url the post links to
    :return: none
    """
    with Session(engine) as session:
        exists = session.query(Archives.id).filter_by(id=id).first() is not None
        if not exists:
            stmt = insert(Archives).values(id=id, added_by='archival', locked=locked, num_comments=num_comments,
                                           permalink=permalink,
                                           upvotes=upvotes, upvote_ratio=upvote_ratio, title=title,
                                           selftext=selftext, url=url, is_img=is_image(url))
            with engine.connect() as conn:
                conn.execute(stmt)


def add_submission(id, added_by, locked, num_comments, permalink, upvotes, upvote_ratio, title, selftext, url):
    """
    Add submission to 'submissions' table
    :param id: post id
    :param added_by: either 'watch' or a username
    :param locked: was post locked?
    :param num_comments: number of post comments
    :param permalink: link to post - the portion after https://reddit.com
    :param upvotes: number of upvotes
    :param upvote_ratio: ratio of upvotes to total votes
    :param title: post title
    :param selftext: post contents
    :param url: the url the post links to
    :return: none
    """
    with Session(engine) as session:
        exists = session.query(Submissions.id).filter_by(id=id).first() is not None
        if not exists:
            stmt = insert(Submissions).values(id=id, added_by=added_by, locked=locked, num_comments=num_comments,
                                              permalink=permalink,
                                              upvotes=upvotes, upvote_ratio=upvote_ratio, title=title,
                                              selftext=selftext, url=url, is_img=is_image(url))
            with engine.connect() as conn:
                conn.execute(stmt)


def get_latest_archival():
    with Session(engine) as session:
        created = session.query(Archives.created_on).order_by(Archives.created_on.desc()).first()
        return None if created is None or len(created) == 0 else created[0]


def update_last_scanned(id, when):
    with Session(engine) as session:
        user = session.query(User).filter_by(id=id).first()
        user.last_scanned_on = when
        session.commit()


def update_classification(id, classification):
    with Session(engine) as session:
        submission = session.query(Submissions).filter_by(id=id).first()
        submission.classification = classification
        session.commit()


def get_last_scanned(id):
    with Session(engine) as session:
        last_scanned_on = session.query(User.last_scanned_on).filter_by(id=id).first()
        return None if last_scanned_on is None or len(last_scanned_on) == 0 else last_scanned_on[0]


def get_submissions():
    submissions = []
    with Session(engine) as session:
        for submission in session.query(Submissions):
            submissions.append(submission)
    return submissions
