USE ecsite;

SELECT 1 + 2;

SELECT 3 DIV 2;

SELECT 3 MOD 2;

SELECT * FROM order_details WHERE id = 9;

SELECT 
    id + order_id AS sum_id
FROM
    order_details
WHERE
    id = 9;
    
    
SELECT 
    id MOD order_id AS MOD_id
FROM
    order_details
WHERE
    id = 9;
    
    
SELECT ABS(-10);

SELECT ROUND(2.4);

SELECT CEILING(2.4);

SELECT FLOOR(2.6);

SELECT TRUNCATE(1.0384, 4);

SELECT TRUNCATE(1.0384, 2);

SELECT * FROM order_details WHERE product_id = 9;

SELECT COUNT(amount) FROM order_details WHERE product_id = 9;

SELECT COUNT(id) FROM order_details WHERE product_id = 9;

SELECT COUNT(DISTINCT amount) FROM order_details WHERE product_id = 9;

SELECT * FROM order_details WHERE product_id = 9 GROUP BY amount;

SELECT SUM(amount) FROM order_details WHERE product_id = 9;

SELECT AVG(amount) FROM order_details WHERE product_id = 9;


SELECT 
    AVG(amount) AS avg_amount,
    SUM(amount) AS sum_amount
FROM
    order_details
WHERE
    product_id = 9;


SELECT 
    AVG(amount) AS avg_amount,
    SUM(amount) AS sum_amount
FROM
    order_details
WHERE
    product_id = 9
GROUP BY amount;


SELECT MAX(price) FROM products;

SELECT MIN(price) FROM products;


SELECT 
    *
FROM
    products
WHERE
    price = (SELECT 
            MAX(price)
        FROM
            products);


SELECT 
    *
FROM
    products
WHERE
    price = (SELECT 
            MIN(price)
        FROM
            products);
            

SELECT MAX(product_id) FROM order_details GROUP BY amount;

SELECT CONCAT("A", "B", "C");

SELECT CONCAT("A", " ", "C");

SELECT CONCAT(name, birthday) FROM users;

SELECT LOWER('AAA');

SELECT name FROM users;

SELECT LOWER(name) FROM users;

SELECT UPPER(name) FROM users;

SELECT REPLACE('abc', 'a', 'A');

SELECT REPLACE(name, 'a', 'A') FROM users;

SELECT INSERT('abcd', 1, 2, 'xy');

SELECT INSERT(name, 1, 5, 'AAAAA') FROM users;

SELECT LPAD('ab', 6, 'A') FROM users;

SELECT LPAD(name, 30, 'A') FROM users;

SELECT RPAD(name, 30, 'A') FROM users;

SELECT REPEAT('OK', 5);

SELECT REPEAT(name, 30) FROM users;

SELECT LENGTH('abcd');

SELECT LENGTH('日本語');

SELECT char_length('日本語');

SELECT CURRENT_DATE(), CURRENT_TIME(), CURRENT_TIMESTAMP();

CREATE TABLE simpleid
(
	id INT(5),
    created_at TIMESTAMP DEFAULT NOW()
);

INSERT INTO simpleid(id) VALUES(1);

SELECT * FROM simpleid;

SELECT DATEDIFF('2020-02-24', '2020-01-20');

SELECT DAYNAME('2020-10-22');

SELECT DAY('2020-10-22');

SELECT DAYOFMONTH('2020-10-22');

SELECT DAYOFYEAR('2020-10-22');

SELECT DAYOFWEEK('2020-10-22');

SELECT DATE_FORMAT('2020-10-22', '%a');

SELECT DATE_FORMAT('2020-10-22', '%b');

SELECT DATE_FORMAT('2020-10-22', '%c');

SELECT DATE_FORMAT('2020-10-22', '%d');

SELECT CONVERT_TZ('2020-10-1 06:34:24', 'Asia/Tokyo', 'America/New_York');