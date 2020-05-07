USE db_car_service;
show tables;
SELECT * FROM addresses LIMIT 205;
SELECT * FROM cars_brand LIMIT 100;
SELECT * FROM cars_clients LIMIT 10;
SELECT * FROM cars_model LIMIT 10;
SELECT * FROM catalog_parts LIMIT 10;
SELECT * FROM categories LIMIT 10;
SELECT * FROM clients LIMIT 10;
SELECT * FROM clients_status LIMIT 10;
SELECT * FROM manufacturers LIMIT 10;
SELECT * FROM order_statuses LIMIT 10;
SELECT * FROM order_type LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM personals order by address_id LIMIT 101;
SELECT * FROM warehouse LIMIT 10;
SELECT * FROM work_list LIMIT 10;
SELECT * FROM manufacturers;
SELECT * FROM cars_clients;

SELECT * FROM manufacturers_2;           #временная таблица сгенерировала на сайте http://filldb.info/
update manufacturers, manufacturers_2 SET 
	  manufacturers.address_id = manufacturers_2.address_id,
      manufacturers.phone = manufacturers_2.phone,
      manufacturers.email = manufacturers_2.email,
      manufacturers.contact_person = manufacturers_2.contact_person    
      where manufacturers.id = manufacturers_2.id;
      
DROP table manufacturers_2;