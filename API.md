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

## Products
### Get all products
#### `GET /products`
##### Params
```json
{
}
```
##### Response
```json
[
  {
    "id": 1,
    "sku": "756-76444521",
    "name": "Github Mug",
    "description": "A github mug",
    "price": 14.00
  },
  // ...
]
```

### Get a Single products info
#### `GET /products/:id`
##### Params
Pass `id` of products, ie: `/products/2`
##### Response
```json
{
  "id": 1,
  "sku": "756-76444521",
  "name": "Github Mug",
  "description": "A github mug",
  "price": 14.00,
  "created_at": "2018-01-01 12:00:00",
  "updated_at": "2018-01-01 12:00:00",
}
```
