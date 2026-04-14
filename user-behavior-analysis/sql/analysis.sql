-- event level funnel for views/adds/purchases
select 
sum(case when event_type = 'view_product' then 1 else 0 end) as viewed,
sum(case when event_type = 'add_to_cart' then 1 else 0 end) as added,
sum(case when event_type = 'purchase' then 1 else 0 end) as purchased
from events;

-- event level funnel by device with inconsistencies on mobile
select 
s.device_type,
sum(case when event_type = 'view_product' then 1 else 0 end) as viewed,
sum(case when event_type = 'add_to_cart' then 1 else 0 end) as added,
sum(case when event_type = 'purchase' then 1 else 0 end) as purchased
from events e
join sessions s
on e.session_id = s.session_id
group by s.device_type;

-- session level funnel by device
with funnel as (
select 
s.session_id,
s.device_type,
max(case when event_type = 'view_product' then 1 else 0 end) as viewed,
max(case when event_type = 'add_to_cart' then 1 else 0 end) as added,
max(case when event_type = 'purchase' then 1 else 0 end) as purchased
from sessions s
join events e
on s.session_id = e.session_id
group by s.session_id, s.device_type
)
select device_type,
sum(viewed) as viewed_sessions,
sum(added) as added_sessions,
sum(purchased) as purchased_sessions,
sum(added) * 1.0 / nullif(sum(viewed), 0) as view_to_cart_rate,
sum(purchased) * 1.0 / nullif(sum(added), 0) as cart_to_purchase_rate,
sum(purchased) * 1.0 / nullif(sum(viewed), 0) as view_to_purchase_rate
from funnel
group by device_type;

