# README


## API access info

- **Authentication**
	
    Add the token info to the header for authentication.

 		$ curl -IH "Authorization: Token token=a47a8e54b11c4de5a4a351734c80a14a" \http://localhost:3000/user


- **Get post details by ID**
 
 	Method: GET
 
 		http://54.234.5.125/api/post/1

- **Find posts by query**
 	
    Method: GET
 
	 user_id: user who created the post, optional
 	
    longitude: longitude of the post, must together with latitude and distance
 	
    latitude: latitude of the post, must together with longitude and distance
 	
    distance: distance range of specified longitude and latitude. In meters.
    				
    	http://54.234.5.125/api/postslatitude=-33.708004&longitude=151.098628&distance=5500&user_id=1 
    	http://54.234.5.125/api/posts?latitude=-33.708004&longitude=151.098628&distance=5500





- **Get posts count by query**

	Method: GET

	Same as Find post by query with additional parameter count

 		http://54.234.5.125/api/posts?count=true
 		http://54.234.5.125/api/postslatitude=-33.708004&longitude=151.098628&distance=5500&user_id=1





- **Create post**

	Method: POST

 	Request URL http://54.234.5.125/posts 
	
    Body: {    
 "post": {
     "title": "my post",
     "content": "post abc",
     "latitude": 22.332,
     "longitude": 33.32,
     "accuracy": 1
 }
 }





- **Find posts by id**

	Method: GET

 		http://54.234.5.125/api/posts/find?post_id=1





- **Login User**

	Method: POST
 
 	To login or create a user if user does not exist.  
 	The successful login will return the user data, otherwise empty hash will be returned. 
 
 	**Parameters:** 
 
 	user_name: user name for user, uuid in case of device login. 
 
 	email: user email. optional 
 
 	password: user password to create or login. 
 
 	password_confirmation: confirmation password, only used when force_create is true, optional 
 	
 	user_type: only accept device/facebook/google 
 
 	force_create: true if want to create user when not find the user in database, optional
 
 		http://54.234.5.125/api/login


- **Create User**
 
 	Method: POST
 
 	Same as login user with force_create
 
 		http://54.234.5.125/api/users/create


- **Get current user details**

	Method: GET

 		http://54.234.5.125/api/user


- **Get current user token**
	Method: GET

 		http://54.234.5.125/api/token?user_name=xxx&user_type=xxx



## Pending Tasks

 User creation validation.
 
 Post update, delete.
 
 Authorization to get user and post.
 
 Location information for post, e.g. country, city, post code, etc.
 
 Post limitation for each user.
 
 Image support for post.
 
 Poll feature for post.
 
 Comments for post.
 
 Login with Google, Facebook, etc.







