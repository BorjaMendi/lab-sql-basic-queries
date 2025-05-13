-- Use the sakila database to do the following tasks:
-- 1. Display all available tables in the Sakila database.
-- 2. Retrieve all the data from the tables actor, film and customer.
-- 3. Retrieve the following columns from their respective tables:
--   3.1 Titles of all films from the film table
--   3.2 List of languages used in films, with the column aliased as language from the language table
--   3.3 List of first names of all employees from the staff table
-- 4. Retrieve unique release years.
-- 5. Counting records for database insights:
--   5.1 Determine the number of stores that the company has.
--   5.2 Determine the number of employees that the company has.
--   5.3 Determine how many films are available for rent and how many have been rented.
--   5.4 Determine the number of distinct last names of the actors in the database.
-- 6. Retrieve the 10 longest films.
-- 7. Use filtering techniques in order to:
--   7.1 Retrieve all actors with the first name "SCARLETT".
-- BONUS:
--   7.2 Retrieve all movies that have ARMAGEDDON in their title and have a duration longer than 100 minutes.
--   Hint: use LIKE operator. More information here.

-- 1
USE sakila;
SHOW TABLES;

-- 2
SELECT * 
FROM actor;

SELECT * 
FROM film;

SELECT * 
FROM customer;

-- 3
SELECT title 
FROM film;

SELECT 
name AS language 
FROM language;

SELECT 
first_name 
FROM staff;

-- 4
SELECT 
DISTINCT release_year 
FROM film;

-- 5
SELECT 
COUNT(*) AS total_stores 
FROM store;

SELECT 
COUNT(*) AS total_employees 
FROM staff;

SELECT 
COUNT(DISTINCT film_id) AS available_films 
FROM inventory;

SELECT 
COUNT(DISTINCT inventory_id) AS rented_films 
FROM rental;

SELECT 
COUNT(DISTINCT last_name) AS unique_last_names 
FROM actor;

-- 6
SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10;

-- 7
SELECT * 
FROM actor
WHERE first_name = 'SCARLETT';

-- bonus
SELECT title, length
FROM film
WHERE title LIKE '%ARMAGEDDON%' AND length > 100;