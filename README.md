

In PSQL:
  CREATE DATABASE hair_salon;
    CREATE TABLE stylists (id SERIAL PRIMARY KEY, stylists_name VARCHAR);
    CREATE TABLE clients (id SERIAL PRIMARY KEY, client_name VARCHAR, stylist_id INT);

  CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;
