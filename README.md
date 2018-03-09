# Amazome REST API

[![Build Status](https://travis-ci.org/arandilopez/amazome.svg?branch=master)](https://travis-ci.org/arandilopez/amazome)


## System dependencies

- Ruby version >= 2.4.1
- Postgresql >= 9.2

## Configuration

Clone this repo
```
$ git clone https://github.com/arandilopez/amazome
```

Install dependencies
```
$ bin/bundle install
```

## Database creation & initialization

Run

```
$ bin/rails db:create && bin/rails db:setup
```

## Test

Run
```
$ bin/rails test
```

## Deployment instructions

You can deploy on [heroku](https://devcenter.heroku.com/articles/getting-started-with-rails5)
