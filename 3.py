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

#надо задать модель авто для каждого клиента в талице cars_clients. В зависимости от брэнда авто. генерим
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
for key, k in enumerate(res1,0):

    #cur.execute(f'update cars_clients SET model_id ={k[2]} where {key+1}')

    #тут я не доделал

    print(key,k, ' + ', res2[key]) # надо вставить правильные значения




#conn.commit()
#commit нужен для сохранения изменений. без него мы увидем изменения,
                       # но после close() они исчезнут
cur.close()
conn.close()