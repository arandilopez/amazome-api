# API Documentation

- [Authentication](#authentication)
- [Products](#products)

## Authentication
### Sign Up a new User
#### `POST /sign_up`
##### Params
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
| Param          | Description |
| :------------- | :------------- |
| limit          | Number, limits products array size |
| filter         | String, applies a case insensitive filter on sku, name and description |

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
| Param | Description     |
| :------------- | :------------- |
| id       | Number, Product ID      |

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

### Create a new Product
#### `POST /products`
To create a new product you should provide a valid JWT token to authenticate a user. Authenticated user MUST HAVE an admin role

##### Params
```json
{
  "product": {
    "sku": "75352411563",
    "name": "Coke",
    "description": "Coke 500ml",
    "price": 10.00,
    "image": "https://coke.com/image.png"
  }
}
```
##### Response
```json
{
  "id": 100,
  "sku": "75352411563",
  "name": "Coke",
  "description": "Coke 500ml",
  "price": 10.00,
  "image": "https://coke.com/image.png",
  "created_at": "2018-01-01 12:00:00",
  "updated_at": "2018-01-01 12:00:00",
}
```

### Update a product
#### `PUT /products/:id`
To update a product you should provide a valid JWT token to authenticate a user. Authenticated user MUST HAVE an admin role

##### Params
| Param | Description |
| :------------- | :------------- |
| id | Number, Product ID to update |

```json
{
  "product": {
    "sku": "75352411563",
    "name": "Coke",
    "description": "Coke 500ml",
    "price": 10.00,
    "image": "https://coke.com/image.png"
  }
}
```
##### Response
```json
{
  "id": 100,
  "sku": "75352411563",
  "name": "Coke",
  "description": "Coke 500ml",
  "price": 10.00,
  "image": "https://coke.com/image.png",
  "created_at": "2018-01-01 12:00:00",
  "updated_at": "2018-01-01 23:00:00",
}
```

### Delete a product
#### `DELETE /products/:id`
To delete a product you should provide a valid JWT token to authenticate a user. Authenticated user MUST HAVE an admin role

##### Params
| Param | Description |
| :------------- | :------------- |
| id | Number, Product ID to delete |

##### Response
Respose SHOULD HAVE a `204` status code (No Content).
