#!/usr/bin/python3

"""
importing requests module
"""

from requests import get


def count_words(subreddit, word_list=[], after=None, c_d=None):
    """
    function that queries the Reddit API, parses the title of all hot articles,
    and prints a sorted count of given keywords (case-insensitive, delimited by
    spaces. Javascript should count as javascript, but java should not).
    """

    tem = []

    for i in word_list:
        tem.append(i.casefold())

    c_w_l = list(dict.fromkeys(tem))

    if c_d is None:
        c_d = dict.fromkeys(c_w_l)

    params = {'show': 'all'}

    if subreddit is None or not isinstance(subreddit, str):
        return None

    user_agent = {'User-agent': 'Google Chrome Version 81.0.4044.129'}

    url = 'https://www.reddit.com/r/{}/hot/.json?after={}'.format(subreddit,
                                                                  after)

    response = get(url, headers=user_agent, params=params)

    if (response.status_code != 200):
        return None

    all_data = response.json()
    raw1 = all_data.get('data').get('children')
    after = all_data.get('data').get('after')

    if after is None:
        new = {k: v for k, v in c_d.items() if v is not None}

        for k in sorted(new.items(), key=lambda x: (-x[1], x[0])):
            print("{}: {}".format(k[0], k[1]))

        return None

    for i in raw1:
        title = i.get('data').get('title')

        split_title = title.split()

        split_title2 = [i.casefold() for i in split_title]

        for j in split_title2:
            if j in c_d and c_d[j] is None:
                c_d[j] = 1

            elif j in c_d and c_d[j] is not None:
                c_d[j] += 1

    count_words(subreddit, word_list, after, c_d)
