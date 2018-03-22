# API Documentation

- [Authentication](#authentication)
- [Products](#products)
- [Users](#users)
- [Cart](#cart)
- [Wish lists](#wish-lists)
- [Products in Wish lists](#products-in-wish-lists)

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

## Users
### Get all users
#### `GET /user`
To get all users you should provide a valid JWT token to authenticate a user. Authenticated user MUST HAVE an admin role

##### Response
```json
[
  {
    "id": 1,
    "name": "John Doe",
    "email": "john@example.com",
    "created_at": "2018-01-01T12:00:00",
    "updated_at": "2018-01-01T12:00:00",
  },
  // ...
]
```

### Get a Single user info
#### `GET /users/:id`
To get a user you should provide a valid JWT token to authenticate a user. Authenticated user MUST HAVE an admin role

##### Params
| Param | Description     |
| :------------- | :------------- |
| id       | Number, User ID      |

##### Response
```json
{
  "id": 1,
  "name": "John Doe",
  "email": "john@example.com",
  "created_at": "2018-01-01T12:00:00",
  "updated_at": "2018-01-01T12:00:00",
}
```

### Get current logged in user info
#### `GET /users/current`
To get the current user you should provide a valid JWT token to authenticate a user.

##### Response
```json
{
  "id": 1,
  "name": "John Doe",
  "email": "john@example.com",
  "created_at": "2018-01-01T12:00:00",
  "updated_at": "2018-01-01T12:00:00",
}
```

### Create a new User
#### `POST /users`
To create a new user you should provide a valid JWT token to authenticate a user. Authenticated user MUST HAVE an admin role

##### Params
```json
{
  "user": {
    "name": "John Doe",
    "email": "john@example.com",
    "password": "username123",
    "password_confirmation": "username123"
  }
}
```
##### Response
```json
{
  "id": 10,
  "name": "John Doe",
  "email": "john@example.com",
  "created_at": "2018-01-01T12:00:00",
  "updated_at": "2018-01-01T12:00:00",
  "created_at": "2018-01-01 12:00:00",
  "updated_at": "2018-01-01 12:00:00",
}
```

### Update a user
#### `PUT /users/:id`
To update a user you should provide a valid JWT token to authenticate a user. Authenticated user MUST HAVE an admin role

##### Params
| Param | Description |
| :------------- | :------------- |
| id | Number, User ID to update |

```json
{
  "user": {
    "name": "John Doe",
    "email": "john@example.com",
  }
}
```
##### Response
```json
{
  "id": 10,
  "name": "John Doe",
  "email": "john@example.com",
  "created_at": "2018-01-01T12:00:00",
  "updated_at": "2018-01-01T12:00:00",
  "created_at": "2018-01-01 12:00:00",
  "updated_at": "2018-01-01 12:00:00",
}
```

### Delete a user
#### `DELETE /users/:id`
To delete a user you should provide a valid JWT token to authenticate a user. Authenticated user MUST HAVE an admin role

##### Params
| Param | Description |
| :------------- | :------------- |
| id | Number, User ID to delete |

##### Response
Respose SHOULD HAVE a `204` status code (No Content).

## Cart
By default, every user has a cart.

### Get products in cart
#### `GET /cart`
You should provide a valid JWT token to authenticate a user.

##### Response
An array of products
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

### Add a product to cart
#### `POST /cart`
You should provide a valid JWT token to authenticate a user.

##### Params
```json
{
  "product": {
    "id": 2
  }
}
```

##### Response
An array of products with status 201
```json
[
  {
    "id": 1,
    "sku": "756-76444521",
    "name": "Github Mug",
    "description": "A github mug",
    "price": 14.00
  },
  {
    "id": 2,
    "sku": "756-76444521",
    "name": "Github Mug x2",
    "description": "A github mug",
    "price": 28.00
  },
  // ...
]
```


## Wish lists
### Get all currrent user's wish lists
#### `GET /wish_lists`
You should provide a valid JWT token to authenticate a user.

##### Response
```json
[
  {
    "id": 1,    
    "name": "Kitchen",
  },
  {
    "id": 2,
    "name": "Games",
  },
  // ...
]
```

### Create new Wish list
#### `POST /wish_lists`
You should provide a valid JWT token to authenticate a user.

##### Params
```json
{
  "wish_list": {
    "name": "Office"
  }
}
```

##### Response
```json
{
  "id": 3,
  "name": "Office"
}
```

### Update a Wish list
#### `PUT /wish_lists/:id`
You should provide a valid JWT token to authenticate a user.

##### Params
| Params | Description     |
| :------------- | :------------- |
| id | Number, ID of wish_list       |

```json
{
  "wish_list": {
    "name": "Office and Stuffs"
  }
}
```

##### Response
```json
{
  "id": 3,
  "name": "Office and Stuffs"
}
```

### Delete a Wish list
#### `DELETE /wish_lists/:id`
You should provide a valid JWT token to authenticate a user.

##### Params
| Params | Description     |
| :------------- | :------------- |
| id | Number, ID of wish_list       |


##### Response
No Content Respose

## Products in Wish lists
### Get all products in a wish list
#### `GET /wish_lists/:id/products`
You should provide a valid JWT token to authenticate a user.

##### Params
| Params | Description     |
| :------------- | :------------- |
| id | Number, ID of wish_list       |

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
  {
    "id": 2,
    "sku": "756-76444521",
    "name": "Github Mug x2",
    "description": "A github mug",
    "price": 28.00
  },
  // ...
]
```

### Add a product to a Wish list
#### `POST /wish_lists/:id/products`
You should provide a valid JWT token to authenticate a user.

##### Params
| Params | Description     |
| :------------- | :------------- |
| id | Number, ID of wish_list       |

```json
{
  "product": {
    "id": 3
  }
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
  {
    "id": 2,
    "sku": "756-76444521",
    "name": "Github Mug x2",
    "description": "A github mug",
    "price": 28.00
  },
  {
    "id": 3,
    "sku": "756-764215121",
    "name": "Github t shirt",
    "description": "Size M",
    "price": 38.00
  },
  // ...
]
```

### Delete a product from a Wish list
#### `DELETE /wish_lists/:id/products/:product_id`
You should provide a valid JWT token to authenticate a user.

##### Params
| Params | Description     |
| :------------- | :------------- |
| id | Number, ID of wish_list       |
| product_id | Number, ID of product       |


##### Response
No Content Response
