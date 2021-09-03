from pprint import pprint

from prawcore.exceptions import ResponseException

from db import add_subreddit
from reddithelper import reddit


class Skip(Exception): pass


# TODO: Expand filtering
def filter_submission(submission, ignored_flair=["Meme", "Creator Question", "Creator Recruitment", "Question"]):
    # Skip dumb flair/polls, even the ones we aren't are fucking dumb.
    if hasattr(submission, 'poll_data') \
            or submission.link_flair_text in ignored_flair:
        raise Skip()


# FIXME: Looks like it is only watching r/ARG - all active streams didn't report
def watch_subreddits(subreddits):
    """
    Watch relevant subreddits
    :param subreddits: whitelist of subreddits to watch
    :return:
    """
    for subreddit in subreddits:
        add_subreddit(subreddit)
    try:
        print(f"Watching {subreddits} for new posts")
        while True:
            for subreddit in subreddits:
                for submission in reddit.subreddit(subreddit).stream.submissions(skip_existing=True, pause_after=-1):
                    # Skip empty streams
                    if submission is None:
                        continue
                    try:
                        filter_submission(submission)
                    except Skip:
                        continue
                    print(submission.title)
                    print(submission.url)
    except ResponseException as e:
        print(e)


# TODO: Check against DB/populate instead of static set
def scan_users(users, subreddits):
    """
    Scan watched users for new activity in relevant subreddits
    :param users: whitelist of users to watch
    :param subreddits: whitelist of valid subreddits
    :return:
    """
    try:
        posts = set()
        # Watch user interactions and add posts to set
        for u in users:
            print(f"Working on user {u}")
            user = reddit.redditor(u)
            for comment in user.comments.new(limit=25):
                # If comment not in watched subreddit, skip
                if comment.subreddit not in subreddits:
                    continue
                submission = comment.submission
                if submission.permalink not in posts:
                    print("- found", submission.id)
                    posts.add(submission.permalink)
                # TODO: Else, bump ranking if from another user/high traffic from watched users
        print("Found posts from user comments:")
        pprint(posts)
    except ResponseException as e:
        print(e)
