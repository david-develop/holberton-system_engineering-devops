#!/usr/bin/python3
"""Python script to export data in the CSV format."""

import requests
import sys
import json


if __name__ == "__main__":

    # User data
    usr_id = sys.argv[1]
    url_user = 'https://jsonplaceholder.typicode.com/users/' + usr_id
    user_json = requests.get(url_user)
    user_dict = user_json.json()
    user_name = user_dict.get('username')

    # TODOS data
    url_todos = 'https://jsonplaceholder.typicode.com/todos?userId=' + usr_id
    todos_json = requests.get(url_todos)
    todos_dict = todos_json.json()

    file_name = "{}.json".format(usr_id)
    usr_to_dict = {}
    data_dict = {}
    with open(file_name, "w+") as jsonfile:
        usr_to_dict[usr_id] = []
        for task in todos_dict:
            data_dict['task'] = task.get('title')
            data_dict['completed'] = task.get('completed')
            data_dict['username'] = user_name
            usr_to_dict[usr_id].append(data_dict)
        json.dump(usr_to_dict, jsonfile)
