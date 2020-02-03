#!/usr/bin/python3
"""Python script to export data in the CSV format."""

import requests
import sys
import csv


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

    file_name = "{}.csv".format(usr_id)
    with open(file_name, "w+") as csvfile:
        f = csv.writer(csvfile, quotechar='"', quoting=csv.QUOTE_ALL)
        for task in todos_dict:
            f.writerow([usr_id, user_name, str(task.get('completed')),
                        task.get('title')])
