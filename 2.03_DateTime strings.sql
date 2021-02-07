-- 2.01 Lab | Intro to SQL

use sakila;
select* from sakila.actor, sakila.address, sakila.category, sakila.city;

select title
from sakila.film;

select distinct name as language
from sakila.language;

select * from sakila.rental
where return_date is not null;

select store_id
from sakila.store;

select first_name
from sakila.staff;

select distinct rental_date
from sakila.rental;

select count(rental_date)
from sakila.rental;

-- 2.02 Lab | Datawarehouses and Operators
-- 1

select first_name, last_name
from sakila.actor
where first_name = 'Scarlett';

-- 2
select first_name, last_name
from sakila.actor
where last_name = 'Johansson';

-- 3
select count(film_id)
from sakila.film;

-- 4
select count(rental_id)
from sakila.rental;

-- 5
select max(rental_duration) from sakila.film;


select * from sakila.payment;

select * from sakila.inventory;



-- 6
select max(length)
from sakila.film;

select min(length)
from sakila.film;

-- 7
select avg(length) from sakila.film;

-- 8 
select convert(avg(length),time) from sakila.film;

select count(length) from sakila.film
where length > '180';

select max(length(title)) from sakila.film;

select lower(email) from sakila.customer;
select *, lower(concat(first_name, '.', last_name, '@sakilacustomer.org')) from sakila.customer;

-- 2.03 Lab 

select count(distinct last_name) from sakila.actor; -- 121

select count(distinct language_id) from sakila.language;

select count(film_id)
from sakila.film
where rating = 'PG-13';

select title, length
from sakila.film
where release_year ="2006"
limit 10;

select datediff(max(rental_date),min(rental_date)) from rental;

select date_format(convert(rental_date, date), '%M') as Month, date_format(convert(rental_date, datetime), '%W') as Weekday from sakila.rental
limit 20;

-- 7

select date_format(convert(rental_date, datetime), '%W') as Weekday,
case
when date_format(convert(rental_date, datetime), '%W') in ('Saturday', 'Sunday') then 'Weekend'
else 'weekday'
end as 'day_type'
from sakila.rental;

-- 8
select count(rental_id) from sakila.rental
where date_format(convert(rental_date, date), '%M') = 'February' and date_format(convert(rental_date, date), '%Y') = '2006';

select rental_id, rental_date
from sakila.rental
order by rental_date asc;