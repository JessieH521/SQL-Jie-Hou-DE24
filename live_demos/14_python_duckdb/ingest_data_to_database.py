
# 这个python 里的代码是为了新建一个 supplier_invoice 的 schema 和 下面的 建两个表 invoice_202408, invoice_202407
# 然后供 其他文件调取这个表， 这里建的函数就不太用了

from constants import DATABASE_PATH, DATA_PATH
from database import Database

def setup_schema():
    with Database(DATABASE_PATH) as db:
        db.query(f"CREATE SCHEMA IF NOT EXISTS supplier_invoice;")   # 建一个 supplier_invoice 的 schema


    # print(DATA_PATH.glob("Lev*.csv"))
# glob("Lev*.csv") 会查找 DATA_PATH 目录下所有以 "Lev" 开头、以 .csv 结尾的文件。
# 因为 glob 返回一个生成器，print 不会输出文件内容，而是打印生成器的对象： <generator object Path.glob at 0x1046189d0>

def ingest_data():
    for csv_path in DATA_PATH.glob("Lev*.csv"):
        # print(csv_path)       # 把所有csv的文件路径打印出来
        # print(csv_path.name)  #  只打印所有csv的文件的名字
        # print(csv_path.name.split('.')[0][-6:])  
        # # 每个csv文件的.之前的部分的后6位  -- 202408, 202407 这个就是 invoice name 发票名称
        invoice_name = f"invoice_{csv_path.name.split('.')[0][-6:]}"  # invoice_202408, invoice_202407
        print(invoice_name) 

        with Database(DATABASE_PATH) as db:
            db.query(f"""
                CREATE TABLE IF NOT EXISTS supplier_invoice.{invoice_name}
                as
                select 
                    *
                from
                    read_csv_auto('{csv_path}', types={{'Organisationsnummer': 'VARCHAR'}});  
            """)   
             # 两个{{}} 一个是变量， 一个是字典
# 这是一段 SQL 查询，其中包含多行内容。如果不用三引号而改用单引号或者双引号，你将需要手动分割每一行，并用 + 拼接，或用 \ 续行，这会显得冗长且不直观。


if __name__ == "__main__":
    setup_schema()
    ingest_data()     # 返回的是 data文件夹所在的路径里的内容




























