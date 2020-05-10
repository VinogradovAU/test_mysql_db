import os
import mysql.connector
import random

# функция выполняет обращение к БД для получения данных. на входе массив с запросами
def start_query(query):
    for q in query:
        try:
            cur.execute(q)
            res = cur.fetchall()
            for i in res:
                print(i)
        except Exception:
            print('Ошибка в запросе:', f"cur.execute({q})")
            exit()

# функция выполняет обращение к БД для выполнения команд без вывода результата
def start_query_without_result(query):
    for q in query:
        try:
            cur.execute(q)
        except Exception:
            print('Ошибка в запросе:', f"cur.execute({q})")
            exit()

def hello():
    print("Hello from function.py module")

if __name__ == "__main__":
    print("Hello from function.py module")