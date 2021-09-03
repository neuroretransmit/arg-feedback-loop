import praw
import configparser

config = configparser.RawConfigParser()
config.read('conf/reddit.conf')
creds = dict(config.items('creds'))

reddit = praw.Reddit(
        client_id = creds['client_id'],
        client_secret = creds['client_secret'],
        user_agent = creds['user_agent'])