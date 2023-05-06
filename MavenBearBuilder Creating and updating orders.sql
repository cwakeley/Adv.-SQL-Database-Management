/*

Create a table to capture order_id, a created_at time stampe, website_session_id, primary product_id
number of items purchased, price and cogs in USD. Also back-popuilate table using records from order_items table.

*/

CREATE TABLE orders (
	order_id BIGINT,
    created_at DATETIME,
    website_sessions_id BIGINT,
    primary_product_id BIGINT,
    items_purchased BIGINT,
    price_usd DECIMAL(6,2),
    cogs_usd DECIMAL(6,2),
    PRIMARY KEY(order_id)
    


);
INSERT INTO orders
SELECT 
	order_id,
    MIN(created_at) AS created_at,
    MIN(website_session_id) AS website_session_id,
    SUM(CASE
		WHEN is_primary_item = 1 THEN product_id
        ELSE NULL
        END) AS primary_product_id,
	COUNT(order_item_id) AS items_purchase,
    SUM(price_usd) as price_usd,
    SUM(cogs_usd) as cogs_usd
FROM order_items
GROUP BY 1
ORDER BY 1;
