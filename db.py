import configparser
from datetime import datetime

from sqlalchemy import create_engine, insert, \
    MetaData, String, Column, Text, DateTime, Boolean, Integer, Float, \
    ForeignKey, Index
from sqlalchemy.orm import Session, declarative_base

config = configparser.RawConfigParser()
config.read('conf/db.conf')
db = dict(config.items('db'))
engine = create_engine(f"postgresql+psycopg2://{db['user']}:{db['pass']}@{db['host']}/{db['db']}",
                       echo=True)  # Show SQL being run by ORM
metadata = MetaData()
Base = declarative_base()


class Subreddits(Base):
    """ 'subreddits' table """
    __tablename__ = 'subreddits'
    id = Column(String(30), primary_key=True)


class Submissions(Base):
    """ 'submissions' table - also known as posts """
    __tablename__ = 'submissions'
    id = Column(String(6), primary_key=True, unique=True)
    added_by = Column(String(30), nullable=False)
    locked = Column(Boolean(), default=False)
    num_comments = Column(Integer(), default=0)
    permalink = Column(String(200))
    upvotes = Column(Integer(), default=0)
    upvote_ratio = Column(Float())
    title = Column(String(200), nullable=False)
    selftext = Column(Text(), nullable=True)
    created_on = Column(DateTime(), default=datetime.now)
    updated_on = Column(DateTime(), default=datetime.now, onupdate=datetime.now)
    url = Column(String(2048), nullable=True)
    idx_permalink = Index('permalink')
    idx_title = Index('title')


class SubredditSubmissions(Base):
    """ Many-to-many relationship between subreddits and submissions """
    __tablename__ = 'subreddit_submissions'
    id = Column(ForeignKey("submissions.id"), primary_key=True)
    subreddit = Column(ForeignKey("subreddits.id"), primary_key=True)


class User(Base):
    """ 'users' table """
    __tablename__ = 'usernames'
    id = Column(String(30), primary_key=True)


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
            stmt = insert(Submissions).values(id=id, added_by=added_by, locked=locked, num_comments=num_comments, permalink=permalink,
                                              upvotes=upvotes, upvote_ratio=upvote_ratio, title=title,
                                              selftext=selftext, url=url)
            with engine.connect() as conn:
                conn.execute(stmt)


def init_db():
    # Connect via psycopg2
    engine.connect()
    print("Connected to DB:", engine)
    # Create initial schema
    Base.metadata.create_all(engine)
