#!/usr/bin/env python3

# FIXME: Slow ass network via client auth

from db import initialize_db
from watch import watch_subreddits, scan_users

SUBREDDITS = ['ARG', 'puzzles', 'codes']
USER_WATCHLIST = ['indires', 'StudentConfident9045']

initialize_db()

scan_users(USER_WATCHLIST, SUBREDDITS)
watch_subreddits(SUBREDDITS)
