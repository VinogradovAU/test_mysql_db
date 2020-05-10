
#триггеры приводят вставляемые или обновляемые данные gos и VIN номеров в таблицу cars_clients к веррхнему регистру 
DELIMITER //
DROP TRIGGER IF EXISTS upper_vin_gos_nums_carts_clients//
CREATE TRIGGER upper_vin_gos_nums_carts_clients BEFORE INSERT ON db_car_service.cars_clients
FOR EACH ROW
BEGIN
	SET NEW.vin_num = UPPER(NEW.vin_num);
    SET NEW.gos_number = UPPER(NEW.gos_number);
END//
DELIMITER ;

DELIMITER //
DROP TRIGGER IF EXISTS update_vin_gos_nums_carts_clients//
CREATE TRIGGER update_vin_gos_nums_carts_clients BEFORE UPDATE ON db_car_service.cars_clients
FOR EACH ROW
BEGIN
	SET NEW.vin_num = UPPER(NEW.vin_num);
    SET NEW.gos_number = UPPER(NEW.gos_number);
END//
DELIMITER ;

# тригер считает стоимость деталей в заказе + стоимость работ и вписывает в sum_sum таблицы Orders
DELIMITER //
DROP TRIGGER IF EXISTS insert_data_in_orders//
CREATE TRIGGER insert_data_in_orders BEFORE INSERT ON db_car_service.orders
FOR EACH ROW
BEGIN
	SET @XX = (SELECT price FROM db_car_service.warehouse WHERE id = NEW.warehouse_id);
    SET @YY = (SELECT price FROM db_car_service.work_list WHERE id = NEW.work_list_id); 
	SET NEW.sum_sum = NEW.quantity_parts * @XX + @YY;
END//
DELIMITER ;

DELIMITER //
DROP TRIGGER IF EXISTS update_data_in_orders//
CREATE TRIGGER update_data_in_orders BEFORE UPDATE ON db_car_service.orders
FOR EACH ROW
BEGIN
	SET @XX = (SELECT price FROM db_car_service.warehouse WHERE id = NEW.warehouse_id);
    SET @YY = (SELECT price FROM db_car_service.work_list WHERE id = NEW.work_list_id); 
	SET NEW.sum_sum = NEW.quantity_parts * @XX + @YY;
END//
DELIMITER ;

# процедура проверки таблицы orders на наличие строчек с полем sum_sum в состоянии NULL

DROP PROCEDURE IF EXISTS user_info;

DELIMITER //
CREATE PROCEDURE user_info(IN l_name VARCHAR(100), IN f_name VARCHAR(100))
BEGIN
	SET @name = (SELECT CONCAT(first_name," ", last_name) from clients where last_name=l_name AND first_name=f_name ); 
       
    IF (@name IS NULL) THEN
			SELECT CONCAT(f_name,' ', l_name, ' name not found') AS name;
	else
			SET @id = (SELECT id from clients where first_name=f_name AND last_name=l_name);
			SET @status_id = (SELECT client_status_id from clients where first_name=f_name AND last_name=l_name);
            SET @cars_id = (SELECT cars_id from clients where first_name=f_name AND last_name=l_name);
            SET @name_status = (SELECT name from clients_status where id = @id);
            SET @car_brand_id = (SELECT brand_id FROM cars_clients where id=@cars_id);
            SET @car_model_id = (SELECT model_id FROM cars_clients where id=@cars_id);
            SET @lim = (@car_model_id - 1);
            SET @car_brand = (SELECT name from cars_brand where id = @car_brand_id); 
			
            #тут ошибка!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
            SET @car_model = (SELECT name from cars_model where car_brand_id = @car_brand_id LIMIT @lim, 1);
            
            
            SET @status_name = (SELECT name FROM clients_status where id=@status_id);
			SELECT @name AS full_name, @status_name AS status, @car_name AS car, @cars_id , @car_brand_id, @car_model_id;
	END IF;
	END //
DELIMITER ;

call user_info('Lang','Ima');
call user_info('Ima');
call user_info('');





