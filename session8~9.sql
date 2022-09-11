USE ecsite;

SHOW tables;

SHOW COLUMNS FROM users;

SHOW keys FROM users;

SELECT * FROM users;

SELECT name FROM users;

SELECT id, name FROM users;

SELECT id, name, birthday FROM users;

SELECT 
    *
FROM
    users
WHERE
    birthday = '2002-03-09';
    

SELECT 
    name, birthday
FROM
    users
WHERE
    birthday = '2002-03-09'
        OR birthday = '2003-06-07';
        

SELECT 
    id AS user_id
FROM
    users;
    

SELECT 
    id AS user_id, name AS fullname, birthday AS DOB
FROM
    users;


SELECT * FROM order_details;

SELECT DISTINCT order_id FROM order_details;

SELECT DISTINCT id, product_id FROM order_details;

SELECT DISTINCT order_id, product_id FROM order_details;

SELECT * FROM users;

SELECT name FROM users ORDER BY name;

SELECT id, name, birthday FROM users ORDER BY name;

SELECT name FROM users ORDER BY name DESC;

SELECT id, name, birthday FROM users ORDER BY name DESC;

SELECT id, name, birthday FROM users ORDER BY 3;

SELECT id, name, birthday FROM users ORDER BY name, birthday;

SELECT id, name FROM users ORDER BY name DESC;

SELECT id, name FROM users ORDER BY name DESC LIMIT 10;

SELECT id, name FROM users ORDER BY name DESC LIMIT 2,5;

SELECT id, name FROM users ORDER BY name DESC LIMIT 10 OFFSET 7;

SELECT name FROM users WHERE name LIKE "%da%";

SELECT * FROM users WHERE id LIKE '__';

SELECT * FROM order_details;

SELECT * FROM order_details GROUP BY amount;

SELECT * FROM order_details WHERE order_id LIKE '__' GROUP BY amount;

SELECT * FROM order_details GROUP BY amount HAVING id = 5;


SELECT id, name, birthday FROM users WHERE birthday LIKE '%-06-%';

SELECT * FROM users ORDER BY id DESC LIMIT 1;

SELECT * FROM order_details WHERE order_id LIKE '__'  AND product_id = 6; 

SELECT id, name AS 20s_users, birthday FROM users WHERE birthday LIKE '199%';

SELECT user_id FROM orders GROUP BY user_id;

SELECT DISTINCT user_id FROM orders;

SELECT * FROM order_details WHERE amount >= 2 GROUP BY product_id ;

SELECT * FROM order_details GROUP BY product_id HAVING amount >= 2;