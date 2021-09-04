from reddithelper import reddit

"""
for the time being focusing only on r/arg
selective pull to update static data of top posts from r/arg over a variable timespan 
"""
subreddit_name = 'arg'
time_range = 'all'
limit = 100
ignored_flair = ["Meme", "Creator Question", "Creator Recruitment", "Question"]

selection = reddit.subreddit(subreddit_name).top(time_range, limit=limit)
print(f"{subreddit_name}: top {limit} posts over {time_range}")
for submission in selection:
    if submission.link_flair_text not in ignored_flair:
        print(submission.title)
# TODO: populate DB, probably a separate table or something to prevent mixing data 


# for local backup 
# with open(f'{subreddit_name}_top_{time_range}_{limit}.txt','w') as wfile:
