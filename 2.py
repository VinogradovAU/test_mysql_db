import os
import mysql.connector
import random


'''
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

CREATE TABLE IF NOT EXISTS catalog_parts (
	id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
    name VARCHAR(100) NOT NULL COMMENT 'название или марка детали/запчасти',
    descr_parts VARCHAR(300) COMMENT 'описание детали/запчасти',
    cat_id INT UNSIGNED COMMENT 'указатель на id в этой же таблице - название подкатегории',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS categories (
	id INT UNSIGNED NOT NULL auto_increment PRIMARY KEY,
    name VARCHAR(100) COMMENT 'название категории',
    sub_cat_id INT UNSIGNED COMMENT 'указатель на id в этой же таблице - название подкатегории',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    ) ENGINE=InnoDB;

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

'''

# функция выполняет обращение к БД для получения данных. на входе массив с запросами
def start_query(query):
    for q in query:
        cur.execute(q)
        res = cur.fetchall()
        for i in res:
            print(i)

# функция выполняет обращение к БД для выполнения команд без вывода результата
def start_query_without_result(query):
    for q in query:
        cur.execute(q)

path = '/home/ezh/mysql_lessons/parts/csv_parts.csv'   # тут список автозапчастей
mass_parts=[]
with open(path, 'r',  encoding='windows-1251') as f:
    k=0
    data = f.readlines()
    for line in data:
        line = line.split(';')
        mass_parts.append(line[0])
        #print(line[0])
        #k=k+1
        #if (k==10):
          # break

mass_parts=list(set(mass_parts))        # тут получаем список производителей без дубликатов
#for k in mass_parts:
#    print(k)
#print(len(mass_parts))                    # 103 производителя - будем их писать в отдельную таблицу



mm = []
for line in data:
    line = line.split(';')
    mm.append(line[2])  # тут все описания деталей с одинаковыми описаниями

mm = set(mm) # тут описания для деталей конкретного производителя без повторных деталей

all_mm=[]
error_count=0
for nn in mass_parts:

    for line in data:
        line = line.split(';')
        rr = 0
        if (nn==line[0]):
            if (line[2] in mm):
                try:
                    float(line[3])
                except Exception:
                    error_count = error_count + 1
                else:
                    all_mm.append([line[1], random.randint(0,100), line[3], line[0], line[2]])
                    mm.remove(line[2])

vendor = []              # массив поставщиков
for k in all_mm:
    vendor.append(k[3])
    #print(k[3])

vendor = list(set(vendor)) # убрали дубли
for k in vendor:
    print(vendor.index(k),k)
print('всего поставщиков/производителей: ', len(vendor))

print('всего записей по запчастям: ', len(all_mm))
print('Ошибок форматирования исходного файла csv_parts.csv: ', error_count)

conn = mysql.connector.connect(                   # тут коннектимся к БД для загрузки данных в таблицы
    user='service_user',
    host='127.0.0.1',
    password='',
    database='db_car_service'
    )
cur = conn.cursor()

if conn.is_connected():
    print('Connected to MySQL database')

query=[]                                                        # ниже готовим таблицы для новых загрузок, т.к. ошибок много
query.append(f"DELETE FROM warehouse;")                     # и этот скрипт запускался не однократно
query.append(f"ALTER TABLE warehouse AUTO_INCREMENT=0;")
query.append(f"DELETE FROM manufacturers;")
query.append(f"ALTER TABLE manufacturers AUTO_INCREMENT=0;")
query.append(f"DELETE FROM catalog_parts;")
query.append(f"ALTER TABLE catalog_parts AUTO_INCREMENT=0;")
query.append(f"DELETE FROM categories;")
query.append(f"ALTER TABLE categories AUTO_INCREMENT=0;")
query.append(f"DELETE FROM order_type;")
query.append(f"ALTER TABLE order_type AUTO_INCREMENT=0;")
query.append(f"DELETE FROM order_statuses;")
query.append(f"ALTER TABLE order_statuses AUTO_INCREMENT=0;")
query.append(f"DELETE FROM clients_status;")
query.append(f"ALTER TABLE clients_status AUTO_INCREMENT=0;")

start_query_without_result(query) # выполняем команды выше


#заполняю таблицу поставщиков названиями фирм поставщиков/производителей

for k in vendor:
    y0 = k.replace("\'", "")  # убираю спецсимвол из строчки
    query = (f"insert into manufacturers (name) VALUES ('{y0}');")  # пишу в таблицу поставщиков
    try:
        cur.execute(query)
    except Exception:
        print('Ошибка в запросе:', f"insert into manufacturers (name) VALUES ({y0});")
        exit()


