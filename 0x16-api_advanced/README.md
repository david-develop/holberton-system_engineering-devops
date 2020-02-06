### API advanced

## General Learning Objectives

- How to read API documentation to find the endpoints you’re looking for
- How to use an API with pagination
- How to parse JSON results from an API
- How to make a recursive API call
- How to sort a dictionary by value

## Files:

- 0-subs.py: function that queries the Reddit API and prints the titles of the first 10 hot posts listed for a given subreddit.
- 2-recurse.py: recursive function that queries the Reddit API and returns a list containing the titles of all hot articles for a given subreddit. If no results are found for the given subreddit, the function should return None.
- 100-count.py: recursive function that queries the Reddit API, parses the title of all hot articles, and prints a sorted count of given keywords (case-insensitive, delimited by spaces).
