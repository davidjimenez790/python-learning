use ecommerce;

select 
p.nombre,
sum(dp.cantidad) as total_vendido
from detalle_pedidos dp
join productos p on dp.id_producto = p.id
group by p.id
order by total_vendido desc
limit 3; 