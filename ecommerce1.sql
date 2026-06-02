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

