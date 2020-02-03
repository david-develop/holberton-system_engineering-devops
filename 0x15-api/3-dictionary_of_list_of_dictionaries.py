#!/usr/bin/python3
"""Python script to export data in the CSV format."""

import requests
import json


if __name__ == "__main__":

    # All users data
    url_all_user = 'https://jsonplaceholder.typicode.com/users'
    all_user_json = requests.get(url_all_user)
    all_users_dict = all_user_json.json()

    # Each user data
    usr_to_dict = {}
    for user_dict in all_users_dict:
        user_name = user_dict.get('username')
        usr_id = str(user_dict.get('id'))

        # TODOS data
        url_todos = 'https://jsonplaceholder.typicode.com/todos?userId=' + usr_id
        todos_json = requests.get(url_todos)
        todos_dict = todos_json.json()

        data_dict = {}

        usr_to_dict[usr_id] = []
        for task in todos_dict:
            data_dict['task'] = task.get('title')
            data_dict['completed'] = task.get('completed')
            data_dict['username'] = user_name
            usr_to_dict[usr_id].append(data_dict)

    # Write file
    file_name = "todo_all_employees.json"
    with open(file_name, "w+") as jsonfile:
        json.dump(usr_to_dict, jsonfile)
