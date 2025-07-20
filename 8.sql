-- Group the orders by date and calculate the average number of pizzas ordered per day.

select * from orders;

select round(avg(Quantity),0) as Average_Quantity_per_day 
from
(select date(orders.order_date) as date, sum(od.quantity) as Quantity
from order_details od
join orders on orders.order_id = od.order_id
group by date) as ordered_quantity;