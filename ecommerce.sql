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

