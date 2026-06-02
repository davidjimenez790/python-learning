use ecommerce;

select 
u.nombre,
u.ciudad,
count(p.id) as total_pedidos,
sum(p.total) as dinero_gastado

from usuarios u 
join pedidos p on u.id = p.id_usuario
group by u.id, u.mnombre, u.ciudad
order by dinero_gastado desc; 