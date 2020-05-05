import os
import mysql.connector
path = '/home/ezh/mysql_lessons/csv.csv'   # тут список база данных автомобилей
mass_vendor=[]
with open(path, 'r') as f:
    k=0
    data = f.readlines()
    for line in data:
        line = line.split(';')
        mass_vendor.append(line[0])
        #print(line[0], end='')
        #k=k+1
        #if (k==10):
        #   break

print('',end='\n')
#print(mass_vendor)
#print(set(mass_vendor))
mass_vendor=list(set(mass_vendor))        # тут получаем список только марок автомобилей без дубликатов
#print('len mass= ', len(mass_vendor))
for k in mass_vendor:
    print(k)

all_mass={}

for nn in mass_vendor:
    mm=[]
    for line in data:
        line = line.split(';')
        if (nn==line[0]):
            mm.append(line[1])
        #print(line[0],line[1])
    all_mass[nn]=mm                              # тут весь массив из БД автомобилей из файла построчно
                                                 # разбит через ';'

for k in mass_vendor:
    print(all_mass[k])

conn = mysql.connector.connect(                   # тут коннектимся к БД для загрузки данных в таблицы
    user='service_user',
    host='127.0.0.1',
    password='',
    database='db_car_service'
    )
cur = conn.cursor()

if conn.is_connected():
    print('Connected to MySQL database')


query = (f"DELETE FROM cars_brand;")
cur.execute(query)
query = (f"ALTER TABLE cars_brand AUTO_INCREMENT=0;")
cur.execute(query)
query = (f"DELETE FROM cars_model;")
cur.execute(query)
query = (f"ALTER TABLE cars_model AUTO_INCREMENT=0;")
cur.execute(query)


#num=0
for key, mass_v in enumerate(mass_vendor,1):
    #num=num+1
    query = (f"insert into cars_brand (name) VALUES ('{mass_v}');")     # пишу в таблицу марку авто
    cur.execute(query)
    i = all_mass[mass_v]
    if (len(i)>1):
        for jj in i:
            query = (f"insert into cars_model (name, car_brand_id) VALUES ('{jj}', {key});")   # пишу в таблицу модели в соответствии с маркой
            cur.execute(query)
    else:
        query = (f"insert into cars_model (name, car_brand_id) VALUES ('{i[0]}', {key});")        # пишу в таблицу модель в соответствии с маркой
        cur.execute(query)                                                                     # если она была только одна в исходной базе/файле

    #if (num==10):
     #   break

query = (f"SELECT * FROM cars_brand LIMIT 10;")        # вывод для проверки
cur.execute(query)
res = cur.fetchall()

for i in  res:
    print(i)

query = (f"SELECT * FROM cars_model LIMIT 40;")        # вывод для проверки
cur.execute(query)
res = cur.fetchall()

for i in res:
    print(i)

conn.commit()          # commit нужен для сохранения изменений. без него мы увидем изменения,
                       # но после close() они исчезнут
cur.close()
conn.close()







