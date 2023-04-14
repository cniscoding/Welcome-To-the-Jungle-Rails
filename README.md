# Jungle

A mini e-commerce application built with Rails 6.1 for purposes of teaching Rails by example.


## ScreenShots
Landing/Index Page
![Landing/Index Page](https://github.com/cniscoding/jungle-rails/blob/master/docs/00_index_page.png)

Product selection on Index
![Product selection on Index](https://github.com/cniscoding/jungle-rails/blob/master/docs/01_index_page_with_products.png)

Admin Dashboard
![Admin Dashboard](https://github.com/cniscoding/jungle-rails/blob/master/docs/02_admin_dashboard.png)

Checkout Screen with Stripe
![Checkout Screen with Stripe](https://github.com/cniscoding/jungle-rails/blob/master/docs/03_checkout_with_stripe.png)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
