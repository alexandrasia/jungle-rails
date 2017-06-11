# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

This was a week-long project simulating a real world experience where you inherit an existing code base in a language and framework that you are not familiar with. Functionality for certain features were implemented or bugs fixed including:

* Feature - Sold Out Badge
* Feature - Admin Categories
* Feature - User Authentication
* Feature - Enhancement to Order Details Page
* Feature - Email Receipt
* Bug - Missing Admin Security
* Bug - Checking out with Empty Cart
* Feature - Product Rating

## Screebnshots

!["Jungle Homepage"](https://github.com/alexandrasia/jungle-rails/blob/master/docs/jungle-homepage.png?raw=true)
!["Product and Reviews"](https://github.com/alexandrasia/jungle-rails/blob/master/docs/product-details-reviews.png?raw=true)
!["Order Page"](https://github.com/alexandrasia/jungle-rails/blob/master/docs/jungle-orderpage.png?raw=true)


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
