import psycopg2 # pip install pyscopg2
import pandas as pd

con=psycopg2.connect(
    host='localhost',
    database='saturn',
    user='postgres',
    password='1234'
)

print(con)

cur=con.cursor()

# select command
cur.execute('select flavor, calories, fat_g from benjerry limit 5;')
print(cur.fetchall())

# create table
cur.execute('drop table if exists yum;')
cur.execute('create table yum (id serial primary key, menu varchar, price int);')
cur.execute('insert into yum(menu, price) values (%s, %s)', ('water', 15))
cur.execute('select * from yum;')

menus=[
    ('papaya salad', 80),
    ('chicken wing', 120),
    ('คอหมูย่าง', 90),
    ('ข้าวเหนียว', 20)
]
for m in menus:
    cur.execute('insert into yum(menu, price) values (%s, %s)', m)
cur.execute('select * from yum;')
print(cur.fetchall())

df=pd.read_sql('select * from yum where price > 100;', con)
print(df)

con.commit()
cur.close()
con.close()