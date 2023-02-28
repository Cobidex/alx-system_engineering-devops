#!/usr/bin/python3
"""
Importing requests module
"""

import requests


def number_of_subscribers(subreddit):
    """
    method that queries the Reddit API and returns the number of subscribers
    (not active users, total subscribers) for a given subreddit.
    """

    if subreddit is None or not isinstance(subreddit, str):
        return 0

    user_agent = {'User-Agent': 'Google Chrome Version 81.0.4044.129'}
    url = 'https://www.reddit.com/r/{}/about.json'. format(subreddit)
    response = requests.get(url, headers=user_agent)
    if (response.status_code != 200):
        return 0
    a_data = response.json()

    return a_data.get('data').get('subscribers')
