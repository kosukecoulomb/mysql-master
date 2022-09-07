CREATE DATABASE orders;
USE orders;
CREATE TABLE users
	(
		id int(5),
		name varchar(255),
		email varchar(255),
		age int(3),
		primary key(id)
	);

INSERT INTO users(id,name,email,age)VALUES(1,'Smith','smith@hotmail.com',58);

SELECT * FROM users;

INSERT INTO users(name,email,age)VALUES('Akira','akira@hotmail.com',24);

INSERT INTO users(name,email,age)VALUES('Lily','lily@hotmail.com',30);

DROP TABLE users;

CREATE TABLE users
	(
		id int(5) auto_increment primary key,
		name varchar(255),
		email varchar(255),
		age int(3)
	);

INSERT INTO users(id,name,email,age)VALUES(1,'Smith','smith@hotmail.com',58);

INSERT INTO users(name,email,age)VALUES('Akira','akira@hotmail.com',24);

INSERT INTO users(name,email,age)VALUES('Lily','lily@hotmail.com',30);

SELECT * FROM users;

CREATE TABLE orders
	(
		id int(10),
        user_id int,
        amount int(20),
        PRIMARY KEY(id),
        FOREIGN KEY(user_id) REFERENCES users(id) ON DELETE CASCADE
	);
    
ALTER TABLE orders ADD price int(20);
    
INSERT INTO orders(id,user_id,amount,price)VALUES(1,1,2,1100);

SELECT * FROM orders;

CREATE TABLE products
	(
		id int(10),
        category varchar(255),
        price int(20),
        PRIMARY KEY(id)
	);

ALTER TABLE orders ADD COLUMN product_id int AFTER user_id;

ALTER TABLE orders ADD FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE;

ALTER TABLE orders DROP FOREIGN KEY orders_ibfk_2;

INSERT INTO products (id, category, price) VALUES
	(1, "type1", 1000),
    (2, "type2", 2000),
    (3, "type3", 3000);

SELECT * FROM products;

DELETE FROM orders WHERE id = 1;

INSERT INTO orders (id, user_id, product_id, amount, price) VALUES
	(1, 1, 1, 2, 2000),
    (2, 1, 2, 2, 4000),
    (3, 3, 1, 3, 9000);
    
SELECT * FROM orders;

UPDATE users SET id = 5 WHERE id = 1;

SELECT * FROM users;

DELETE FROM  users WHERE id = 5;

UPDATE users SET id = 4 WHERE id = 3;

SELECT * FROM orders;

DROP TABLE products;

DROP TABLE orders;

DROP TABLE users;

CREATE TABLE users
	(
		id int(5) auto_increment primary key,
		name varchar(255),
		email varchar(255),
		age int(3),
        UNIQUE KEY (email)
	);
    
INSERT INTO users (id, name, email, age) VALUES
	(1,'Smith','smith@hotmail.com',58),
    (2,'Akira','akira@hotmail.com',24),
    (3,'Liky','lily@hotmail.com',30);

INSERT INTO users VALUES (4,'Smith','smith@hotmail.com',58);

ALTER TABLE users DROP INDEX email;

SELECT * FROM users;

SET autocommit = 0;

UPDATE users SET id = 5 WHERE id = 1;

ROLLBACK;

UPDATE users SET id = 5 WHERE id = 1;

COMMIT;

ROLLBACK;

SET autocommit = 1;

START TRANSACTION;

UPDATE users SET id = 5 WHERE id = 1;

ROLLBACK;

SELECT * FROM users;

CREATE INDEX index_name ON users(name);

CREATE TABLE products
	(
		id INT(10),
        category VARCHAR(255) NOT NULL,
        price INT(20) NOT NULL,
        PRIMARY KEY (id)
	);

INSERT INTO products (id, price)
VALUES (1, 1000);

INSERT INTO products (id, category, price)
VALUES (2, "", 1000);

INSERT INTO products (id, category, price)
VALUES (3, NULL, 1000);

SELECT * FROM products;

ALTER TABLE users
MODIFY email varchar(255) NOT NULL;

ALTER TABLE users
CHANGE COLUMN age age2 INT(3) NOT NULL;

DROP TABLE products;

CREATE TABLE products
(
	id INT(10),
    category VARCHAR(255) NOT NULL DEFAULT 'Not Categorized',
    price INT(20) NOT NULL DEFAULT 0,
    PRIMARY KEY (id)
);

INSERT INTO products (id) VALUES(1);

SELECT * FROM products;
