use ecommerce;

select 
c.nombre as categoria,
p.nombre as producto,
p.precio,
rank() over (partition by c.id order by p.precio desc) as ranking
from productos p 
join categorias c on p.id_categoria = c.id;