CREATE DATABASE alto_shop;
USE alto_shop;


IF OBJECT_ID('dbo.category') IS NOT NULL
	DROP TABLE dbo.category;
GO

IF OBJECT_ID('dbo.products') IS NOT NULL
	DROP TABLE dbo.products;
GO


CREATE TABLE dbo.category(
	category_id INT IDENTITY(1,1),
	category_name VARCHAR(150),
	PRIMARY KEY(category_id)
);

CREATE TABLE dbo.products(
	product_id INT IDENTITY(1,1),
	product_name VARCHAR(250) NOT NULL,
	product_image VARCHAR(250) NOT NULL,
	product_price INT,
	category INT
	PRIMARY KEY(product_id),
	FOREIGN KEY(category) REFERENCES category(category_id)
);

INSERT INTO dbo.category(category_name) VALUES('electronica');
INSERT INTO dbo.products(product_name, product_image, product_price, category) VALUES('Monitor 24 pulgadas LG', 'https://www.lg.com/ar/images/monitores/md05869136/gallery/24MP48HQ-P-desktop1-19082017_v1.jpg', 99000, 1);
INSERT INTO dbo.products(product_name, product_image, product_price, category) VALUES('Teclado HyperX Alloy FPS', 'https://m.media-amazon.com/images/I/41-U4bbRVIL._AC_.jpg', 137000, 1);
INSERT INTO dbo.products(product_name, product_image, product_price, category) VALUES('Mouse Logitech G502', 'https://resource.logitechg.com/w_692,c_lpad,ar_4:3,q_auto,f_auto,dpr_1.0/d_transparent.gif/content/dam/gaming/en/products/g502-lightspeed-gaming-mouse/g502-lightspeed-gallery-1.png?v=1', 155000, 1);

SELECT * FROM category;
SELECT * FROM products;