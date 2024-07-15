------ HOMEWORK QUESTIONS ------------

-- 1. List all customers who live in Texas ( use JOINs)

select customer.customer_id ,customer.first_name ,customer.last_name , address
from customer
full join address
on customer.address_id = address_id 

--- How do i ISOLATE TEXAS ? WHICH TABLE DO I USE ?

-- 2. Get all payments above $6.99 with the Customer's Full Name

select customer.first_name ,customer.last_name ,amount
from customer
full join payment
on customer.customer_id =payment.customer_id 
where amount > 6.99

--3. Show all customer names who have made payments over 175$ (use subqueries)


select * from customer 
where customer_id in (
select customer_id
from payment 
group by customer_id 
having sum(amount)>175
order by sum(amount) desc

)
-- 4. List all customers that live in Nepal( use City Table).


select customer.customer_id,customer.first_name ,customer.last_name,country
from customer 
full join address 
on customer.address_id = address.address_id
full join city 
on address.city_id  = city.city_id
full join country
on city.country_id =country.country_id  
where country = 'Angola';

 -- 5. Which staff members had the most tracsactions ?

              --Answer Jon Stephens had the most tracsactions.



select count(payment.staff_id),staff.first_name ,staff.last_name
from payment 
full join staff 
on payment.staff_id =staff.staff_id 
group by staff.first_name, staff.last_name 
order by count(payment.staff_id) desc;




 -- 6. How many movies of wach rating are there?


select count(rating),rating
from film group by rating

-- 7. Show all customers who have made a single payment above 6.99 (Use Subqueries)


select * from customer 
where customer_id in (
select customer_id
from payment 
where amount>6.99
)


-- 8 How many free rentals did the stores give away?
-- Which tables do i use ?


