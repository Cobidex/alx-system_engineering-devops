#!/usr/bin/python3
'''
    module for retrieving pages of listing via recursive api calls
'''
import requests


def recurse(subreddit, hot_list=[], after=""):
    '''
        method to return list of hot articles
    '''
    header = {'User-Agent': 'Google Chrome 110.0.5481.177 Windows 10'}
    url = 'www.reddit/r/{}/hot/.json?after={}'. format(subreddit, after)
    if subreddit is None or type(subreddit) != str:
        return None
    response = requests.get(url, header=header)
    data = response.json()
    after = data.get('data').get('after')
    if after:
        titles = data.get('data').get('children')
        for t in titles:
            title = t.get('data').get('title')
            hot_list.append(title)
        recurse(subreddit, hot_list, after)
    return hot_list
