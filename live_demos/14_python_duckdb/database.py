
import duckdb
from pathlib import Path

from constants import DATABASE_PATH

# Context Manager 上下文管理器 with
# Database class with connection implemented as context manager 

# 创建了一个路径变量 db_path，用于指定 DuckDB 数据库文件的位置。如果 test.db 文件不存在，DuckDB 会自动创建一个新文件。
# Path(__file__): 当前脚本的文件路径。.parent: 获取脚本所在文件夹的路径。/"test.db": 代表一个名为 test.db 的 DuckDB 数据库文件。
# db_path = Path(__file__).parent/"test.db"

# 创建类，封装了与 DuckDB 数据库交互的功能，利用上下文管理协议 (__enter__ 和 __exit__) 实现自动资源管理

class Database:

    def __init__(self, db_path):
        self.db_path = db_path    # self.db_path: 保存传入的数据库路径。
        self.connection = None    # self.connection: 用于存储与数据库的连接对象，初始值为 None。

    def __enter__(self):
        self.connection = duckdb.connect(self.db_path)  # duckdb.connect():建立与 DuckDB 的连接。将连接对象存储在 self.connection 中。
        return self    # 返回 self，使调用者可以通过 with 语句使用 Database 的方法
        # return self 通常返回资源, 或 self.file 返回文件对象 等等

    def query(self, query):
        return self.connection.execute(query).fetchall()   
    # execute(query) 是 DuckDB 的标准查询接口，其支持链式调用。DuckDB 的 fetchall() 简化了查询结果的获取，是其接口设计的特征
    # 使用 self.connection.execute(query) 执行传入的 SQL 语句.调用 .fetchall() 获取查询结果的所有行
    # 返回值: 查询结果是一个包含数据行的列表。
    
    def __exit__(self, exc_type, exc_value, traceback):
        if self.connection:
            self.connection.close()
    #  __exit__ 在 with 语句结束时自动调用, 关闭与数据库的连接，释放资源。
    # exc_type, exc_value, traceback 是异常处理的参数（本例中未使用）

if __name__ == "__main__":      # Database 是类，db 是 Database 类创建的对象，实例
    with Database(DATABASE_PATH) as db:
        query1 = db.query("select * from information_schema.schemata;")
        # db.query() 查询 information_schema.schemata 内容。这是 DuckDB 中的系统表，存储数据库的架构信息.
    print(query1)






# 上下文管理器 (Context Manager) 

"""
格式要点：

1. 定义 __enter__ 和 __exit__ 方法。
2. 在 with 块中进行资源的使用。
3. 确保 __exit__ 方法可以妥善释放资源，避免资源泄漏。

with 的工作机制
上下文管理器的核心是实现 __enter__ 和 __exit__ 方法。
__enter__:在 with 块开始时被调用，初始化资源。
__exit__:在 with 块结束时（无论是否发生异常）被调用，清理资源。

"""


"""
Database 类定义了 __enter__ 和 __exit__ 方法：
这两个方法使 Database 类成为一个上下文管理器(Context Manager)。
with 语句会调用这些方法来管理进入和退出上下文。
主要逻辑：
__enter__: 当执行 with Database() as db: 时, __enter__ 方法会自动执行。
__exit__: 当 with 代码块运行完毕（无论是否抛出异常, __exit__ 方法会自动执行。
"""





# class Database:

#     def __init__(self):
#         pass

#     def __enter__(self):
#         print('entering __enter__')

#     def __exit__(self, exc_type, exc_value, traceback):
#         print('exiting, __exit__')

# with Database() as db:
#     print('inside of context manager')

# print("outside")
# print('----------------------')





# entering __enter__
# inside of context manager
# exiting, __exit__
# outside

































