#!/usr/bin/env python3

# FIXME: Slow ass network via client auth

from prawcore.exceptions import ResponseException

from db import add_archive
from db import init_db
from reddithelper import reddit
from watch import filter_submission, Skip
from watch import watch_subreddits, scan_users

SUBREDDITS = ['ARG', 'puzzles', 'codes']
USER_WATCHLIST = ['indires', 'StudentConfident9045', 'PotatoKingTheVII', 'PTR47']

if __name__ == "__main__":
    init_db()
    time_range = 'all'
    limit = 100
    try:
        selection = reddit.subreddit('ARG').top(time_range, limit=limit)
        print(f"ARG: top {limit} posts over {time_range}")
        for submission in selection:
            try:
                filter_submission(submission)
            except Skip:
                continue
            print("- archiving submission:", submission.id)
            add_archive(submission.id, submission.locked, submission.num_comments,
                        submission.permalink,
                        submission.score, submission.upvote_ratio, submission.title, submission.selftext,
                        submission.url)
    except ResponseException as e:
        print(e)

    scan_users(USER_WATCHLIST, SUBREDDITS)
    watch_subreddits(SUBREDDITS)
