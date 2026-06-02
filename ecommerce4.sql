use ecommerce;

select 
month(fecha) as mes,
year(fecha) as año,
count (id) as total_pedidos,
sum (total) as ingresos_mes
from pedidos
group by year (fecha), month(fecha)
order by año, mes; 