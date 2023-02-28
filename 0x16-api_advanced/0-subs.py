#!/usr/bin/python3
"""
Importing requests module
"""

import request


def number_of_subscribers(subreddit):
    """
    method that queries the Reddit API and returns the number of subscribers
    (not active users, total subscribers) for a given subreddit.
    """

    if subreddit is None or not isinstance(subreddit, str):
        return 0

    u_agent = {'User-agent': 'Google Chrome Version 81.0.4044.129'}
    url = 'https://www.reddit.com/r/{}/about.json'.format(subreddit)
    response = request.get(url, headers=u_agent)
    a_data = response.json()

    try:
        return a_data.get('data').get('subscribers')

    except:
        return 0
