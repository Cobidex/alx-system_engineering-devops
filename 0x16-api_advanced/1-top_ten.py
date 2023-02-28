#!/usr/bin/python3
"""
Importing requests module
"""

import requests


def top_ten(subreddit):
    """
    prints the titles of the first 10 hot posts listed for a given subreddit..
    """

    if subreddit is None or not isinstance(subreddit, str):
        print('None')

    user_agent = {'User-Agent': 'Google Chrome Version 81.0.4044.129'}
    para = {'limit': 10}
    url = 'https://www.reddit.com/r/{}/hot/.json'. format(subreddit)
    response = requests.get(url, headers=user_agent, params=para)
    if (response.status_code == 200):
        a_data = response.json()
        li = a_data.get('data').get('children')
        for ti in li:
            title = ti.get('data').get('title')
            print(title)
