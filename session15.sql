USE ecsite;

DELIMITER $$
CREATE PROCEDURE avg_price()
BEGIN
	SELECT AVG(price) FROM products;
END$$
DELIMITER ;

CALL avg_price;

CALL avg_price();

DROP PROCEDURE avg_price;


DELIMITER $$
CREATE PROCEDURE users_info(IN input INT)
BEGIN
	SELECT * FROM users WHERE id = input;
END$$
DELIMITER ;

CALL users_info(5);

DROP PROCEDURE users_info;

DELIMITER $$
CREATE PROCEDURE users_info(IN input INT, OUT output varchar(255))
BEGIN
	SELECT email INTO output FROM users WHERE id = input;
END$$
DELIMITER ;

CALL users_info(1, @output);

SELECT @output;