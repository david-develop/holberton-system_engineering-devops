#!/usr/bin/python3

from datadog import initialize, api

options = {
    'api_key': '1e49654a80f1498c56f4b7b9fcfc3c43',
    'app_key': 'c3221526fd1bde71449081ee4f39b0586b712255'
}

initialize(**options)

jsono = api.Dashboard.get_all()
print(jsono)
