#Frist of all we will finding the total revenue from pizza_sales

Select SUM(total_price) AS Total_Revenue from pizza_sales;

# Avg_order_values

Select SUM(total_price) / count(DISTINCT order_id) as Avg_order_values from pizza_sales;

#Total pizza sold

select sum(quantity) AS Total_Pizza_Sold from pizza_sales;

#Total_orders

select count(distinct order_id) AS Total_orders from pizza_sales;

#Avg_pizza_order
#1.Way
select sum(quantity) / count(distinct order_id) from pizza_sales;

#2.Way
select CAST(CAST(sum(quantity) AS DECIMAL(10, 2)) /
CAST(count(distinct order_id) AS DECIMAL (10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_Perform from pizza_sales;


select  day(DW , order_date) As order_day, count(distinct order_id) AS Total_orders 
from pizza_sales
group by day(DW, order_date);
##
SELECT pizza_category, SUM(total_price) AS Total_sales, SUM(total_price) *100 /
(SELECT sum(total_price) from pizza_sales) AS PCT
from pizza_sales
WHERE month(order_date)
group by pizza_category;

#copy
SELECT pizza_category, SUM(total_price) AS Total_sales, SUM(total_price) *100 /
(SELECT sum(total_price) from pizza_sales) AS PCT
from pizza_sales
group by pizza_category;

### pizza sales according the pizza size
select pizza_size, CAST(sum(total_price) AS decimal(10,2)) as Total_Sales, CAST(SUM(total_price) * 100/
(select sum(total_price) from pizza_sales) AS decimal(10,2)) AS PCT
from pizza_sales
group by pizza_size 
order by PCT DESC;

###  TOP 5 Pizza Sales
select pizza_name, sum(total_price) AS  Total_Revenue
From pizza_sales
Group by pizza_name
order by Total_Revenue DESC
limit 5;
### which top 5 pizza sales in highest quantiy sold  

select pizza_name, sum(quantity) AS  Total_Quantity
From pizza_sales
Group by pizza_name
order by Total_Quantity desc
limit 5;

### here we find the total order of the pizza 
select pizza_name, count(distinct order_id) AS  Total_Qrder
From pizza_sales
Group by pizza_name
order by Total_Qrder ASC
limit 5;

### 
select pizza_name, sum(quantity) AS  Total_Quantity
From pizza_sales
Group by pizza_name
order by Total_Quantity DESC
limit 5;