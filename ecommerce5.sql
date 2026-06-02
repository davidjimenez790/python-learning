use ecommerce; 

select
c.nombre as categoria, 
p.nombre as producto,
sum(dp.cantidad) as total_vendido
from detalle_pedidos dp
join productos p on dp.id_producto =p.id
join categorias c on dp.id_categoria =c.id
group by c.id, p.id

