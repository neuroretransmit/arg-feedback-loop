#! usr/bin/env python3
import praw
from prawcore.exceptions import ResponseException
import configparser

config = configparser.RawConfigParser()
config.read('conf/reddit.conf')
creds = dict(config.items('creds'))

reddit = praw.Reddit(
        client_id = creds['client_id'],
        client_secret = creds['client_secret'],
        user_agent = creds['user_agent'])

USER_WATCHLIST = ['indires', 'StudentConfident9045']
SUBREDDITS = ['ARG', 'puzzles', 'codes']


def watch():
    print(f"Watching {SUBREDDITS} for new posts")
    while True:
        for subreddit in SUBREDDITS:
            for submission in reddit.subreddit(subreddit).stream.submissions(skip_existing=True, pause_after=-1):
                if submission is None:
                    break
                print(submission.title)
                print(submission.url)


try:
    posts = set()
    # Watch user interactions and add posts to set
    for u in USER_WATCHLIST:
        user = reddit.redditor(u)
        for comment in user.comments.new(limit=25):
            submission = comment.submission
            if submission.permalink not in posts:
                print(f"https://reddit.com{submission.permalink}")
                posts.add(submission.permalink)
            # Else, bump ranking if from another user/high traffic from watched users
    print(posts)
    watch()
except ResponseException as e:
    print(e)
