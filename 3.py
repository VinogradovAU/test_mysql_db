import os
import mysql.connector
import random

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

conn = mysql.connector.connect(                   # тут коннектимся к БД для загрузки данных в таблицы
    user='service_user',
    host='127.0.0.1',
    password='',
    database='db_car_service'
    )
cur = conn.cursor()

if conn.is_connected():
    print('Connected to MySQL database')

# надо задать модель авто для каждого клиента в талице cars_clients. В зависимости от брэнда авто. генерим
# случайное число от 1 до N, где N- количество моделей для конкретного брэнда.
# выведем таблицу с сгенерированным случайным номером модели для каждой марки авто.
query=[]
query.append("\
select \
cars_brand.id, count(*) AS \
count, \
(select floor(1+ RAND() * \
(select count(*) \
from cars_model where \
car_brand_id = cars_brand.id) \
)) AS \
rand_model_number \
from cars_model \
JOIN \
cars_brand \
ON cars_model.car_brand_id = cars_brand.id \
group by cars_model.car_brand_id;")

for q in query:
    cur.execute(q)
    res1 = cur.fetchall()
cur.execute('select id, brand_id from cars_clients;')
res2 = cur.fetchall()

#for key, k in enumerate(res1,0): #тестовый вывод

    #cur.execute(f'update cars_clients SET model_id ={k[2]} where {key+1}')
    # print(key,k, ' + ', res2[key]) # надо вставить правильные значения

for k in res2:  # тут берем производителя авто каждого пользователя
    for t in res1:
        if (k[1]==t[0]):  # тут находим этого же производителя в массиве с количеством моделей и со случайным числом
             cur.execute(f"UPDATE cars_clients SET model_id = {int(t[2])} WHERE id={k[0]};")  # тут пишем на чем ездит клиент слуйным числом

query=[]
query.append(f"select * from cars_clients limit 20;")
start_query(query)

#корректировка поля quantity_parts в таблице orders (слишком большие значения в некоторых строчках)
#тк. это поле количества запчастей для установки сделаем количество от 1 до 4 деталей в заказе
query=[]
query.append(f"UPDATE orders SET quantity_parts= FLOOR(1+ (RAND()* 4));")
start_query_without_result(query)

#Корректировка поля price в таблице work_list (слишком большие значения)
query=[]
query.append(f"UPDATE work_list SET price= ROUND((1+ (RAND()* 10000)),2);")
start_query_without_result(query)

#корректировка поля phone в таблицах personals и clients
query=[]
query.append(f"UPDATE personals SET phone=\
             CONCAT('8-90', FLOOR(RAND()*10), \
	'-',FLOOR(RAND()*10), FLOOR(RAND()*10), FLOOR(RAND()*10),\
    '-',FLOOR(RAND()*10), FLOOR(RAND()*10), FLOOR(RAND()*10),\
    '-',FLOOR(RAND()*10), FLOOR(RAND()*10));")
query.append(f"UPDATE clients SET phone=\
             CONCAT('8-90', FLOOR(RAND()*10), \
	'-',FLOOR(RAND()*10), FLOOR(RAND()*10), FLOOR(RAND()*10),\
    '-',FLOOR(RAND()*10), FLOOR(RAND()*10), FLOOR(RAND()*10),\
    '-',FLOOR(RAND()*10), FLOOR(RAND()*10));")
query.append(f"UPDATE manufacturers SET phone=\
             CONCAT('8-90', FLOOR(RAND()*10), \
	'-',FLOOR(RAND()*10), FLOOR(RAND()*10), FLOOR(RAND()*10),\
    '-',FLOOR(RAND()*10), FLOOR(RAND()*10), FLOOR(RAND()*10),\
    '-',FLOOR(RAND()*10), FLOOR(RAND()*10));")

#корректировка VIN и GOS номеров для авто с таблице cars_clients - UPPER()
query.append(f"UPDATE cars_clients SET vin_num = UPPER(vin_num);")
query.append(f"UPDATE cars_clients SET gos_number = UPPER(gos_number);")

start_query_without_result(query)




conn.commit()
#commit нужен для сохранения изменений. без него мы увидем изменения,
                       # но после close() они исчезнут
cur.close()
conn.close()