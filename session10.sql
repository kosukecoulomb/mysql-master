USE ecsite;

SELECT * FROM order_details WHERE product_id = 3;

SELECT * FROM order_details WHERE product_id <> 3;

SELECT * FROM order_details WHERE product_id != 3;

SELECT * FROM products WHERE price > 40;

SELECT * FROM users WHERE birthday NOT LIKE '20%';

SELECT * FROM users WHERE birthday LIKE '20%' AND gender = 0;

SELECT * FROM users WHERE birthday LIKE '20%' && gender = 0;

SELECT * FROM users WHERE birthday LIKE '20%' OR gender = 0;

SELECT * FROM users WHERE birthday LIKE '20%' || gender = 0;

SELECT * FROM products WHERE price BETWEEN 40 AND 598;

SELECT * FROM products WHERE price NOT BETWEEN 40 AND 598;

SELECT * FROM order_details WHERE product_id IN (1, 3);

SELECT * FROM order_details WHERE product_id NOT IN (1, 3);

SELECT * FROM users;

SELECT * FROM users WHERE name LIKE 'A%' OR name LIKE 'B%' OR  name LIKE 'C%'; 

SELECT * FROM users WHERE birthday LIKE '%3-%';

SELECT * FROM order_details WHERE order_id LIKE '__' && product_id IN (3, 4, 5, 6);

SELECT * FROM order_details WHERE product_id NOT IN (5, 6, 9) && amount >= 2;

SELECT * FROM products WHERE price NOT BETWEEN 40 AND 300;