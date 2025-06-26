USE sakila;

-- 1. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT(last_name)) FROM actor;

-- 2. In how many different languages where the films originally produced? 
SELECT DISTINCT(language_id) FROM film;

-- 3. How many movies were released with "PG-13" rating?
SELECT COUNT(*) FROM film WHERE rating = 'PG-13';

-- 4. Get 10 the longest movies from 2006.
SELECT * FROM film WHERE release_year='2006' ORDER BY length DESC LIMIT 10;

-- 5. How many days has been the company operating?
SELECT DATEDIFF(MAX(return_date),MIN(rental_date)) FROM rental; -- 101 days

-- SELECT MIN(rental_date) FROM rental;
-- SELECT MAX(return_date) FROM rental; 

-- 6. Show rental info with additional columns month and weekday. Get 20.
SELECT rental_date, 
	DATE_FORMAT(rental_date, '%M') AS month, 
    DATE_FORMAT(rental_date, '%W') AS weekday
FROM rental
LIMIT 20;
    
-- 7. Add an additional column day_type 
-- with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT *, 
	CASE
		WHEN DATE_FORMAT(rental_date,'%W') IN ('Sunday', 'Saturday') THEN 'weekend'
        ELSE 'weekday'
	END AS day_type 
FROM rental;

-- 8. How many rentals were in the last month of activity?
SELECT COUNT(rental_date) FROM rental WHERE LEFT(rental_date,7)='2006-02';

-- SELECT MAX(rental_date), MIN(rental_date) FROM rental;
