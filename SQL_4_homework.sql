-- 1. List all customers who live in Texas (use JOINs)
select customer.first_name, customer.last_name, customer.customer_id, address.address_id, address.district 
from customer
full join address 
on customer.address_id = address.address_id 
where district = 'Texas';


-- 2. Get all payments above $6.99 with the Customer's Full Name
select customer.first_name, customer.last_name, payment.amount 
from customer
full join payment
on customer.customer_id = payment.customer_id 
where amount > 6.99


-- 3. Show all customers names who have made payments over $175(use subqueries)
select first_name, last_name  
from customer
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id
	having sum(amount) > 175
	order by last_name asc 
);



-- 4. List all customers that live in Nepal (use the city table)
select customer.first_name, customer.last_name, customer.customer_id, country.country 
from customer
full join address 
on customer.address_id = address.address_id 
full join city 
on address.city_id = city.city_id 
full join country
on city.country_id = country.country_id 
where country = 'Nepal';


-- 5. Which staff member had the most transactions?
--select staff.first_name, staff.last_name,staff.staff_id,payment.payment_id
--from staff 
--full join payment 
--on staff.staff_id = payment.staff_id 


select staff_id, count(amount)
from payment
group by staff_id
order by staff_id	



-- 6. How many movies of each rating are there?
select distinct rating
from film


select rating, count(rating)
from film 
where rating = 'R' or rating = 'PG' or rating = 'G' or rating = 'PG-13' or rating = 'NC-17'
group by rating



-- 7.Show all customers who have made a single payment above $6.99 (Use Subqueries)
select first_name, last_name
from customer
where customer_id in (
	select customer_id 
	from payment 
	group by customer_id, amount 
	having count(amount) = 1 and amount > 6.99
	order by count(amount) desc
)
group by first_name, last_name ;


-- 8. How many free rentals did our stores give away?
select count(amount)
from payment
group by payment_id
having amount = 0.00
order by payment_id ;

