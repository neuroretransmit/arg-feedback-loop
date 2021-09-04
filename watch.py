import re
from datetime import datetime, timedelta

from prawcore.exceptions import ResponseException

from db import add_subreddit, add_user, add_submission, update_last_scanned, get_last_scanned
from reddithelper import reddit


class Skip(Exception):
    pass


# TODO: Expand filtering
def filter_submission(submission, ignored_flair=["Meme", "Creator Question", "Creator Recruitment", "Question"]):
    # Skip dumb flair/polls, even the ones we aren't are fucking dumb.
    bs_rx = re.compile(r'([Tt]ik[ -]?[Tt]ok)|([Ii]nstagram)|([Tt]witter)|([Dd]iscord)')
    removed_rx = re.compile(r'(\[deleted\])|(\[removed\])')
    if hasattr(submission, 'poll_data') \
            or submission.link_flair_text in ignored_flair \
            or bs_rx.search(submission.url) \
            or bs_rx.search(submission.title) \
            or bs_rx.search(submission.selftext) \
            or removed_rx.search(submission.selftext):
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
                for submission in reddit().subreddit(subreddit).stream.submissions(skip_existing=True, pause_after=-1):
                    # Skip empty streams
                    if submission is None:
                        continue
                    try:
                        filter_submission(submission)
                    except Skip:
                        continue
                    print("- found", submission.id)
                    add_submission(submission.id, 'watch', submission.locked, submission.num_comments,
                                   submission.permalink,
                                   submission.score, submission.upvote_ratio, submission.title, submission.selftext,
                                   submission.url)
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

    for u in users:
        add_user(u)

    try:
        # Watch user interactions and add posts to set
        for u in users:
            half_hour_ago = datetime.now() - timedelta(minutes=30)
            if get_last_scanned(u) < half_hour_ago:
                print(f"Working on user {u}")
                for comment in reddit().redditor(u).comments.new(limit=100):
                    # If comment not in watched subreddit, skip
                    if comment.subreddit not in subreddits:
                        continue
                    submission = comment.submission
                    try:
                        filter_submission(submission)
                    except Skip:
                        continue
                    print("- found", submission.id)
                    add_submission(submission.id, u, submission.locked, submission.num_comments, submission.permalink,
                                   submission.score, submission.upvote_ratio, submission.title, submission.selftext,
                                   submission.url)
                    # TODO: Else, bump ranking if from another user/high traffic from watched users
            update_last_scanned(u, datetime.now())
    except ResponseException as e:
        print(e)
