# API Documentation
## Authentication
### Sign Up a new User
#### `POST /sign_up`
##### Params˚
```json
{
  "user": {
    "name": "John Doe",
    "email": "john@example.com",
    "password": "jdoe123",
    "password_confirmation": "jdoe123"
  }
}
```
##### Response
```json
{
  "jwt": "eyj.827dug87gby4g76d3.ug873gf8yf751ud"
}
```

### Sign In a User
#### `POST /login`
##### Params
```json
{
  "auth": {
    "email": "john@example.com",
    "password": "jdoe123"
  }
}
```
##### Response
```json
{
  "jwt": "eyj74.8ehd887gy8g8yegb.g874g28yf2e8y28y"
}
```
