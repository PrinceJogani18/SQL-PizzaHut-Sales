-- Calculate the total revenue generated from pizza sales.
select count(quantity), pizza_id
from order_details
group by pizza_id;

select od.pizza_id, od.quantity, p.price
from order_details od
join pizzas p on p.pizza_id = od.pizza_id;

SELECT 
    ROUND(SUM(od.quantity * p.price), 2) AS Total_Revenue
FROM
    order_details od
        JOIN
    pizzas p ON p.pizza_id = od.pizza_id;
