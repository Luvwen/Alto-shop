CREATE DATABASE alto_shop;
USE alto_shop;


IF OBJECT_ID('dbo.products') IS NOT NULL
	DROP TABLE dbo.products;
GO
IF OBJECT_ID('dbo.products_categories') IS NOT NULL
	DROP TABLE dbo.products_categories;
GO
IF OBJECT_ID('dbo.category') IS NOT NULL
	DROP TABLE dbo.category;
GO
IF OBJECT_ID('dbo.users_login') IS NOT NULL
	DROP TABLE dbo.users_login;
GO
IF OBJECT_ID('dbo.vendors') IS NOT NULL
	DROP TABLE dbo.vendors;
GO
IF OBJECT_ID('dbo.users') IS NOT NULL
	DROP TABLE dbo.users;
GO
CREATE TABLE dbo.category(
	category_id INT IDENTITY(1,1),
	category_name VARCHAR(150),
	PRIMARY KEY(category_id)
);
GO
CREATE TABLE dbo.products(
	product_id INT IDENTITY(1,1),
	product_name VARCHAR(250) NOT NULL,
	product_image VARCHAR(250) NOT NULL,
	product_price INT,
	category INT
	PRIMARY KEY(product_id),
	FOREIGN KEY(category) REFERENCES category(category_id)
);
GO
CREATE TABLE dbo.products_categories(
	product_category_id INT IDENTITY(1,1),
	product_category_name VARCHAR(250),
	category INT
	PRIMARY KEY(product_category_id),
	FOREIGN KEY(category) REFERENCES category(category_id)
);
GO
CREATE TABLE dbo.users(
	user_id INT IDENTITY(1,1),
	user_name VARCHAR(150) NOT NULL,
	user_surname VARCHAR(150) NOT NULL,
	user_mail VARCHAR(250) NOT NULL UNIQUE,
	user_password VARCHAR(64) NOT NULL,
	user_dni INT NOT NULL,
	user_birthday DATE,
	user_gender VARCHAR(50),
	user_age INT
	PRIMARY KEY(user_id)
);
GO
CREATE TABLE dbo.users_login(
	login_id INT IDENTITY(1,1),
	login_date DATE,
	login_email VARCHAR(250) NOT NULL UNIQUE,
	PRIMARY KEY(login_id),
	FOREIGN KEY(login_email) REFERENCES users(user_mail)
);
GO
CREATE TABLE dbo.vendors(
	vendor_id INT IDENTITY(1,1),
	vendor_name VARCHAR(150) NOT NULL,
	vendor_reputation INT,
	vendor_active_products INT NOT NULL,
	vendor_sells INT NOT NULL,
	vendor_mail VARCHAR(250) NOT NULL UNIQUE,
	user_id INT,
	PRIMARY KEY(vendor_id),
	FOREIGN KEY(user_id) REFERENCES users(user_id)
);
GO
INSERT INTO dbo.category(category_name) VALUES('electronica');
INSERT INTO dbo.products(product_name, product_image, product_price, category) VALUES('Monitor 24 pulgadas LG', 'https://www.lg.com/ar/images/monitores/md05869136/gallery/24MP48HQ-P-desktop1-19082017_v1.jpg', 99000, 1);
INSERT INTO dbo.products(product_name, product_image, product_price, category) VALUES('Teclado HyperX Alloy FPS', 'https://m.media-amazon.com/images/I/41-U4bbRVIL._AC_.jpg', 137000, 1);
INSERT INTO dbo.products(product_name, product_image, product_price, category) VALUES('Mouse Logitech G502', 'https://resource.logitechg.com/w_692,c_lpad,ar_4:3,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/gaming/en/products/g502-lightspeed-gaming-mouse/g502-lightspeed-gallery-1.png?v=1', 155000, 1);
INSERT INTO dbo.products_categories(product_category_name, category) VALUES( 'electronica',1),( 'electronica',1),('electronica',1);
SELECT * FROM category;
SELECT * FROM products;
SELECT * FROM products_categories;
INSERT INTO dbo.users(user_name, user_surname, user_mail, user_password, user_dni, user_birthday, user_age, user_gender) VALUES('Santiago', 'Baliño', 'santiagobalino@hotmail.com', 'arcangel132', 40239364, '1997/12/23', 26, 'Masculino');
SELECT * FROM users;