#use swigy;
#select * from swiggy;

#Q1.)
select count(distinct restaurant_name)
as high_rated_restaurants
from swiggy
where rating >4.5;

#Q2) 
select city, count(distinct restaurant_name)
as restaurant_count from swiggy
group by city
order by restaurant_count desc
limit 1;

#Q3
select distinct restaurant_name as pizza_restaurants
from swiggy
where restaurant_name like '%Pizza%';

#Q4
select count(distinct restaurant_name) as pizza_restaurants
from swiggy
where restaurant_name like '%Pizza%';

#Q5
select cuisine,count(*) as cuisine_count
from swiggy
group by cuisine
order by cuisine_count desc
limit 1;

#Q6
select city, avg(rating) as average_rating
from swiggy group by city;

#Q7
select distinct restaurant_name,
menu_category, max(price) as highestprice
from swiggy where menu_category='Recommended'
group by restaurant_name,menu_category;

#Q8
select distinct restaurant_name,cost_per_person
from swiggy where cuisine<> 'Indian'
order by cost_per_person desc
limit 5;

#Q9
select distinct restaurant_name,cost_per_person
from swiggy where cost_per_person>(
select avg(cost_per_person) from swiggy);

#Q10
select distinct t1.restaurant_name,t1.city,t2.city
from swiggy t1 join swiggy t2 on t1.restaurant_name = t2.restaurant_name and
t1.city<>t2.city;

#Q11
select distinct restaurant_name, menu_category
,count(item) as no_of_items from swiggy
where menu_category = 'Main Course'
group by restaurant_name, menu_category
order by no_of_items desc limit 1;

#Q12
select  distinct restaurant_name,
(count(case when veg_or_nonveg='Veg' then 1 end)*100/
count(*)) as vegetarian_percetage
from swiggy
group by restaurant_name
having vegetarian_percetage = 100.00
order by restaurant_name;

#Q13
select distinct restaurant_name,
avg(price) as average_price
from swiggy group by restaurant_name
order by average_price limit 1;

#Q14
select distinct restaurant_name,
count(distinct menu_category) as no_of_categories
from swiggy
group by restaurant_name
order by no_of_categories desc limit 5;

#Q14
select distinct restaurant_name,
(count(case when veg_or_non-veg='Non-veg' then 1 end)*100
/count(*)) as nonvegetarian_percentage
from swiggy
group by restaurant_name
order by nonvegetarian_percentage desc limit 1;