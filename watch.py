from pprint import pprint
from reddithelper import reddit
from prawcore.exceptions import ResponseException


# TODO: We are watching subreddits for new posts, but how should we filter the good from the bad
# - Added poll data ignoring
def watch_subreddits(subreddits):
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


def scan_users(users, subreddits):
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
                # Else, bump ranking if from another user/high traffic from watched users
        print("Found posts from user comments:")
        pprint(posts)
    except ResponseException as e:
        print(e)
