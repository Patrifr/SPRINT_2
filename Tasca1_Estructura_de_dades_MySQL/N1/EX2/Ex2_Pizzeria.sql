DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria;
USE pizzeria;

CREATE TABLE provinces(
province_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
province_name VARCHAR(100) NOT NULL,
UNIQUE(province_id)
);

CREATE TABLE localities(
locality_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
locality_name VARCHAR(100) NOT NULL,
province_id INT NOT NULL,
UNIQUE(locality_id),
FOREIGN KEY (province_id) REFERENCES provinces (province_id)
);

CREATE TABLE customers(
customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(50) NOT NULL,
surnames VARCHAR(100) NOT NULL,
adress VARCHAR(150) NOT NULL,
zip_code INT NOT NULL,
locality_id INT NOT NULL,
phone VARCHAR(50) NOT NULL,
UNIQUE(customer_id),
FOREIGN KEY (locality_id) REFERENCES localities (locality_id)
);

CREATE TABLE categories(
category_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
category_name VARCHAR(50) NOT NULL,
UNIQUE(category_id)
);

CREATE TABLE products(
product_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(50) NOT NULL,
product_description VARCHAR(100) NOT NULL,
picture VARCHAR(50) NOT NULL,
category_id INT,
price FLOAT NOT NULL,
product_type ENUM('pizza', 'burger', 'drink') NOT NULL,
UNIQUE(product_id),
FOREIGN KEY (category_id) REFERENCES categories (category_id)
);

CREATE TABLE stores(
store_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
UNIQUE(store_id),
adress VARCHAR(150) NOT NULL,
zip_code INT NOT NULL,
locality_id INT NOT NULL,
FOREIGN KEY (locality_id) REFERENCES localities (locality_id)
);

CREATE TABLE employees(
employee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
UNIQUE (employee_id),
employee_name VARCHAR(50) NOT NULL,
surnames VARCHAR(50) NOT NULL,
NIF VARCHAR(20) NOT NULL,
phone VARCHAR(20) NOT NULL,
job ENUM('cook', 'delivery person') NOT NULL,
store_id INT NOT NULL,
FOREIGN KEY (store_id) REFERENCES stores (store_id)
);

CREATE TABLE orders(
order_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
UNIQUE(order_id),
customer_id INT NOT NULL,
order_date DATETIME NOT NULL,
order_type ENUM('store', 'delivery') NOT NULL,
pizza_quantity INT NOT NULL,
burger_quantity INT NOT NULL,
drink_quantity INT NOT NULL,
total_price FLOAT NOT NULL,
store_id  INT NOT NULL,
delivery_person_id INT,
delivery_date DATETIME,
FOREIGN KEY (customer_id) REFERENCES customers (customer_id),
FOREIGN KEY (store_id) REFERENCES stores (store_id),
FOREIGN KEY (delivery_person_id) REFERENCES employees (employee_id)
);

CREATE TABLE order_details(
order_id INT NOT NULL,
product_id INT NOT NULL,
PRIMARY KEY(order_id, product_id),
FOREIGN KEY (order_id) REFERENCES orders (order_id),
FOREIGN KEY (product_id) REFERENCES products (product_id)
);

INSERT INTO provinces(province_name)
VALUES ('Albacete'), ('Barcelona'), ('Girona'), ('Almería');

INSERT INTO localities(locality_name, province_id)
VALUES ('Almansa', 1), ('Castelldefels', 2), ('Barcelona', 2), ('Banyoles', 3), ('Girona', 3), ('El Ejido', 4), ('Almería', 4);

INSERT INTO customers(customer_name, surnames, adress, zip_code, locality_id, phone)
VALUES 
('Dolores', 'Dalias Romero', 'C. Altamira, 33', 04005, 7, '660-07-1142'),
('Almudena', 'Castillejos Acién', 'C. Callejita, 25', 02640, 1, '663-77-1996'),
('Alberto', 'Garcia Fernández', 'C. de Gayarre, 36', 08014, 3, '677-07-9165'),
('Roger', 'Cervantes Blanco', 'C. de los Castillejos, 289', 08025, 3, '756-08-9896'),
('Francisco', 'Carmiño Larruzea', 'P.º del Pitort, 48', 08860, 2, '657-14-5468'),
('Manuela', 'Alcantara Pérez', 'C. Violín, 20', 04700, 6, '682-63-2460');

INSERT INTO categories(category_name)
VALUES ('Margherita'), ('Pepperoni'), ('Capricciosa');

INSERT INTO products(product_name, product_description, picture, category_id, price, product_type)
VALUES
('Pizza Margherita Vegan', 'Pizza margherita with vegan mozzarella', 'image', 1, 9.95, 1),
('Chicken Burger', 'Burger with crispy chicken and bbq sauce', 'image', NULL, 8.95, 2),
('Pîzza Spicy Pepperoni', 'Pepperoni pizza with spicy sauce', 'image', 2, 12.95, 1),
('Coke', 'Sparkling drink','image', NULL, 2.50, 3),
('Orange Fanta', 'Sparkling drink','image', NULL, 2.50, 3),
('Nestea', 'Black tea with lemon drink','image', NULL, 2.50, 3),
('Double burger','Burger wiht double cheese and double burger', 'image', NULL, 13.95, 2),
('Salmon Pizza', 'Margherita based pizza with smoked salmon on top', 'image', 1, 14.95, 1);

INSERT INTO stores(adress, zip_code, locality_id)
VALUES
('Av. de la Estación, 1', 04005, 7), ('Carrer d´Aribau, 20, L´Eixample', 08011, 3);

INSERT INTO employees(employee_name, surnames, NIF, phone, job, store_id)
VALUES
('Carla', 'Rodrigo Fuentes', '81911661J', '602682311', 1, 2),
('Beatriz', 'Marín Martínez', '40003583M', '603241994', 2, 2),
('Julio', 'Medina Delgado', '93712764T', '603626700', 2, 1),
('Eduardo', 'Jiménez Lozano', '89661133A', '603938016', 2, 2),
('Ignacio', 'Gutiérrez Castillo', '56681262Q', '604883510', 1, 2),
('Mar', 'Díaz Morales', '04466952F', '604971157', 1, 1),
('Cristina', 'Alonso Caño', '62513406G', '607236987', 1, 1);

INSERT INTO orders(customer_id, order_date, order_type, pizza_quantity, burger_quantity, drink_quantity, total_price, store_id, delivery_person_id, delivery_date)
VALUES
(3, '2024-06-15 21:32:56', 2, 1, 1, 2, 23.90, 2, 4, '2024-06-15 22:23:15'),
(4, '2024-01-22 20:15:32', 2, 2, 0, 2, 32.90, 2, 4, '2024-01-22 21:02:09'),
(6, '2023-11-02 21:05:11', 1, 3, 1, 3, 37.35, 1, NULL, '2023-11-02 21:20:00');

INSERT INTO order_details(order_id, product_id)
VALUES (1, 1), (1, 2), (1, 5), (1, 6), (2, 3), (2, 8), (2, 4), (2, 6), (3, 3), (3, 8), (3, 7), (3, 6), (3, 5), (3, 4);