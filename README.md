# hair_salon

##### This application is built for a hair salon. It allows a user to create a one to many relationship between clients and stylist. One stylist could have many clients. The app can be used in a localhost on the browser and is designed to run with a PSQL database.
## Date: August 21, 2015

#### By Kendra Ash

## Description
  This application is designed for a hair salon. It allows the user to add, delete, and update new clients as well as stylists. In addition, it generates views that list all clients for a particular stylist and all clients at the salon.
  This application uses Ruby along with numerous gems: sinatra, capybara, postgres, rspec.

## Setup

* Make clone of repo
* In terminal change directories to cloned directory
* Then bundle your gems using the command: bundle
* Must set up database using PSQL code below.
* Run sinatra using the command: ruby app.rb
* On a web browser visit: localhost:4567
* You should now be on the web app.

Using PSQL
  * In terminal use command: gem instal postgres
  * Run postgres with command: postgres
  * To access psql use the command: psql
In PSQL:
  CREATE DATABASE hair_salon;
      - Then connect to database using the command: \c hair_salon
    * CREATE TABLE stylists (id SERIAL PRIMARY KEY, stylist_name VARCHAR);
    * CREATE TABLE clients (id SERIAL PRIMARY KEY, client_name VARCHAR, stylist_id INT);

  CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;


## Technologies Used

This app uses Ruby.
  gems: rspec, capybara, sinatra, postgres
### Legal

Open source language.

Copyright (c) 2015 **_{Kendra Ash}_**
