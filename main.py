#!/usr/bin/env python3

# FIXME: Slow ass network via client auth

from datetime import timedelta, datetime

from prawcore.exceptions import ResponseException

from db import init_db, get_latest_archival, add_archive
from reddithelper import reddit
from watch import filter_submission, Skip
from watch import watch_subreddits, scan_users

SUBREDDITS = ['ARG', 'puzzles', 'codes']
USER_WATCHLIST = ['indires', 'StudentConfident9045', 'PotatoKingTheVII', 'PTR47']


def archive():
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


if __name__ == "__main__":
    init_db()
    yesterday = datetime.today() - timedelta(days=1)
    if get_latest_archival() < yesterday:
        archive()
    # TODO: Limit scans of users
    scan_users(USER_WATCHLIST, SUBREDDITS)
    watch_subreddits(SUBREDDITS)
