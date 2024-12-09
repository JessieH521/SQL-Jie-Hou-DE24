# constants 常量

from pathlib import Path

# __file__ dunder file
# absolute path to constants.py  绝对路径
# /"data"-> concatenate with "data"
# /operator works here because of operator overloading and polymorphism 运算符在这里起作用是因为运算符重载和多态性

DATABASE_PATH = Path(__file__).parent/"gotebory_stad.db"          # 存储在 gotebory_stad.db 库
DATA_PATH = Path(__file__).parent/"data"                          # 存储在 data， folder data文件夹


# 使用 Python 的 pathlib 模块来定义一个数据库文件的路径，文件名为 gotebory_stad.db
# Path(__file__)： __file__ 是一个特殊变量，用于表示当前执行脚本的路径 是 /home/user/project/script.py。
# Path(__file__).parent 获取的是脚本文件所在目录的路径，.parent 的值就是 /home/user/project/。

# print(DATA_PATH)























