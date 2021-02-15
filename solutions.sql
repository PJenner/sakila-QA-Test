USE sakila;

SHOW tables;
DESCRIBE film;
SELECT * FROM film;
SELECT * FROM staff;
SELECT * FROM film_category;
SELECT * FROM actor WHERE actor_id = 107;
SELECT `name` FROM `language`;

-- 1 List all actors.

SELECT concat(first_name," ",last_name) AS `actor_name` FROM actor;



-- 2 Find the surname of the actor with the forename 'John'.

SELECT last_name FROM actor WHERE first_name = "John";



-- 3 Find all actors with surname 'Neeson'.

SELECT concat(first_name," ",last_name) AS `actor_name` FROM actor WHERE last_name = "Neeson";



-- 4 Find all actors with ID numbers divisible by 10.

SELECT concat(first_name," ",last_name) AS `actor_name` FROM actor WHERE actor_id % 10 = 0;



-- 5 What is the description of the movie with an ID of 100?

SELECT `description` FROM `film` WHERE `film_id` = 100;



-- 6 Find every R-rated movie.

SELECT * FROM film WHERE rating = "R";



-- 7 Find every non-R-rated movie.

SELECT * FROM film WHERE rating != "R";



-- 8 Find the ten shortest movies.

SELECT * FROM film WHERE length IS NOT NULL ORDER BY length LIMIT 10;



-- 9 Find the movies with the longest runtime, without using LIMIT.

SELECT title, length FROM film WHERE length = (SELECT MAX(length) FROM film ORDER BY length);



-- 10 Find all movies that have deleted scenes.

SELECT * FROM film WHERE special_features LIKE "%Deleted Scenes%";



-- 11 Using HAVING, reverse-alphabetically list the last names that are not repeated.

SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(last_name) = 1 ORDER BY last_name DESC;



-- 12 Using HAVING, list the last names that appear more than once, from highest to lowest frequency.

SELECT last_name FROM actor GROUP BY last_name HAVING COUNT(last_name) > 1 ORDER BY COUNT(last_name) DESC;



-- 13 Which actor has appeared in the most films?

SELECT concat(first_name," ",last_name) FROM actor WHERE actor_id = (SELECT actor_id FROM film_actor GROUP BY actor_id ORDER BY COUNT(actor_id) DESC LIMIT 1); 



-- 14 When is 'Academy Dinosaur' due? 




-- 15 What is the average runtime of all films?
 
 SELECT AVG(length) FROM film;
 
 

-- 16 List the average runtime for every film category.



-- 17 List all movies featuring a robot.

SELECT title FROM film WHERE `description` LIKE "%obot%";



-- 18 How many movies were released in 2010?

SELECT COUNT(*) FROM film WHERE release_year = 2010;



-- 19 Find the titles of all the horror movies.

SELECT title FROM movies WHERE id IN (SELECT movie_id FROM genres_movies WHERE genre_id = (SELECT id FROM genres WHERE NAME = "Horror"));



-- 20 List the full name of the staff member with the ID of 2.

SELECT concat(first_name," ",last_name) FROM staff WHERE staff_id = 2;



-- 21 List all the movies that Fred Costner has appeared in.

SELECT title from film WHERE film_id IN (SELECT film_id FROM film_actor WHERE actor_id = (SELECT actor_id from actor WHERE first_name = "Fred" AND last_name = "Costner"));



-- 22 How many distinct countries are there?

SELECT COUNT(DISTINCT country_id) FROM country;



-- 23 List the name of every language in reverse-alphabetical order.

SELECT `name` FROM `language` ORDER BY `name` DESC;



-- 24 List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.

SELECT concat(first_name," ",last_name) FROM actor WHERE last_name LIKE "%son" ORDER BY first_name;



-- 25 Which category contains the most films?

SELECT `name` FROM `category` WHERE category_id = (SELECT category_id FROM film_category GROUP BY category_id ORDER BY COUNT(category_id) DESC LIMIT 1);







