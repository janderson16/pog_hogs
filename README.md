# PogHogs

## About the app

PogHogs is an e-commerce website for 90's pog craze. Users have the ability to create an account, add items to cart and purchase as well as leave reviews about products they've bought while admins can manage stock levels, order/status and user priveleges. Products are handled in a PostgreSQL database with images on paperclip. The app utilizes the Bootstrap library for styling. 
[Production link](https://poghogs.herokuapp.com/)

#### Stack
* Ruby 2.3.0
* Rails 5.0.1
* RSpec test suite w/ Capybara
* BCrpyt


## Setup

1. Clone down the repository
```$ git clone git@github.com:janderson16/pog_hogs.git```
1. Bundle
```$ bundle install```
1. Create database
```$ rake db:create```
1. Migrate
```$ rake db:migrate``` 
1. Seed
```$ rake db:seed```
#### Run Locally
1. Start server
```$ rails s```
1. visit localhost in broswer
```localhost:3000``` 

#### Run Test Suite

1. ```$ rake db:test:prepare```
1. ```$ rspec```

---
