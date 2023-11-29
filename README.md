## 本项目实现的最终作用是基于JSP图书管理系统
## 分为0个角色
## 数据库设计如下：
# 数据库设计文档

**数据库名：** library_manager

**文档版本：** 


| 表名                  | 说明       |
| :---: | :---: |
| [book](#book) | 图书信息表 |
| [card](#card) |  |
| [lendrecord](#lendrecord) |  |
| [type](#type) |  |
| [user](#user) | 用户表 |

**表名：** <a id="book">book</a>

**说明：** 图书信息表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | bid |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | bname |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  3   | tid |   int   | 10 |   0    |    N     |  N   |       |   |
|  4   | author |   varchar   | 255 |   0    |    N     |  N   |       | 作者  |
|  5   | publisher |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  6   | years |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  7   | ibsn |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  8   | ibsnimg |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  9   | allnum |   int   | 10 |   0    |    N     |  N   |       |   |
|  10   | nownum |   int   | 10 |   0    |    N     |  N   |       |   |
|  11   | bimage |   varchar   | 255 |   0    |    N     |  N   |   'nopic.jpg'    |   |

**表名：** <a id="card">card</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | cid |   int   | 10 |   0    |    N     |  Y   |       | 分类ID  |
|  2   | name |   varchar   | 255 |   0    |    N     |  N   |       | 名字  |
|  3   | email |   varchar   | 255 |   0    |    N     |  N   |       | 邮箱  |
|  4   | status |   varchar   | 255 |   0    |    N     |  N   |   '正常'    |   |
|  5   | vip |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  6   | num |   int   | 10 |   0    |    N     |  N   |       | 数量  |

**表名：** <a id="lendrecord">lendrecord</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | lid |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | bid |   int   | 10 |   0    |    N     |  N   |       |   |
|  3   | cid |   int   | 10 |   0    |    N     |  N   |       |   |
|  4   | borrowtime |   date   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  5   | deadline |   date   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  6   | returntime |   date   | 10 |   0    |    Y     |  N   |   NULL    |   |
|  7   | status |   varchar   | 255 |   0    |    N     |  N   |       | 状态  |

**表名：** <a id="type">type</a>

**说明：** 

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | tid |   int   | 10 |   0    |    N     |  Y   |       |   |
|  2   | tcode |   int   | 10 |   0    |    N     |  N   |       |   |
|  3   | tname |   varchar   | 255 |   0    |    N     |  N   |       |   |

**表名：** <a id="user">user</a>

**说明：** 用户表

**数据列：**

| 序号 | 名称 | 数据类型 |  长度  | 小数位 | 允许空值 | 主键 | 默认值 | 说明 |
| :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: | :---: |
|  1   | uid |   int   | 10 |   0    |    N     |  Y   |       | 用户ID  |
|  2   | username |   varchar   | 255 |   0    |    N     |  N   |       | 用户名  |
|  3   | userpwd |   varchar   | 255 |   0    |    N     |  N   |       | 密码  |
|  4   | uname |   varchar   | 255 |   0    |    N     |  N   |       |   |
|  5   | upower |   varchar   | 11 |   0    |    N     |  N   |       |   |

**运行不出来可以微信 javape 我的公众号：源码码头**
