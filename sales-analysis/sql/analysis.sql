-- total revenue
select SUM(oi.quantity*p.sale_price) as total_revenue
from order_items oi
join products p
on oi.product_id = p.product_id;

-- revenue per product
select p.product_name, SUM(quantity*sale_price) as total_revenue
from order_items oi
join products p
on oi.product_id = p.product_id
group by p.product_name
order by total_revenue desc;

-- profit per product
select p.product_name, SUM((oi.quantity * p.sale_price) - (oi.quantity * p.cost_price)) as total_profit
from order_items oi
join products p
on oi.product_id = p.product_id
group by p.product_name
order by total_profit desc;

-- customer revenue & profit
select c.customer_name, SUM((oi.quantity*p.sale_price)-(oi.quantity*p.cost_price)) as total_profit, sum(oi.quantity * p.sale_price) as total_revenue
from customers c
join orders o
on c.customer_id = o.customer_id
join order_items oi
on o.order_id = oi.order_id
join products p
on oi.product_id = p.product_id
group by c.customer_name
order by total_profit desc;

-- customer ROI on product level
select c.customer_name, sum(oi.quantity * p.sale_price) as total_revenue,
sum(oi.quantity * p.cost_price) as total_cost,
sum((oi.quantity * p.sale_price) - (oi.quantity * p.cost_price)) as total_profit,
sum((oi.quantity * p.sale_price) - (oi.quantity * p.cost_price))
        / nullif(sum(oi.quantity * p.cost_price), 0) as roi
from customers c
join orders o
on c.customer_id = o.customer_id
join order_items oi
on o.order_id = oi.order_id
join products p
on oi.product_id = p.product_id
group by c.customer_name
order by ROI desc
