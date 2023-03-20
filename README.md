# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
# Phase-4-wk1-code-challenge
* Models
You need to create the following relationships:

A `Restaurant` has many `Pizza`s through `RestaurantPizza`

A `Pizza` has many `Restaurants through `RestaurantPizza`

A `RestaurantPizza` belongs to a `Restaurant` and belongs to a `Pizza`

* Validations
`Restaurantpizza `must have `price` between 1 and 30

* Routes
The following have been set up

1. Get/restaurants => here we'll use an index acton
2. Get/restaurants/:id => here we'll use a show action 
: if the specific id is not found it should return an error
    {

    "error": "Restaurant not found"

    }

3. Delete/restaurants/:id => here we'll use a destroy action
if the specific id is not found it should return an error
    {

    "error": "Restaurant not found"

    }

4. Get/pizzas => here we'll use an index action
5. Post/restaurantpizzas => here we'll use a create action
- If the `RestaurantPizza` is created successfully, send back a response with the data
related to the `Pizza`
- If the `RestaurantPizza` is **not** created successfully, return the following
JSON data, along with the appropriate HTTP status code:
    {

    "errors": ["validation errors"]

    }

