/* 
SQL Insert Into
https://www.1keydata.com/tw/sql/sqlinsert.html
https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-develop-use-vscode?view=sql-server-linux-2017
http://www-db.deis.unibo.it/courses/TW/DOCS/w3schools/sql/sql_insert.asp.html
*/

/*
The first form does not specify the column names where the data will be inserted, only their values:
*/

INSERT INTO Store_Information
VALUES ('Los Angeles', 900, 'Jan-10-1999');

-- OR ----------------------------------------------------
INSERT INTO Store_Information
VALUES
    ('Los Angeles', 1500, '05-Jan-1999'),
    ('San Diego', 250, '07-Jan-1999'),
    ('Los Angeles', 300, '08-Jan-1999'),
    ('Boston', 700, '08-Jan-1999');

/* 
The second form specifies both the column names and the values to be inserted: 
*/

INSERT INTO Store_Information 
    (Store_Name, Sales, Txn_Date)
VALUES 
    ('Los Angeles', 900, 'Jan-10-1999');

-- OR --------------------------------------------------
INSERT INTO Store_Information
    (Store_Name, Sales, Txn_Date)
VALUES
    ('Los Angeles', 1500, '05-Jan-1999'),
    ('San Diego', 250, '07-Jan-1999'),
    ('Los Angeles', 300, '08-Jan-1999'),
    ('Boston', 700, '08-Jan-1999');


/* 
有兩種作法可以將資料輸入表格中內： 
一種是一次輸入一筆：
-----------------------------------------------
INSERT INTO "表格名" ("欄位1", "欄位2", ...)
VALUES ("值1", "值2", ...);
-----------------------------------------------

另一種是一次輸入好幾筆：
-----------------------------------------------
INSERT INTO "表格1" ("欄位1", "欄位2", ...)
SELECT "欄位3", "欄位4", ...
FROM "表格2";
-----------------------------------------------
*/

-- 1次輸入一筆
INSERT INTO Customer 
  (First_Name, Last_Name, Address, City, Country, Birth_Date)
VALUES 
  ('Sophia', 'Wang', 'Street 100', 'Taipei', 'Taiwan', '08-Jan-1999');

-- 1次輸入多筆的資料
/* 
將 1998 年的營業額資料放入 Sales_Information 表格
而我們知道資料的來源是可以由 Sales_Information 表格取得
*/
INSERT INTO Store_Information 
  (Store_Name, Sales, Txn_Date)
SELECT Store_Name, Sales, Txn_Date
FROM Sales_Information
WHERE Year(Txn_Date) = 1998;