for key, k in enumerate(all_mm, 1):

    try:
        query = (f"insert into warehouse (id_auto_parts,\
                 quantity_now,\
                 price,\
                vendor_id)\
                 VALUES ('{key}', '{int(k[1])}', {float(k[2])}, { vendor.index(k[3]) + 1 });")  # пишу в таблицу warehouse - склад

    except Exception:
        print('Ошибка в запросе:', f"insert into warehouse (id_auto_parts, \
                quantity_now,\
                price,\
                vendor_id) VALUES \
                ('{key}', '{int(k[1])}', {float(k[2])}, {key});")
        exit()
    cur.execute(query)



    y1 = k[0].replace("\'","")                                      # убираю спецсимвол из строчки

    #массив для 3-х диапазонов случайных сисел. Соответствуют номерам подкатегорий в таблице categories
    rr = []
    rr.append(random.randint(2, 5))
    rr.append(random.randint(7, 10))
    rr.append(random.randint(12, 15))

    rand_int = rr[random.randint(0, 2)]

    # пишу шифр детали - name, описание - descr, категорию - cat_id в таблицу catalog_parts
    query = (f"insert into catalog_parts (name, descr_parts, cat_id) VALUES ('{y1}', '{k[4]}', {rand_int});")
    cur.execute(query)

query = ("insert into categories (name, sub_cat_id) VALUES ('Категория номер 1',0); \
         insert into categories (name, sub_cat_id) VALUES ('Подкатегория номер 1.1',1); \
         insert into categories (name, sub_cat_id) VALUES ('Подкатегория номер 1.2',1); \
         insert into categories (name, sub_cat_id) VALUES ('Подкатегория номер 1.3',1); \
         insert into categories (name, sub_cat_id) VALUES ('Подкатегория номер 1.4',1); \
         insert into categories (name, sub_cat_id) VALUES ('Категория номер 2',0); \
         insert into categories (name, sub_cat_id) VALUES ('Подкатегория номер 2.1',6); \
         insert into categories (name, sub_cat_id) VALUES ('Подкатегория номер 2.2',6); \
         insert into categories (name, sub_cat_id) VALUES ('Подкатегория номер 2.3',6); \
         insert into categories (name, sub_cat_id) VALUES ('Подкатегория номер 2.4',6); \
         insert into categories (name, sub_cat_id) VALUES ('Категория номер 3',0); \
         insert into categories (name, sub_cat_id) VALUES ('Подкатегория номер 3.1',11); \
         insert into categories (name, sub_cat_id) VALUES ('Подкатегория номер 3.2',11); \
         insert into categories (name, sub_cat_id) VALUES ('Подкатегория номер 3.3',11); \
         insert into categories (name, sub_cat_id) VALUES ('Подкатегория номер 3.4',11); \
         ")

for result in cur.execute(query, multi=True):
    pass

# заполняем таблицу order_type, order_statuses и clients_statuses
query=[]
query.append(f"insert into order_type (name) VALUES ('sale');")             # тип заказа - продажа
query.append(f"insert into order_type (name) VALUES ('service');")          # тип заказа - услуга/обслуживание/ремонт
query.append(f"insert into order_statuses (name) VALUES ('in work');")      # статус - в работе
query.append(f"insert into order_statuses (name) VALUES ('completed');")    # статус - завершено
query.append(f"insert into order_statuses (name) VALUES ('pending');")      # статус - отложен/в ожидании
query.append(f"insert into clients_status (name) VALUES ('wooden');")      # статус клиента - деревянный
query.append(f"insert into clients_status (name) VALUES ('silver');")      # статус клиента - серебро
query.append(f"insert into clients_status (name) VALUES ('gold');")      # статус клиента - золото
query.append(f"insert into clients_status (name) VALUES ('vip');")      # статус клиента - "очень важный"

start_query_without_result(query)

# функция вывода данных из таблиц для проверки
def test_query():

    query=[]
    query.append(f"SELECT * FROM warehouse LIMIT 10;")        # вывод для проверки таблицы - СКЛАД
    query.append(f"SELECT * FROM manufacturers LIMIT 10;")        # вывод для проверки таблицы поставщиков
    query.append(f"SELECT * FROM catalog_parts LIMIT 10;")        # вывод для проверки таблицы каталог запчастей
    query.append(f"SELECT * FROM categories;")        # вывод для проверки таблицы категорий автозапчастей
    query.append(f"SELECT * FROM order_type;")  # вывод для проверки таблицы тип заказа
    query.append(f"SELECT * FROM order_statuses;")  # вывод для проверки таблицы состояние заказа
    query.append(f"SELECT * FROM clients_status;")  # вывод для проверки таблицы состояние заказа
    start_query(query)



test_query() # функция вывода данных из таблиц для проверки
conn.commit()
#commit нужен для сохранения изменений. без него мы увидем изменения,
                       # но после close() они исчезнут
cur.close()
conn.close()