/*
Client would like a query to pull total orders and revenue in a time period.
However they are not a "SQL Guru" so a procedure can help simply this process for them
to pull information and only indicate a start and end date.
*/

DROP PROCEDURE IF EXISTS order_performance;

DELIMITER //

CREATE PROCEDURE order_performance(IN startdate DATE, IN enddate DATE)
BEGIN
SELECT count(order_id) as total_orders,
	SUM(price_usd) as revenue
FROM orders
WHERE DATE(created_at) BETWEEN startdate AND enddate;

END//

DELIMITER ;

CALL order_performance('2013-11-01','2013-12-31');
