import requests
import sys

try:
    url = f'http://{sys.argv[1]}:5000/shutdown'
    response = requests.get(url)

    print(response.json())

except Exception as e:
    print(f'Exception in "{url}" request \n{e.__class__.__name__}: {e}\n')

try:
    url = f'http://{sys.argv[1]}:5001/shutdown'
    response = requests.get(url)

    print(response.json())

except Exception as e:
    print(f'Exception in "{url}" request \n{e.__class__.__name__}: {e}\n')