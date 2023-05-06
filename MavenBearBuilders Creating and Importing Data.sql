#Client would like to import data into their database

CREATE SCHEMA mavenbearbuilders;

USE mavenbearbuilders;

CREATE TABLE order_items(
	order_item_id BIGINT,
    created_at DATETIME,
    order_id BIGINT,
    price_usd DECIMAL(6,2),
    cogs_usd DECIMAL(6,2),
    website_session_id BIGINT,
    PRIMARY KEY(order_item_id)
    )

#Use Import Wizard to import tables CSV files "order_items_2012_march" and "order_items_2012_April"

#Create table to import refunds from April

CREATE TABLE order_item_refunds (
	order_item_refund_id BIGINT,
    created_at DATETIME,
    order_item_id  BIGINT,
    order_id BIGINT,
    refund_amount_usd DECIMAL(6,2),
    PRIMARY KEY (order_item_refund_id),
    FOREIGN KEY (order_item_id) REFERENCES order_items(order_item_id)
);

#Import CSV file "order_item_refunds_2012_April"

/*Scenario: Some data tables had information imported incorrectly.
Some records were flagged as 'refunds' instead of customer inqueries.
Remove order_items 131, 132, 145, 151, and 153 to clean data added in error*/

#Query created was used to delete data using the PK
DELETE FROM order_item_refunds
WHERE order_item_refund_id BETWEEN 6 AND 10


/* Business finished strong in 2012, import additional data for rest of the year for
both 'order_items' and 'order_item_refunds' */
