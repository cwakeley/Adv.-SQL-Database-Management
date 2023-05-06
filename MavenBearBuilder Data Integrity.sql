/*Help is needed updating the structure of the order_items table. 
The company is going to start cross-selling products, and will want to track 
whether each item sold is the primary item (the first one put into the user’s shopping cart) 
or a cross-sold item. Add a binary column to order_items called is_primary_item. 
*/

ALTER TABLE order_item
ADD is_primary_item INT;


/* Update all previous records in the order_items table, setting is_primary_item = 1 
all records. Up until now, all items sold were the primary item (cross-selling is new). 
Confirm this change has executed successfully. 
*/ 

UPDATE order_items
SET is_primary_item = 1
WHERE order_item_id > 0;

/* Add two new products to the products table importing as "Birthday Panda" and
"Hudson River Mini Bear" with "created_at" dates as "2013-12-12 09:00:00" and
"2014-02-05 10:00:00" */

INSERT INTO products VALUES
(3, '2013-12-12 09:00:00', "Birthday Panda")
(4, '2014-02-05 10:00:00', "Hudson River Mini Bear")


/* CEO would like help making sure the database has a high degree of data integrity 
and bad data doesn’t start creeping in as more people start using the database. 
If you see any opportunities to ensure data integrity by using constrains like NON-NULL, 
add them to the relevant columns in the tables you have created . 
*/ 

ALTER TABLE `mavenbearbuilders`.`products` 
CHANGE COLUMN `created_at` `created_at` DATETIME NOT NULL ,
CHANGE COLUMN `product_name` `product_name` VARCHAR(120) NOT NULL ,
ADD UNIQUE INDEX `product_name_UNIQUE` (`product_name` ASC) VISIBLE;
;
ALTER TABLE `mavenbearbuilders`.`order_items` 
DROP FOREIGN KEY `order_item_product_id`;
ALTER TABLE `mavenbearbuilders`.`order_items` 
CHANGE COLUMN `created_at` `created_at` DATETIME NOT NULL ,
CHANGE COLUMN `order_id` `order_id` BIGINT NOT NULL ,
CHANGE COLUMN `price_usd` `price_usd` DECIMAL(6,2) NOT NULL ,
CHANGE COLUMN `cogs_usd` `cogs_usd` DECIMAL(6,2) NOT NULL ,
CHANGE COLUMN `website_session_id` `website_session_id` BIGINT NOT NULL ,
CHANGE COLUMN `product_id` `product_id` BIGINT NOT NULL ,
CHANGE COLUMN `is_primary_item` `is_primary_item` INT NOT NULL ;
ALTER TABLE `mavenbearbuilders`.`order_items` 
ADD CONSTRAINT `order_item_product_id`
  FOREIGN KEY (`product_id`)
  REFERENCES `mavenbearbuilders`.`products` (`product_id`);
;
ALTER TABLE `mavenbearbuilders`.`order_item_refunds` 
DROP FOREIGN KEY `order_item_refunds_ibfk_1`;
ALTER TABLE `mavenbearbuilders`.`order_item_refunds` 
CHANGE COLUMN `created_at` `created_at` DATETIME NOT NULL ,
CHANGE COLUMN `order_item_id` `order_item_id` BIGINT NOT NULL ,
CHANGE COLUMN `order_id` `order_id` BIGINT NOT NULL ,
CHANGE COLUMN `refund_amount_usd` `refund_amount_usd` DECIMAL(6,2) NOT NULL ,
ADD UNIQUE INDEX `order_item_id_UNIQUE` (`order_item_id` ASC) VISIBLE;
;
ALTER TABLE `mavenbearbuilders`.`order_item_refunds` 
ADD CONSTRAINT `order_item_refunds_ibfk_1`
  FOREIGN KEY (`order_item_id`)
  REFERENCES `mavenbearbuilders`.`order_items` (`order_item_id`);

