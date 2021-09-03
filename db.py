import configparser
from sqlalchemy import create_engine
from sqlalchemy import MetaData, Table, String, Column, Text, DateTime, Boolean, Integer, Float, ForeignKey, Index
from datetime import datetime

config = configparser.RawConfigParser()
config.read('conf/db.conf')
db = dict(config.items('db'))

engine = create_engine(f"postgresql+psycopg2://{db['user']}:{db['pass']}@{db['host']}/{db['db']}",
                       echo=True)  # Show SQL being run by ORM

metadata = MetaData()

subreddits = Table('subreddits', metadata,
                   Column('id', String(30), primary_key=True))

submissions = Table('submissions', metadata,
                    Column('id', String(6), primary_key=True, unique=True),
                    Column('locked', Boolean(), default=False),
                    Column('num_comments', Integer(), default=0),
                    Column('permalink', String(200)),
                    Column('upvotes', Integer(), default=0),
                    Column('upvote_ratio', Float()),
                    Column('title', String(200), nullable=False),
                    Column('selftext', Text(), nullable=True),
                    Column('created_on', DateTime(), default=datetime.now),
                    Column('updated_on', DateTime(), default=datetime.now, onupdate=datetime.now),
                    Index('idx_permalink', 'permalink'),
                    Index('idx_title', 'title'))

subreddit_submissions = Table('subreddit_submissions', metadata,
                              Column('id', ForeignKey("submissions.id")),
                              Column('subreddit', ForeignKey("subreddits.id")))


def connect():
    engine.connect()
    print("Connected to DB:", engine)
    return engine


def create_tables():
    metadata.create_all(engine)
