#!/usr/bin/python3
"""Python script that, using this REST API, for a given employee ID, returns
information about his/her TODO list progress."""

import requests
import sys


if __name__ == "__main__":
    usr_id = sys.argv[1]
    url_user = 'https://jsonplaceholder.typicode.com/users/' + usr_id
    user_json = requests.get(url_user)
    user_dict = user_json.json()

    url_todos =\
        'https://jsonplaceholder.typicode.com/todos?userId=' + usr_id
    todos_json = requests.get(url_todos)
    todos_dict = todos_json.json()

    tasks_c = 0
    completed_c = 0
    title_list = []
    for task in todos_dict:
        if task['completed'] is True:
            completed_c += 1
            title_list.append(task.get('title'))
        tasks_c += 1

    print("Employee {} is done with tasks:({}/{}):".
          format(user_dict.get('name'),
                 completed_c,
                 tasks_c))

    for title in title_list:
        print("\t {}".format(title))
