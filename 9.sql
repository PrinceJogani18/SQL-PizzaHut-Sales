-- Determine the top 3 most ordered pizza types based on revenue.

select * from order_details;
select * from pizzas;

select * from pizza_types;

select pt.name, sum(od.quantity * p.price) as Total_Revenue
from pizza_types pt
join pizzas p on p.pizza_type_id = pt.pizza_type_id
join order_details od on p.pizza_id = od.pizza_id
group by pt.name
order by Total_Revenue desc
limit 3;