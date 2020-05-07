#CREATE USER car_service_user IDENTIFIED WITH sha256_password BY 'password';
CREATE USER service_user;
GRANT ALL ON db_car_service.* TO service_user; 


DROP DATABASE IF EXISTS db_car_service;

#Создаем базу данных
CREATE DATABASE IF NOT EXISTS db_car_service;

#Переходим в базу данных
USE db_car_service;

#Создаем таблицу - personals - данные о персонале компании
DROP TABLE if exists personals;
CREATE TABLE IF NOT EXISTS personals (
	id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) COMMENT 'имя',
    last_name VARCHAR(100) COMMENT 'фамилия',
    position VARCHAR(100) COMMENT 'должность',
    phone VARCHAR(20) COMMENT 'номер телефона',
    email VARCHAR(200) COMMENT 'адрес электронной почты',
    address_id INT UNSIGNED COMMENT 'указатель на запись в таблице addresses',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    
) ENGINE=InnoDB;
CREATE INDEX personals_phone_idx ON personals(phone);
CREATE INDEX personals_last_name_idx ON personals(last_name);


#Создаем таблицу - clients - данные о клиентах компании
DROP TABLE if exists clients;
CREATE TABLE IF NOT EXISTS clients (
	id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL COMMENT 'имя',
    last_name VARCHAR(100) NOT NULL COMMENT 'фамилия',
    email VARCHAR(200) COMMENT 'адрес электронной почты',
    phone VARCHAR(20) COMMENT 'номер телефона',
    client_status_id INT UNSIGNED COMMENT 'указатель на запись в таблице statuses',
    cars_id INT UNSIGNED COMMENT 'указатель на запись в таблице cars_clients',
    address_id INT UNSIGNED COMMENT 'указатель на запись в таблице addresses',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
   
) ENGINE=InnoDB;
CREATE INDEX clients_email_idx ON clients(email);
CREATE INDEX clients_phone_idx ON clients(phone);
CREATE INDEX client_last_name_idx ON clients(last_name);




#Создаем таблицу - orders - заказ оборудования-услуг  
DROP TABLE if exists orders;
CREATE TABLE IF NOT EXISTS orders (
	id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
    description VARCHAR(250) NOT NULL COMMENT 'описание',
    client_id INT unsigned COMMENT 'указатель на запись в таблице clients',
    personal_id INT unsigned COMMENT 'указатель на запись в таблице personals',
    warehouse_id INT unsigned COMMENT 'указатель на запись в таблице warehouse',
    quantity_parts INT unsigned COMMENT 'уоличество деталей',
    order_status_id INT UNSIGNED COMMENT 'статус заказа - выволнен/нет и т.д.',
    order_type_id INT UNSIGNED COMMENT 'тип услуги',
    work_list_id INT UNSIGNED COMMENT 'вид работ',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    
) ENGINE=InnoDB;

#Создаем таблицу - orders_type - справочник типов заказа (услуга/продажа)
DROP TABLE if exists order_type;
CREATE TABLE IF NOT EXISTS order_type (
	id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
    name VARCHAR(100) COMMENT 'ремонт/обслуживание/продажа',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    
) ENGINE=InnoDB;

#Создаем таблицу - orders_statuses - справочник статусов
CREATE TABLE IF NOT EXISTS order_statuses (
	id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
    name VARCHAR(100) COMMENT 'in work/complited/pending',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    
) ENGINE=InnoDB;

#Создаем таблицу - clients_status - справочник статусов клиента (влияет, например, на скидки)
CREATE TABLE IF NOT EXISTS clients_status (
	id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
    name VARCHAR(100) COMMENT 'серебряный/gold/vip',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    
) ENGINE=InnoDB;

#Создаем таблицу - work_lists - список конкретных работ выполняемых персоналом
DROP TABLE if exists work_list;
CREATE TABLE IF NOT EXISTS work_list (
	id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
    name TEXT COMMENT 'описание работ',
    price INT UNSIGNED COMMENT 'цена единичной работы',
    cat_parts_id INT UNSIGNED COMMENT 'деталь из каталога к которой относится работа',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP  
) ENGINE=InnoDB;

