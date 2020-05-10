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
    

# необходимо задать модель авто для каждого клиента в талице cars_clients. В зависимости от брэнда авто. генерим 
# случайное число от 1 до N, где N- количество моделей для конкретного брэнда. 
# выведем таблицу с сгенерированным случайным номером модели для каждой марки авто. 

select cars_brand.name, cars_brand.id AS brand_id, count(*) AS count_models,
(select floor(1+ RAND() * 
(select count(*) from cars_model where car_brand_id= cars_brand.id)
)) AS rand_model_number
 	from cars_model
    JOIN cars_brand
    ON cars_model.car_brand_id=cars_brand.id
    group by cars_model.car_brand_id;
    
#генератор номера телефона    
select CONCAT('8-90', FLOOR(RAND()*10), 
	'-',FLOOR(RAND()*10), FLOOR(RAND()*10), FLOOR(RAND()*10),
    '-',FLOOR(RAND()*10), FLOOR(RAND()*10), FLOOR(RAND()*10),
    '-',FLOOR(RAND()*10), FLOOR(RAND()*10)) AS phone;
    
#корректировка VIN номер - UPPER()
UPDATE cars_clients SET vin_num = UPPER(vin_num);
UPDATE cars_clients SET gos_number = UPPER(gos_number);
SELECT * FROM cars_clients;

#проверка тригера upper_vin_gos_nums_carts_clients
insert into cars_clients 
	(client_id, brand_id, model_id, gos_number, vin_num, year_car) 
    VALUES
    (1,3,2, 'a 177aa 777', 'lkjh3458dhfnjc7hhs', 2020);
select * from cars_clients order by id DESC limit 10;

# расчет поля sum_sum таблицы orders для одной стройки
SELECT
	(SELECT quantity_parts FROM db_car_service.orders WHERE id = 1) *
		(SELECT price FROM db_car_service.warehouse WHERE id = 
			(SELECT warehouse_id FROM db_car_service.orders WHERE id=1))       
        + 
			(SELECT price FROM db_car_service.work_list WHERE id = (SELECT work_list_id FROM db_car_service.orders WHERE id=1)) AS sum_sum;
    
#проверка тригера insert_data_in_orders
insert into orders 
	(description, client_id, personal_id, warehouse_id, quantity_parts, order_status_id, order_type_id, work_list_id)
	VALUES
    ('тестовая строчка insert для расчета поля sum_sum',
    1,6,6457,2,2,2,108);
SELECT * FROM orders order by id desc limit 5;

#проверка тригера update_data_in_orders
update orders SET client_id = 2 where id = 2;

# апдейт всех строк в таблице для перерасчета sum_sum
#update orders SET id = id; 

select count(*) AS count_null FROM orders where sum_sum IS NULL;
select count(*) AS count_not_null FROM orders where sum_sum IS NOT NULL;


SELECT * FROM orders limit 5;

SET @a:=0;
SELECT nnn.name FROM 
		(SELECT @a:=@a+1 AS i_id, name 
							from cars_model where car_brand_id = 3) AS nnn 
					WHERE nnn.i_id=10;
                    
SELECT @a:=@a+1 AS i_id, name from cars_model where car_brand_id = 3;