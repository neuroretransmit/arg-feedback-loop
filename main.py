#! usr/bin/env python3

from watch import watch_subreddits, scan_users

SUBREDDITS = ['ARG', 'puzzles', 'codes']
USER_WATCHLIST = ['indires', 'StudentConfident9045']

scan_users(USER_WATCHLIST, SUBREDDITS)
watch_subreddits(SUBREDDITS)
