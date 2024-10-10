DROP DATABASE IF EXISTS Optica;
CREATE DATABASE Optica;
USE Optica;
CREATE TABLE adress(
adress_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
street VARCHAR(100) NOT NULL,
num INT NOT NULL,
floor VARCHAR(10),
door VARCHAR(10),
city VARCHAR(100),
zip_code INT NOT NULL,
country VARCHAR(100) NOT NULL,
);

CREATE TABLE suppliers(
supplier_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
supplier_name VARCHAR(100) NOT NULL,
adress_id INT NOT NULL,
phone VARCHAR(50) NOT NULL,
fax VARCHAR(50) NOT NULL,
NIF VARCHAR(50) NOT NULL,
FOREIGN KEY (adress_id) REFERENCES adress(adress_id)
);

CREATE TABLE brand(
brand_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
brand_name VARCHAR(100) NOT NULL,
supplier_id INT NOT NULL,
FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);

CREATE TABLE glasses(
glass_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
brand_id INT NOT NULL,
prescription DECIMAL(5,2) NOT NULL,
frame_type VARCHAR(50) NOT NULL,
frame_color VARCHAR(50) NOT NULL,
glass_color VARCHAR(50) NOT NULL,
price DECIMAL(5,2) NOT NULL,
FOREIGN KEY (brand_id) REFERENCES brand(brand_id)
);

CREATE TABLE employees(
  employee_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  employee_name VARCHAR(100) NOT NULL,
  );
  
CREATE TABLE customers(
customer_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(100) NOT NULL,
adress_id INT NOT NULL,
phone VARCHAR(50) NOT NULL,
mail VARCHAR(100) NOT NULL,
registration_date DATETIME NOT NULL,
employee_id INT NOT NULL,
recomendation_id INT,
FOREIGN KEY(adress_id) REFERENCES adress(adress_id),
FOREIGN KEY(employee_id) REFERENCES employees(employee_id)
);

ALTER TABLE customers
ADD CONSTRAINT fk_recomendation
FOREIGN KEY (recomendation_id) REFERENCES customers(customer_id);

CREATE TABLE sales(
sales_id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
customer_id INT NOT NULL,
employee_id INT NOT NULL,
glass_id INT NOT NULL,
sale_date DATE NOT NULL,
FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
FOREIGN KEY(employee_id) REFERENCES employees(employee_id),
FOREIGN KEY(glass_id) REFERENCES glasses(glass_id)
);

INSERT INTO adress (street, num, floor, door, city, zip_code, country)
VALUES 
('Pg. de Fabra i Puig', 125, NULL, NULL, 'Barcelona', 8016, 'Spain'),
('C. Progreso, Poligono Industrial los Olivos', 2, NULL, NULL, 'Getafe, Madrid', 28906, 'Spain'),
('Dr. Aldo Della Rosa', 5381, NULL, NULL, 'Caseros, Buenos Aires', 1678, 'Argentina'),
('Av. de la Mare de Déu de Montserrat', 8, '4º', '1ª', 'Barcelona', 8024, 'Spain'),
('C. Balate', 46, NULL, NULL, 'Sagüesa, Navarra', 31400, 'Spain'),
('Av. Río Amazonas', 5219, NULL, NULL, 'Quito', 170513, 'Ecuador'),
('C. Compositor Lehmberg Ruiz', 22, '3º', '3ª', 'Distrito Centro, Málaga', 29007, 'Spain');

INSERT INTO suppliers (supplier_name, adress_id, phone, fax, NIF)
VALUES
('VISTAOPTICA', 1, '+34 93 481 71 81', '+34 93 481 71 81', '94470814Q'),
('Missandtrendy Sunglasses | London', 2, '+34 865 526 765', '+34 865 526 765', '65958436W'),
('Optical Supplier SRL', 3, '+54 11 4824-6543', '+54 11 4824-6543', '67247466C');

INSERT INTO brand (brand_name, supplier_id)
VALUES
('Vogue', 1),
('Lip Sunglasses', 1),
('Missoni', 2),
('Guess', 1);

INSERT INTO glasses (brand_id, prescription, frame_type, frame_color, glass_color, price)
VALUES
(1, 1.61, 'Metal frame', 'Gold', 'None', 151.00),
(1, 1.74, 'Plastic frame', 'Red', 'None', 131.00),
(1, 1.50, 'Plastic frame', 'Pink', 'None', 100.00),
(2, 0.00, 'Floating frame', 'Gloss transparent grey', 'Pink', 238.00),
(3, 0.00, 'Plastic frame', 'Fuchsia', 'Gray', 194.25),
(4, 1.67, 'Metal frame', 'Rose gold', 'None', 93.75),
(4, 0.00, 'Plastic frame', 'Black', 'Degraded grey', 68.50),
(4, 1.74, 'Plastic frame', 'Pink animal print', 'None', 56.00);

INSERT INTO employees (employee_name)
VALUES
('Antonia Rodeos'),
('Raúl Alonso'),
('Maria Larrat');

INSERT INTO customers (customer_name, adress_id, phone, mail, registration_date, employee_id, recomendation_id)
VALUES
('Maria Garcia Bledas', 4, '+34 699-56-9432', 'mariagarcia26@gmail.com', '2019-06-15 00:00:00', 1, NULL),
('Enrique Moreno Arces', 5, '+34 625-88-5421', 'enrimoar2406@hotmail.com', '2020-03-24 00:00:00', 2, NULL),
('Camilo Lorenzo de los Montes', 6, '+593 972-59-0599', 'camilolo_99@yahoo.com', '2020-02-02 00:00:00', 1, NULL),
('MariCarmen Alcazar Acien', 7, '+34 783-73-0673', 'maricarmencita00@gmail.com', '2023-11-08 00:00:00', 3, NULL);

UPDATE customers SET recomendation_id = 3 WHERE customer_id = 2;
UPDATE customers SET recomendation_id = 1 WHERE customer_id = 3;
UPDATE customers SET recomendation_id = 1 WHERE customer_id = 4;

INSERT INTO sales (customer_id, employee_id, glass_id, sale_date)
VALUES
 (3, 2, 7, '2019-07-15'),
 (2, 3, 2, '2019-02-22'),
 (1, 3, 3, '2021-12-28'),
 (4, 1, 6, '2023-06-17'),
 (2, 1, 8, '2024-05-01');