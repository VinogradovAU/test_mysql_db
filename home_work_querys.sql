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

#заполняем поле cars_id в таблие clients - указывает строку в таблице cars_clients (а там авто клиента)
update clients, cars_clients SET 
	clients.cars_id=cars_clients.id 
    WHERE clients.id=cars_clients.client_id;
    

#надо задать модель авто для каждого клиента в талице cars_clients. В зависимости от брэнда авто. генерим 
# случайное число от 1 до N, где N- количество моделей для конкретного брэнда. 
# выведем таблицу с сгенерированным случайным номером модели для каждой марки авто. 

select cars_brand.name, count(*) AS count,
(select floor(1+ RAND() * 
(select count(*) from cars_model where car_brand_id= cars_brand.id)
)) AS rand_model_number
 
	from cars_model
    JOIN cars_brand
    ON cars_model.car_brand_id=cars_brand.id
    group by cars_model.car_brand_id;
    
    


