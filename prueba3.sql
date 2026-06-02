-- Script SQL para crear una base de datos de comercio electrónico, insertar datos de prueba y realizar consultas
create database if not exists ecommerce character set utf8mb4;
use ecommerce;

create table usuarios (
id int auto_increment primary key,
nombre varchar(100) not null,
email varchar(100) not null unique, 
ciudad varchar(100),
fecha_registro date not null 
);

create table categorias (
id int auto_increment primary key,
nombre varchar(100) not null
);

create table productos (
id int auto_increment primary key,
nombre varchar(100) not null,
precio decimal(10,2) not null,
stock int default 0,
id_categoria int,
foreign key (id_categoria) references categorias (id)
);

create table pedidos (
id int auto_increment primary key,
id_usuario int not null,
fecha date not null,
total decimal(10,2),
foreign key (id_usuario) references usuarios(id)
);

create table detalle_pedidos (
id int auto_increment primary key,
id_pedido int not null,
id_producto int not null,
cantidad int not null,
precio_unitario decimal(10,2) not null,
foreign key (id_pedido) references pedidos(id),
foreign key (id_producto) references productos(id)
);


// Insertar datos de prueba
use ecommerce;

insert into categorias (nombre) values
('Tecnologia'), ('Muebles'), ('Papeleria'), ('Ropa'), ('Hogar');

insert into usuarios (nombre, email, ciudad, fecha_registro) values
('David Jimenez', 'david@gmail.com', 'Medellin', '2024-01-01'),
('Ana Garcia', 'ana@gmail.com', 'Bogotá', '2024-01-05'),
('Carlos López', 'carlos@gmail.com', 'Cali', '2024-01-10'),
('María Torres', 'maria@gmail.com', 'Medellin', '2024-02-01'),
('Pedro Ramírez', 'pedro@gmail.com', 'Bogotá', '2024-02-15');

insert into productos (nombre, precio, stock, id_categoria) values
('Laptop Dell', 2500000, 10, 1),
('Mouse Logitech', 85000, 50, 1),
('Silla Ergonómica', 650000, 15, 2),
('Escritorio', 980000, 8, 2),
('Cuaderno', 12000, 100, 3),
('Impresora HP', 450000, 12, 1),
('Lampara de escritorio', 75000, 30, 5),
('Camiseta', 45000, 60, 4);

insert into pedidos (id_usuario, fecha, total) values
(1, '2024-01-15', 2585000),
(2, '2024-01-20', 650000),
(3, '2024-02-01', 1065000),
(1, '2024-02-10', 85000),
(4, '2024-02-20', 525000),
(2, '2024-03-01', 980000),
(5, '2024-03-10', 120000);

insert into detalle_pedidos (id_pedido, id_producto, cantidad, precio_unitario) values
(1, 1, 1, 2500000),
(1, 2, 1, 85000),
(2, 3, 1, 650000),
(3, 4, 1, 980000),
(3, 2, 1, 85000),
(4, 2, 1, 85000),
(5, 8, 3, 45000),
(5, 7, 2, 75000),
(6, 4, 1, 980000),
(7, 5, 5, 12000),
(7, 7, 1, 75000);


// Consultas de prueba

-- Consulta para obtener el total de pedidos y dinero gastado por cada usuario
use ecommerce;

select 
u.nombre,
u.ciudad,
count(p.id) as total_pedidos,
sum(p.total) as dinero_gastado

from usuarios u 
join pedidos p on u.id = p.id_usuario
group by u.id, u.nombre, u.ciudad
order by dinero_gastado desc; 

-- Consulta para obtener los productos más vendidos
use ecommerce;

select 
p.nombre,
sum(dp.cantidad) as total_vendido
from detalle_pedidos dp
join productos p on dp.id_producto = p.id
group by p.id
order by total_vendido desc
limit 3; 

-- Consulta para obtener el total de pedidos e ingresos por mes
use ecommerce;

select 
month(fecha) as mes,
year(fecha) as año,
count(id) as total_pedidos,
sum(total) as ingresos_mes
from pedidos
group by year (fecha), month(fecha)
order by año, mes; 

-- Consulta para obtener usuarios sin pedidos
use ecommerce; 

select 
u.nombre,
u.email,
u.ciudad
from usuarios u 
left join pedidos p on u.id = p.id_usuario
where p.id is null;

-- Consulta para obtener el total vendido por categoría y producto
use ecommerce; 

select
c.nombre as categoria, 
p.nombre as producto,
sum(dp.cantidad) as total_vendido
from detalle_pedidos dp
join productos p on dp.id_producto =p.id
join categorias c on p.id_categoria =c.id
group by c.id, p.id
order by c.nombre, total_vendido desc;