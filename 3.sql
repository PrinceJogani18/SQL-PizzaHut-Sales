-- Identify the most common pizza size ordered.

select p.size, sum(od.quantity) as Order_Count
from pizzas p 
join order_details od on od.pizza_id = p.pizza_id
group by p.size
order by Order_Count desc
;
