-- List the top 5 most ordered pizza types 
-- along with their quantities.

select pt.name, sum(od.quantity) as Quantities
from pizza_types pt
join pizzas p on pt.pizza_type_id = p.pizza_type_id 
join order_details od on od.pizza_id = p.pizza_id
group by pt.name 
limit 5;

