USE ecsite;

SELECT 
    name
FROM
    (SELECT 
        *
    FROM
        users) AS Sub;
        
SELECT 
    name
FROM
    (SELECT 
        *
    FROM
        users);


SELECT 
    gender
FROM
    (SELECT 
        *
    FROM
        users
    GROUP BY gender) AS Sub;
    
    
SELECT 
    *
FROM
    (SELECT 
        product_id, SUM(amount) AS amount_sum
    FROM
        order_details
    GROUP BY product_id) AS sub;
    
    
CREATE VIEW sub AS
    SELECT 
        product_id, SUM(amount) AS amount_sum
    FROM
        order_details
    GROUP BY product_id;
    
SELECT * FROM sub;


SELECT 
    *
FROM
    (SELECT 
        product_id, COUNT(amount) AS id_count
    FROM
        order_details
    GROUP BY product_id) AS sub
WHERE
    product_id = 1;


SELECT 
	product_id,
    SUM(amount) AS PRODUCT_SUM,
    (SELECT SUM(amount) FROM order_details) AS TOTAL_SUM
FROM
    order_details
GROUP BY product_id;


SELECT
(SELECT SUM(amount) FROM order_details GROUP BY product_id) AS
SUM FROM
order_details;


SELECT 
    *
FROM
    users
WHERE
    id IN (SELECT 
            id
        FROM
            users
        WHERE
            birthday BETWEEN '1990-01-01' AND '1995-01-01');


SELECT 
    id, order_id, product_id, amount
FROM
    order_details
WHERE
    product_id IN (SELECT 
            id
        FROM
            products
        WHERE
            price > 40);


SELECT 
    order_details.id,
    order_details.order_id,
    order_details.product_id,
    order_details.amount,
    products.price
FROM
    order_details
        JOIN
    products ON order_details.product_id = products.id
WHERE
    products.price > 40;


SELECT 
    *
FROM
    users
WHERE
    EXISTS( SELECT 
            *
        FROM
            users
        WHERE
            id = 1);


SELECT 
    *
FROM
    users
WHERE
    id IN (SELECT 
            id
        FROM
            users
        WHERE
            id = 1);


SELECT 
    *
FROM
    users
WHERE
    EXISTS( SELECT 
            *
        FROM
            orders
        WHERE
            orders.user_id = users.id);


SELECT 
    product_id, SUM(amount) AS amount_sum
FROM
    order_details
GROUP BY product_id
HAVING SUM(amount) > (SELECT 
        SUM(amount) / 9
    FROM
        order_details);


SELECT 
    *
FROM
    products
WHERE
    price > ANY (SELECT 
            price
        FROM
            products
        WHERE
            id < 5);


SELECT 
    *
FROM
    products
WHERE
    price > ALL (SELECT 
            price
        FROM
            products
        WHERE
            id < 5);