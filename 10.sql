-- Calculate the percentage contribution of each pizza type to total revenue.

select pt.category,
sum(od.quantity * p.price) as Revenue
from pizza_types pt
join pizzas p on pt.pizza_type_id = p.pizza_type_id
join order_details od on p.pizza_id = od.pizza_id
group by pt.category
order by Revenue desc
;


select pt.category,
(sum(od.quantity * p.price) AS Category_Revenue, / 
(SELECT 
    ROUND(SUM(od.quantity * p.price), 2) AS Total_Revenue
FROM
    order_details od
        JOIN
    pizzas p ON p.pizza_id = od.pizza_id) )*100 as Revenue
from pizza_types pt
join pizzas p on pt.pizza_type_id = p.pizza_type_id
join order_details od on p.pizza_id = od.pizza_id
group by pt.category
order by Revenue desc
;

SELECT 
    pt.category,
    ROUND(SUM(od.quantity * p.price), 2) AS Category_Revenue,
    ROUND(SUM(od.quantity * p.price) * 100 / 
        (SELECT SUM(od2.quantity * p2.price)
         FROM order_details od2
         JOIN pizzas p2 ON p2.pizza_id = od2.pizza_id), 2) AS Revenue_Percentage
FROM 
    pizza_types pt
JOIN 
    pizzas p ON pt.pizza_type_id = p.pizza_type_id
JOIN 
    order_details od ON p.pizza_id = od.pizza_id
GROUP BY 
    pt.category
ORDER BY 
    Revenue_Percentage DESC;
