from pprint import pprint

from prawcore.exceptions import ResponseException

from db import add_subreddit
from reddithelper import reddit


# TODO: We are watching subreddits for new posts, need to filter (Added poll data ignoring/flair ignoring)
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
                    # Skip polls
                    if submission.poll_data is None:
                        continue
                    # Skip dumb flair, even the ones we aren't are fucking dumb.
                    if submission.link_flair_text in ["Meme", "Creator Question", "Creator Recruitment", "Question"]:
                        continue
                    print(submission.title)
                    print(submission.url)
    except ResponseException as e:
        print(e)


# TODO: Segment filtering logic for submissions so it is used here as well
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
