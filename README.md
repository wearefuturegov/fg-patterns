# Fg-Patterns

A shared library of service patterns for local government. It:

* has a filterable database of patterns and services
* allows for users to submit new services

Built with Rails (5.2.3).

## Prerequisites

* Ruby (2.6.0)
* Postgres

## Running it locally

1. Clone repo and run `bundle install`
2. Create environment file `cp .env.example .env`
2. Set up database by running `rake db:create`, `rake db:migrate` and then `rake db:seed`
3. Then you should be good to run a server with `rails s`

# Running it on the web

We use Heroku.

# Environment config

* To send emails you will need to set a `SENDGRID_API_KEY` and an `ADMIN_EMAIL` address.
* For login to the admin section you can set `HTTP_USERNAME` and `HTTP_PASSWORD`.