#Создаем таблицу - cars_clients - данные о авто клиентов
DROP TAbLE IF EXISTS cars_clients;
CREATE TABLE IF NOT EXISTS cars_clients (
	id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
    client_id INT UNSIGNED COMMENT 'указатель на клиента',
    brand_id INT UNSIGNED COMMENT 'указатель за запись в таблице cars_brand',
    model_id INT UNSIGNED COMMENT 'указатель за запись в таблице cars_model',
    gos_number VARCHAR(20) NOT NULL COMMENT 'регистрационный номер',
    vin_num VARCHAR(20) NOT NULL COMMENT 'номер VIN по ПТС',
    year_car YEAR COMMENT 'год выпуска',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;
CREATE INDEX cars_clients_gos_number_idx ON cars_clients(gos_number);
CREATE INDEX cars_clients_vin_num_idx ON cars_clients(vin_num);

#Создаем таблицу - catigories - справочник категории в каталоге запчастей
DROP TAbLE IF EXISTS categories;
SELECT * FROM categories;

CREATE TABLE IF NOT EXISTS categories (
	id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
    name VARCHAR(100) COMMENT 'название категории',
    sub_cat_id INT UNSIGNED COMMENT 'указатель на id в этой же таблице - название подкатегории',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    ) ENGINE=InnoDB;
    
CREATE INDEX categories_name_idx ON categories(name);

#Создаем таблицу - warehouse - склад запчастей
DROP TABLE if exists warehouse;
CREATE TABLE IF NOT EXISTS warehouse (
	id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
    id_auto_parts INT UNSIGNED COMMENT 'код запчасти/детали',
    quantity_now INT UNSIGNED COMMENT 'количество на складе',
    price DECIMAL(10, 2) NOT NULL COMMENT 'цена за единицу товара',
    vendor_id INT UNSIGNED COMMENT 'поставщик',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

#Создаем таблицу - catalog_parts запчастей
DROP TABLE if exists catalog_parts;
CREATE TABLE IF NOT EXISTS catalog_parts (
	id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
    name VARCHAR(100) NOT NULL COMMENT 'название или марка детали/запчасти',
    descr_parts VARCHAR(300) COMMENT 'описание детали/запчасти',
    cat_id INT UNSIGNED COMMENT 'указатель на id в этой же таблице - название категории(подкатегории) в каталоге',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE INDEX catalog_parts_name_idx ON categories(name);

#Создаем таблицу - manufacturers - данные о поставщиках/производителях
DROP TAbLE IF EXISTS manufacturers;
SELECT count(*) FROM manufacturers;

CREATE TABLE IF NOT EXISTS manufacturers (
	id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
    name VARCHAR(100) COMMENT 'название компании поставщика',
    address_id INT UNSIGNED COMMENT 'указатель на запись в таблице addresses',
    phone VARCHAR(20) COMMENT 'номер телефона',
    email VARCHAR(100) COMMENT 'адрес электронной почты',
    contact_person VARCHAR(100) COMMENT 'контактное лицо',    
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    
) ENGINE=InnoDB;


CREATE INDEX manufacturers_name_idx ON manufacturers(name);

#Создаем таблицу - addresses - таблица с адресами (клиентов, поставщиков... и.т.д)
DROP TAbLE IF EXISTS addresses;
CREATE TABLE IF NOT EXISTS addresses (
	id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
    zipcode INT UNSIGNED COMMENT 'почтовый индекс',
    country VARCHAR(100) COMMENT 'страна/государство',
    region VARCHAR(100) COMMENT 'область/район',
    city VARCHAR(100) COMMENT 'город',
    street VARCHAR(100) COMMENT 'улица',
    house_num VARCHAR(100) COMMENT 'номер дома/строение',
    flat_num VARCHAR(100) COMMENT 'номер квартины/офиса',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    
) ENGINE=InnoDB;

CREATE INDEX addresses_zipcode_idx ON addresses(zipcode);
CREATE INDEX addresses_city_to_street_idx ON addresses (city, street);

#Создаем таблицу - cars_brand - справочник марок автомобилей
DROP TAbLE IF EXISTS cars_brand;
CREATE TABLE IF NOT EXISTS cars_brand (
	id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
    name VARCHAR(100) COMMENT 'название производитея автомобиля',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP    
) ENGINE=InnoDB;

select * from cars_brand;
select * from cars_model;
select max(car_brand_id) from cars_model;
select name from cars_model where car_brand_id=82;

#Создаем таблицу - cars_model - справочник моделей автомобилей
DROP TAbLE IF EXISTS cars_model;
CREATE TABLE IF NOT EXISTS cars_model (
	id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
    name VARCHAR(100) COMMENT 'название модели автомобиля',
    car_brand_id INT UNSIGNED NOT NULL COMMENT 'привязка к производителю',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

ALTER TABLE manufacturers
	ADD constraint manufacturers_address_id_fk
		foreign key (address_id) references addresses (id) ON delete set null;

ALTER TABLE cars_model
	ADD constraint cars_model_car_brand_id_fk
		foreign key (car_brand_id) references cars_brand (id) ON delete CASCADE;

ALTER TABLE personals
 ADD constraint personal_address_id_fk
	foreign key (address_id) references addresses (id) ON DELETE SET NULL;
    
ALTER table clients
	ADD constraint clients_address_id_fk
     FOREIGN KEY (address_id) REFERENCES addresses (id) ON DELETE SET NULL,
	ADD constraint clients_client_status_id_fk
     FOREIGN KEY (client_status_id) REFERENCES clients_status (id) ON DELETE SET NULL,
	ADD constraint clients_cars_id_fk
     FOREIGN KEY (cars_id) REFERENCES cars_clients (id) ON DELETE SET NULL;
     
ALTER table orders
	ADD constraint orders_client_id_fk
     FOREIGN KEY (client_id) REFERENCES clients (id) ON DELETE SET NULL,
	ADD constraint orders_personal_id_fk
     FOREIGN KEY (personal_id) REFERENCES personals (id) ON DELETE SET NULL,
	ADD constraint orders_warehouse_id_fk
     FOREIGN KEY (warehouse_id) REFERENCES warehouse (id) ON DELETE SET NULL,
	ADD constraint orders_order_status_id_fk
     FOREIGN KEY (order_status_id) REFERENCES order_statuses (id) ON DELETE SET NULL,
	ADD constraint orders_order_type_id_fk
     FOREIGN KEY (order_type_id) REFERENCES order_type (id) ON DELETE SET NULL,
	ADD constraint orders_work_list_id_fk
     FOREIGN KEY (work_list_id) REFERENCES work_list (id) ON DELETE SET NULL;
     
ALTER table work_list
	ADD constraint work_list_cat_parts_id_fk
     FOREIGN KEY (cat_parts_id) REFERENCES catalog_parts (id) ON DELETE SET NULL;
     
ALTER TABLE cars_clients
	ADD constraint cars_clientst_cars_brand_id_fk
		FOREIGN KEY (brand_id) REFERENCES cars_brand (id) ON DELETE SET NULL,
	ADD constraint cars_clients_cars_model_id_fk
		FOREIGN KEY (model_id) REFERENCES cars_model (id) ON DELETE SET NULL,
	ADD constraint cars_clients_clients_id_fk
		FOREIGN KEY (client_id) REFERENCES clients (id) ON DELETE CASCADE;
        
ALTER TABLE categories
	ADD constraint categories_sub_cat_id_fk
		foreign key (sub_cat_id) references categories (id) ON delete set null;
        
ALTER TABLE warehouse
	ADD constraint warehouse_id_auto_parts_fk
		foreign key (id_auto_parts) references catalog_parts (id) ON delete set null,
	ADD constraint warehouse_vendor_id_fk
		foreign key (vendor_id) references manufacturers (id) ON delete set null;
        
ALTER TABLE catalog_parts
	ADD constraint mcatalog_parts_cat_id_fk
		foreign key (cat_id) references categories (id) ON delete set null;
