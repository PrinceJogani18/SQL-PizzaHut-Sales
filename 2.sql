-- Identify the highest-priced pizza.

select ptype.name, p.price
from pizza_types ptype
join pizzas p on ptype.pizza_type_id= p.pizza_type_id
order by p.price desc
limit 1;