use ecommerce;
-- Consulta para obtener el ranking de productos por precio dentro de cada categoría
select 
c.nombre as categoria,
p.nombre as producto,
p.precio,
rank() over (partition by c.id order by p.precio desc) as ranking
from productos p 
join categorias c on p.id_categoria = c.id;

-- Consulta para obtener el total de ingresos por mes y el acumulado de ingresos a lo largo del tiempo 

select 
month(fecha) as mes,
sum(total) as ingresos_mes,
sum(sum(total)) over (order by month(fecha)) as acumulado
from pedidos
group by month (fecha)
order by mes; 

-- Consulta para obtener el promedio móvil de ingresos por mes (promedio de los últimos 2 meses incluyendo el mes actual)

select
month (fecha) as mes,
sum(total) as ingresos_mes,
avg(sum(total)) over (order by month(fecha) 
rows between 1 preceding and current row
) as promedio_movil1
from pedidos
group by month (fecha) 
order by mes; 