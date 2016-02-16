# oauth2-security-service

oauth2-security-service is a simple OAuth2 project. The project uses Spring Framework for OAuth2 protocol.

Before run the project, you need a MySQL database. You must run script in oauth2ForMySQL.sql file. Run project;
```cmd
mvn clean package
mvn jetty:run
```
And you can access application with URL http://localhost:8888/oauth2-security-service/

You can test the application following steps below;

### Get Token [POST]
```
http://localhost:8888/oauth2-security-service/oauth/token?grant_type=password&client_id=my-trusted-client-with-secret&client_secret=somesecret&username=marissa&password=koala
```
##### Response
```javascript
{
"access_token": "73188b46-309a-4248-a6e3-9970364a6799"
"token_type": "bearer"
"refresh_token": "eb5b13cc-6d45-49ab-83f5-629645cc9ae7"
"expires_in": 299
"scope": "read"
}
```

### Check Token [GET]
```
http://localhost:8888/oauth2-security-service/oauth/check_token?token=73188b46-309a-4248-a6e3-9970364a6799
```
##### Response
```javascript
{"exp":1455627682,"user_name":"user","scope":["read"],"authorities":["ROLE_USER"],"client_id":"my-trusted-client-with-secret"}
```

### Refresh Token [POST]
```
http://localhost:8888/oauth2-security-service/oauth/token?grant_type=refresh_token&client_id=my-trusted-client-with-secret&client_secret=somesecret&refresh_token=eb5b13cc-6d45-49ab-83f5-629645cc9ae7
```
##### Response
```javascript
{
"access_token": "dacedd84-d27d-4c8d-8b29-d55fc85d265a"
"token_type": "bearer"
"refresh_token": "eb5b13cc-6d45-49ab-83f5-629645cc9ae7"
"expires_in": 299
"scope": "read"
}
```
