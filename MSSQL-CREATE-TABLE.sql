/* SQL Create Table */

CREATE TABLE Store_Information(
    Store_Name varchar(50),
    Sales float,
    Txn_Date datetime
);

/* 
SQL Constraint
https://www.1keydata.com/tw/sql/sql-constraint.html

我們可以限制哪一些資料可以存入表格中。
這些限制可以在表格初創時藉由 CREATE TABLE 語句來指定，
或是之後藉由 ALTER TABLE 語句來指定。

常見的限制有以下幾種：
-- NOT NULL
-- UNIQUE
-- CHECK
-- 主鑑 (Primary Key)
-- 外來鑑 (Foreign Key)
*/


/* NOT NULL */
CREATE TABLE Customer (
    SID integer NOT NULL, 
    Last_Name varchar (30) NOT NULL, 
    First_Name varchar(30)
);

/* 
UNIQUE
UNIQUE 限制是保證一個欄位中的所有資料都是有不一樣的值。
一個被指定為主鑑的欄位也一定會含有 UNIQUE 的特性。
相對來說，一個 UNIQUE 的欄位並不一定會是一個主鍵。
*/
CREATE TABLE Customer (
    SID integer UNIQUE, 
    Last_Name varchar (30), 
    First_Name varchar(30)
);

/* 
CHECK
CHECK 限制是保證一個欄位中的所有資料都是符合某些條件。
請注意，CHECK 限制目前尚未被執行於 MySQL 資料庫上。
*/

-- "SID" 攔位只能包含大於 0 的整數。
CREATE TABLE Customer (
    SID integer CHECK (SID > 0), 
    Last_Name varchar (30), 
    First_Name varchar(30)
);

/* 
SQL 主鍵 (Primary Key)
主鍵 (Primary Key) 中的每一筆資料都是表格中的唯一值。
換言之，它是用來獨一無二地確認一個表格中的每一行資料。
主鍵可以是原本資料內的一個欄位，或是一個人造欄位 (與原本資料沒有關係的欄位)。
主鍵可以包含一或多個欄位。當主鍵包含多個欄位時，稱為組合鍵 (Composite Key)。
*/

-- MySQL: ------------------------------------
CREATE TABLE Customer (
    SID integer, 
    Last_Name varchar(30), 
    First_Name varchar(30), 
    PRIMARY KEY (SID)
);

-- Oracle: ------------------------------------
CREATE TABLE Customer (
    SID integer PRIMARY KEY, 
    Last_Name varchar(30), 
    First_Name varchar(30)
);

-- SQL Server: ------------------------------------
CREATE TABLE Customer (
    SID integer PRIMARY KEY, 
    Last_Name varchar(30), 
    First_Name varchar(30)
);


/* ALTER TABLE 以改變現有表格架構來設定主鍵的方式： */

-- MySQL: -----------------------------------------
ALTER TABLE Customer ADD PRIMARY KEY (SID);

-- Oracle: ----------------------------------------
ALTER TABLE Customer ADD PRIMARY KEY (SID);

-- SQL Server: ------------------------------------
ALTER TABLE Customer ADD PRIMARY KEY (SID);

/*
請注意，在用 ALTER TABLE 語句來添加主鍵之前，我們需要確認被用來當做主鍵的欄位是設定為『NOT NULL』；
也就是說，那個欄位一定不能沒有資料。
*/

/* 
外來鍵 (Foreign Key)
外來鍵是一個(或數個)指向另外一個表格主鍵的欄位。
外來鍵的目的是確定資料的參考完整性 (Referential Integrity)。
換言之，只有被准許的資料值才會被存入資料庫內。

舉例來說，假設我們有兩個表格：
一個 CUSTOMER 表格，裡面記錄了所有顧客的資料；
另一個 ORDERS 表格，裡面記錄了所有顧客訂購的資料。

在這裡的一個限制，就是所有的訂購資料中的顧客，都一定是要跟在 CUSTOMER 表格中存在。
在這裡，我們就會在 ORDERS 表格中設定一個外來鍵，而這個外來鍵是指向 CUSTOMER 表格中的主鍵。
這樣一來，我們就可以確定所有在 ORDERS 表格中的顧客都存在 CUSTOMER 表格中。
換句話說，ORDERS 表格之中，不能有任何顧客是不存在於 CUSTOMER 表格中的資料。
 */

-- ORDERS 表格中的 Customer_SID 欄位是一個指向 CUSTOMER 表格中 SID 欄位的外來鍵。
-- 在建置 ORDERS 表格時指定外來鍵的方式：

-- MySQL: -----------------------------------------
CREATE TABLE ORDERS 
(Order_ID integer, 
Order_Date date, 
Customer_SID integer, 
Amount double, 
PRIMARY KEY (Order_ID), 
FOREIGN KEY (Customer_SID) REFERENCES CUSTOMER (SID));

-- Oracle: -----------------------------------------
CREATE TABLE ORDERS (
    Order_ID integer PRIMARY KEY, 
    Order_Date date, 
    Customer_SID integer REFERENCES CUSTOMER (SID), 
    Amount double
);

-- SQL Server: -----------------------------------------
CREATE TABLE ORDERS (
    Order_ID integer PRIMARY KEY,
    Order_Date datetime,
    Customer_SID integer REFERENCES CUSTOMER (SID),
    Amount double
);


/* 
SQL Create View 
可以被當作是虛擬表格。
表　格：有實際儲存資料，
視觀表：是建立在表格之上的一個架構，它本身並不實際儲存資料
--------------------------------------------------
CREATE VIEW "視觀表名" 
AS "SQL SELECT 語句";
--------------------------------------------------
*/

-- 建立 V_Geography 的視觀表(記得加；)
CREATE VIEW V_Geography
AS SELECT Region_Name, Store_Name
FROM Geography;

SELECT * FROM V_Geography;

-- 建立 V_REGION_SALES 的視觀表(記得加；)
CREATE VIEW V_REGION_SALES
AS
SELECT G.Region_Name REGION, SUM(S.Sales) SALES
FROM Geography G, Store_Information S
WHERE G.Store_Name = S.Store_Name
GROUP BY G.Region_Name;

SELECT * FROM V_REGION_SALES;


/* 
SQL Create Index
索引 (Index) 可以幫助我們從表格中快速地找到需要的資料
如果一個表格沒有索引的話，資料庫系統就需要將整個表格的資料讀出 (這個過程叫做 Table Scan)
若有適當的索引，資料庫系統就可以先由這個索引去找出需要的資料是在表格的什麼地方，然後直接去那些地方抓資料

索引的命名並沒有一個固定的方式
通常會用的方式是在名稱前加一個字首，例如 "IDX_" ，來避免與資料庫中的其他物件混淆

另外，在索引名之內包括表格名及欄位名也是一個好的方式
請讀者注意，每個資料庫會有它本身的 CREATE INDEX 語法，而不同資料庫的語法會有不同
---------------------------------------------------------------------------------------
CREATE INDEX "索引名" ON "表格名" (欄位名);
---------------------------------------------------------------------------------------
*/

-- 在 Last_Name 這個欄位上建一個索引
CREATE INDEX IDX_Customer_Last_Name
ON Customer(Last_Name);

-- 在 City 及 Country 這兩個欄位上建一個索引
CREATE INDEX IDX_Customer_Location
ON Customer(City, Country);





