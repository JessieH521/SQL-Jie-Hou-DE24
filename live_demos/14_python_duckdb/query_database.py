from database2 import DatabaseDataFrame
from constants import DATABASE_PATH

# 定义 QueryDatabase 类，用于运行给定的 SQL 查询，并将查询结果存储为一个数据框（df）

class QueryDatabase:
    def __init__(self, sql_query):
        with DatabaseDataFrame(DATABASE_PATH) as db:
            self.df = db.query(sql_query)
            
            
# 查询结果被赋值给 self.df，即 QueryDatabase 对象的一个实例变量，供后续使用




























