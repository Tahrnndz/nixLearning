import requests 
 
h = {'X-API-Key': 'YOUR_REST_KEY'}
resp = requests.get("https://api.isbndb.com/book/9781934759486", headers=h)
print(resp.json())