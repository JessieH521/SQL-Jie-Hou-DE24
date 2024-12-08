
# import this database into the jupyter notebok 

import duckdb


class Database:

    def __init__(self, db_path):
        self.db_path = db_path   
        self.connection = None   

    def __enter__(self):
        self.connection = duckdb.connect(self.db_path)
        return self  
       
    def query(self, query):
        return self.connection.execute(query).fetchall()   
    
    def __exit__(self, exc_type, exc_value, traceback):
        if self.connection:
            self.connection.close()

# DatabaseDataFrame inherits Database 继承， also a context manager

class DatabaseDataFrame(Database):
    def query(self, query):
        return self.connection.execute(query).df()


# 上下文管理器类
# 1. 打开数据库连接（__enter__ 方法）。
# 2. 执行查询。
# 3. 自动关闭数据库连接（__exit__ 方法），即使发生异常也能确保资源被正确释放。













