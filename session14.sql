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


SELECT * FROM product_reviews;

SELECT user_id FROM product_reviews WHERE product_id = 5;

SELECT 
    *
FROM
    users
WHERE
    id IN (SELECT 
            user_id
        FROM
            product_reviews
        WHERE
            product_id = 5)
ORDER BY users.id;


SELECT 
    DISTINCT users.*
FROM
    users
		INNER JOIN
	product_reviews ON product_reviews.user_id = users.id
WHERE
	product_id = 5;
    

SELECT 
    AVG(sub.sum), MIN(sub.sum), MAX(sub.sum)
FROM
    (SELECT 
        gender, SUM(amount) AS sum
    FROM
        order_details
    INNER JOIN orders ON orders.id = order_details.order_id
    INNER JOIN users ON users.id = orders.user_id
    GROUP BY users.gender) AS sub;


SELECT 
    *
FROM
    users
WHERE
    EXISTS( SELECT 
            *
        FROM
            product_reviews
        WHERE
            product_id = 7
                AND body LIKE '%disappointing%');


SELECT 
    *
FROM
    users
WHERE
    id IN(SELECT 
            user_id
        FROM
            product_reviews
        WHERE
            product_id = 7
                AND body LIKE '%disappointing%');


SELECT * FROM order_details;


SELECT 
    users.id,
    users.name,
    users.email,
    users.gender,
    users.birthday,
    SUM(products.price * order_details.amount) AS 'total price',
    SUM(products.price * order_details.amount * 1.10) AS 'tax include',
    COUNT(order_details.order_id) AS order_count
FROM
    users
        LEFT JOIN
    orders ON users.id = orders.user_id
        INNER JOIN
    order_details ON orders.id = order_details.order_id
        INNER JOIN
    products ON order_details.product_id = products.id
GROUP BY orders.user_id
HAVING SUM(amount * price) < (SELECT 
        SUM(price)
    FROM
        products)
ORDER BY users.id;


