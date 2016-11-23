# README

API access info
---------------
- **Get post details by ID**
Method: GET

> http://54.234.5.125/post/1

- **Find posts by query**
Method: GET

> http://54.234.5.125/posts?latitude=-33.708004&longitude=151.098628&distance=5500&user_id=1

- **Get posts count by query**
Method: GET

> http://54.234.5.125/posts?count=true
> http://54.234.5.125/posts?latitude=-33.708004&longitude=151.098628&distance=5500&user_id=1

- **Create post**
Method: POST

> Request URL http://54.234.5.125/posts 
> Body: {    
> "post": {
>     "title": "my post",
>     "content": "post abc",
>     "latitude": 22.332,
>     "longitude": 33.32,
>     "accuracy": 1
> }
> }

