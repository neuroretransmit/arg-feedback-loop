#! usr/bin/env python3

# FIXME: Slow ass network via client auth

from db import connect
from watch import watch_subreddits, scan_users

SUBREDDITS = ['ARG', 'puzzles', 'codes']
USER_WATCHLIST = ['indires', 'StudentConfident9045']

connect()
scan_users(USER_WATCHLIST, SUBREDDITS)
watch_subreddits(SUBREDDITS)
