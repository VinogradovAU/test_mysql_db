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

# необходимо задать модель авто для каждого клиента в таблице cars_clients. 

select * from cars_clients;

UPDATE cars_clients SET model_id = 
(SELECT id FROM cars_model ORDER BY RAND() LIMIT 1);

#задаем брэнд автомобиля в таблице cars_client зная модел авто.
select * from cars_model limit 10;

 UPDATE cars_clients SET brand_id =  
(SELECT car_brand_id FROM cars_model WHERE id=cars_clients.model_id);
    
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


# код ниже позволяет определить модель авто киента
SET @a:=0;
SELECT nnn.name FROM 
		(SELECT @a:=@a+1 AS i_id, name 
							from cars_model where car_brand_id = 3) AS nnn 
					WHERE nnn.i_id=10;
                    
SELECT @a:=@a+1 AS i_id, name from cars_model where car_brand_id = 3;

# ОСНОВНЫЕ ЗАПРОСЫ

# Запрос выводит имя клиента, описание заказа, сумму заказа, статус заказа и имя работника (из персонала).
select 
	CONCAT(c.first_name," ",c.last_name) AS name, 
    o.description AS descript, 
    o.sum_sum, 
    ord.name, 
    CONCAT (p.first_name," ",p.last_name) AS Personal
	
    from orders AS o
    JOIN clients AS c
    ON o.client_id=c.id
    JOIN order_statuses AS ord
    ON ord.id=o.order_status_id
    JOIN personals AS p
    ON p.id=o.personal_id
    order by name;
    
# Обновим поле sum_sum для всех записей с помощью триггера, котовый сработает при обновлении таблицы orders.
update orders SET description=description;    

# Запрос выводит имя клиента, описание заказа, сумму заказа, статус заказа и имя работника (из персонала). 
# ВСЕ ЗАКАЗЫ со статусом исполнения - ожидание (pending) 
    
select 
	CONCAT(c.first_name," ",c.last_name) AS name, 
    o.description AS descript, 
    o.sum_sum, 
    ord.name, 
    CONCAT (p.first_name," ",p.last_name) AS Personal
	
    from orders AS o
    JOIN clients AS c
    ON o.client_id=c.id
    JOIN order_statuses AS ord
    ON ord.id=o.order_status_id
    JOIN personals AS p
    ON p.id=o.personal_id
    WHERE ord.name='pending'
    order by name;
    
    # представление №1 
    
    CREATE VIEW v_orders AS 
		select 
			CONCAT(c.first_name," ",c.last_name) AS name,  #имя клиента
			o.description AS descript, # описание заказа
			cat_par.name AS 'code', #код запчасти
			cat_par.descr_parts AS 'Описание', # название детали/запчасти
			war.price, # цена детали
			o.quantity_parts AS 'кол-во', # количество устанавливаемых деталей
			w.name AS 'вид работ', # выполняема я работа 
			w.price AS 'цена ед. работы', # цена работы
			o.sum_sum AS 'Всего', # общая сумма заказа
			ord.name AS 'Статус заказа', # статус заказа
			CONCAT (p.first_name," ",p.last_name) AS 'Ответственный'  # исполнитель работ 
        	
			from orders AS o
			JOIN clients AS c
			ON o.client_id=c.id
			JOIN order_statuses AS ord
			ON ord.id=o.order_status_id
			JOIN personals AS p
			ON p.id=o.personal_id
			JOIN warehouse AS war
			ON war.id=o.warehouse_id
			JOIN catalog_parts AS cat_par
			ON cat_par.id=war.id_auto_parts
			JOIN work_list AS w
			ON w.id=o.work_list_id
        
			order by name; 

# представление №2

CREATE VIEW v_clients AS 
select
	CONCAT(c.first_name," ",c.last_name) AS name,
    (select name from cars_brand where id = car.brand_id) AS Auto_Brand,
    (SELECT name FROM cars_model where id=car.model_id) AS model,
    car.gos_number,
    car.vin_num,
    c.email,
    c.phone,
    c_stat.name AS 'status',
    CONCAT (
		adr.zipcode, ", ",
        adr.region,", ",
        adr.city,", ",
        adr.street,", ",
        adr.house_num," - ",
        adr.flat_num) AS address
        
	from clients AS c
    JOIN cars_clients AS car
    ON c.id = car.client_id
    JOIN clients_status AS c_stat
	ON c_stat.id=client_status_id
    JOIN addresses AS adr
    ON adr.id=c.address_id
    order by name; 
    
    select * from v_clients limit 10;
    
# количество автомобилей у клиента
select count(*) AS count_auto, CONCAT(c.first_name," ",c.last_name) AS name 
	from clients AS c
	JOIN cars_clients AS car
    ON c.cars_id = car.client_id
    group by name
    order by count_auto DESC
    limit 10;
    
# все автомобили клиента
SELECT * from v_clients ;

#клиенты у которых больше 1 автомобиля
select * from 
(select count(*) AS count_auto, CONCAT(c.first_name," ",c.last_name) AS name 
	from clients AS c
	JOIN cars_clients AS car
    ON c.id = car.client_id
    group by name
    order by count_auto DESC) AS cc
where
	cc.count_auto > 1;
    
select * from cars_clients limit 10;
    
    
    