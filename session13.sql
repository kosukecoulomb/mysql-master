USE ecsite;

CREATE VIEW user_list AS
	SELECT * FROM users;

SELECT * FROM user_list;

CREATE VIEW order_list AS
	SELECT 
		users.id,
		users.name,
		users.email,
		users.gender,
		users.birthday,
		COUNT(order_id) AS order_count,
		SUM(order_details.amount * products.price) AS 'total_price',
		ROUND(SUM(order_details.amount * products.price * 1.10)) AS 'tax include'
	FROM
		users
			LEFT JOIN
		orders ON users.id = orders.user_id
			INNER JOIN
		order_details ON order_details.order_id = orders.id
			INNER JOIN
		products ON order_details.product_id = products.id
	GROUP BY users.id
	ORDER BY users.id;

SELECT * FROM order_list;

DROP VIEW order_list;