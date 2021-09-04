from datetime import datetime

from sqlalchemy import \
    String, Column, Text, DateTime, Boolean, Integer, Float, \
    ForeignKey, Index
from sqlalchemy.orm import declarative_base

Base = declarative_base()


class Subreddits(Base):
    """ 'subreddits' table """
    __tablename__ = 'subreddits'
    id = Column(String(30), primary_key=True)


# XXX !!! UPDATE ARCHIVES IF ADDING COLUMNS !!! XXX
class Submissions(Base):
    """ 'submissions' table - also known as posts """
    __tablename__ = 'submissions'
    id = Column(String(6), primary_key=True, unique=True)
    added_by = Column(String(30), nullable=False)
    locked = Column(Boolean(), default=False)
    num_comments = Column(Integer(), default=0)
    permalink = Column(String(2048))
    upvotes = Column(Integer(), default=0)
    upvote_ratio = Column(Float())
    title = Column(String(512), nullable=False)
    selftext = Column(Text(), nullable=True)
    created_on = Column(DateTime(), default=datetime.now)
    updated_on = Column(DateTime(), default=datetime.now, onupdate=datetime.now)
    url = Column(String(2048), nullable=True)
    idx_submissions_permalink = Index('permalink')
    idx_submissions_title = Index('title')


# XXX !!! UPDATE SUBMISSIONS IF ADDING COLUMNS !!! XXX
class Archives(Base):
    """ 'archives' table """
    __tablename__ = 'archives'
    id = Column(String(6), primary_key=True, unique=True)
    added_by = Column(String(30), nullable=False)
    locked = Column(Boolean(), default=False)
    num_comments = Column(Integer(), default=0)
    permalink = Column(String(2048))
    upvotes = Column(Integer(), default=0)
    upvote_ratio = Column(Float())
    title = Column(String(512), nullable=False)
    selftext = Column(Text(), nullable=True)
    created_on = Column(DateTime(), default=datetime.now)
    updated_on = Column(DateTime(), default=datetime.now, onupdate=datetime.now)
    url = Column(String(2048), nullable=True)
    idx_archives_permalink = Index('permalink')
    idx_archives_title = Index('title')


class SubredditSubmissions(Base):
    """ Many-to-many relationship between subreddits and submissions """
    __tablename__ = 'subreddit_submissions'
    id = Column(ForeignKey("submissions.id"), primary_key=True)
    subreddit = Column(ForeignKey("subreddits.id"), primary_key=True)


class User(Base):
    """ 'users' table """
    __tablename__ = 'usernames'
    id = Column(String(30), primary_key=True)
    last_scanned_on = Column(DateTime(), default=datetime.now)
