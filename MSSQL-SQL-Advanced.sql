/* 
進階 SQL
---------------------------
SQL UNION
SQL UNION ALL
SQL INTERSECT
SQL MINUS
SQL Subquery
SQL EXISTS
SQL CASE


SQL 運算
---------------------------
排名 (Rank)
中位數 (Median)
累積總計 (Running Total)
總和百分比 (Percent to Total)
累積總和百分比 (Cumulative Percent to Total)
---------------------------
*/


/*	
SQL UNION
將兩個 SQL 語句的結果合併起來
UNION 跟 JOIN 有些許類似，因為這兩個指令都可以由多個表格中擷取資料
UNION 的一個限制是兩個 SQL 語句所產生的欄位需要是同樣的資料種類
用 UNION 這個指令時，我們只會看到不同的資料值 (類似 SELECT DISTINCT)
--------------------------------------------------------------
[SQL 語句 1]
UNION
[SQL 語句 2];
--------------------------------------------------------------
*/

-- 找出來所有有營業額 (Sales) 的日子
SELECT Txn_Date FROM Store_Information
UNION
SELECT Txn_Date FROM Internet_Sales;


/*	
SQL UNION ALL
將兩個 SQL 語句的結果 合併在一起
UNION ALL 會將每一筆符合條件的資料都列出來，無論資料值 有無重複
------------------------------------------------------
[SQL 語句 1]
UNION ALL
[SQL 語句 2];
------------------------------------------------------
*/

-- 找出有店面營業額以及網路營業額的日子
SELECT Txn_Date FROM Store_Information
UNION ALL
SELECT Txn_Date FROM Internet_Sales;


/*
SQL INTERSECT
和 UNION 指令類似，INTERSECT 也是對兩個 SQL 語句所產生的結果做處理的

不同的地方是：
UNION——基本上是一個 OR (如果這個值存在於第一句或是第二句，它就會被選出)。UNION 是聯集
INTERSECT——則比較像 AND (這個值要存在於第一句和第二句才會被選出)。INTERSECT 是交集
---------------------------
[SQL 語句 1]
INTERSECT
[SQL 語句 2];
---------------------------
*/

-- 找出哪幾天有店面交易和網路交易
SELECT Txn_Date FROM Store_Information
INTERSECT
SELECT Txn_Date FROM Internet_Sales;


/*
SQL MINUS
運用在兩個 SQL 語句上
它先找出第一個 SQL 語句所產生的結果，然後看這些結果有沒有在第二個 SQL 語句的結果中
如果有的話，那這一筆資料就被去除，而不會在最後的結果中出現
如果第二個 SQL 語句所產生的結果並沒有存在於第一個 SQL 語句所產生的結果內，那這筆資料就被拋棄

在 MINUS 指令下，不同的值只會被列出一次

SQL Server MINUS and INTERSECT
http://hoolihome.blogspot.com/2010/06/sql-server-minus-and-intersect.html

SQL Server 2005 後：提供 EXCEP、INTERSECT
ORACLE： MINUS、INTERSECT

EXCEP 找出存在於第一個子集,但不存在於第二個子集的筆數
INTERSECT 找出皆存在於二個子集中的筆數

這二個方法很方便查找有多個欄位的二個子集差異
*/

-- Oracle
SELECT Txn_Date FROM Store_Information
MINUS
SELECT Txn_Date FROM Internet_Sales;

-- MSSQL SEVER
SELECT Txn_Date FROM Store_Information
EXCEPT
SELECT Txn_Date FROM Internet_Sales;


/* 
SQL 子查詢 (Subquery) 
在一個 SQL 語句中放入另一個 SQL 語句
當我們在 WHERE 子句或 HAVING 子句中插入另一個 SQL 語句時，我們就有一個子查詢 (Subquery) 的架構
子查詢的作用是什麼呢？第一，它可以被用來連接表格
另外，有的時候子查詢是唯一能夠連接兩個表格的方式。

用 IN 來連接內查詢和外查詢

[比較運算子] 可以是相等的運算子，例如 =, >, <, >=, <=. 這也可以是一個對文字的運算子，例如 "LIKE"
綠色的部分代表外查詢，紅色的部分代表內查詢。
------------------------------------------------------
SELECT "欄位1" 
FROM "表格" 
WHERE "欄位2" [比較運算子] 
(SELECT "欄位1" 
FROM "表格"
WHERE "條件");
------------------------------------------------------
*/

-- 『簡單子查詢』 (Simple Subquery)：內部查詢本身與外部查詢沒有關係
-- 找出所有在西部的店的營業額
SELECT SUM(Sales) 
FROM Store_Information
WHERE Store_Name IN
  (
  SELECT Store_Name FROM Geography 
  WHERE Region_Name = 'West'
  );

-- 『相關子查詢』 (Correlated Subquery)：如果內部查詢是要利用到外部查詢提到的表格中的欄位
SELECT SUM(a1.Sales) 
FROM Store_Information a1
WHERE a1.Store_Name IN
  (
    SELECT Store_Name 
    FROM Geography a2
    WHERE a2.Store_Name = a1.Store_Name
  );


/* 
SQL EXISTS
在內查詢中，我們並不一定要用 * 來選出所有的欄位
我們也可以選擇表格 2 中的任何欄位
這兩種做法最後的結果是一樣的。
------------------------------------------------------
SELECT "欄位1"
FROM "表格1"
WHERE EXISTS 
(SELECT * 
FROM "表格2"
WHERE "條件");
------------------------------------------------------
乍看之下，這個答案似乎不太正確，因為內查詢有包含一個 [Region_Name = 'West'] 的條件
可是最後的答案並沒有包含這個條件。實際上，這並沒有問題。
在這個例子中，內查詢產生了超過一筆的資料，所以 EXISTS 的條件成立，所以外查詢被執行
而外查詢本身並沒有包含 [Region_Name = 'West'] 這個條件。
*/

/* SQL EXISTS */
SELECT SUM(Sales) 
FROM Store_Information
WHERE EXISTS
  (
    SELECT * 
    FROM Geography
    WHERE Region_Name = 'West'
  );


/* 
SQL CASE
CASE 是 SQL 用來做為 IF-THEN-ELSE 之類邏輯的關鍵字

"條件" 可以是一個數值或是公式
ELSE 子句則並不是必須的
-------------------------------------------------
SELECT CASE ("欄位名")
  WHEN "條件1" THEN "結果1"
  WHEN "條件2" THEN "結果2"
  ...
  [ELSE "結果N"]
  END
FROM "表格名";
-------------------------------------------------
*/

-- 將 'Los Angeles' 的 Sales 數值乘以 2，以及
-- 將 'San Diego' 的 Sales 數值乘以 1.5
SELECT Store_Name, 
       CASE Store_Name
         WHEN 'Los Angeles' THEN Sales * 2
         WHEN 'San Diego' THEN Sales * 1.5
         ELSE Sales
       END
       "New_Sales",
       Sales "Old_Sales",
       (SELECT convert(varchar, Txn_Date, 105)) AS Txn_Date
FROM Store_Information  


/*	
SQL 排名 (Self Join)(COUNT)
常用在同一表內不同數據間對同一列的比較
列出每一行的排名是一個常見的需求，可惜 SQL 並沒有一個很直接的方式達到這個需求
要以 SQL 列出排名，基本的概念是要做一個表格自我連結 (Self Join)
將結果依序列出，然後算出每一行之前 (包含那一行本身) 有多少行數
------------------------------------------------------------------------------------------
WHERE 子句
在字句的第一部分 (a1.Sales <= a2.Sales)：
我們算出有多少筆資料 Sales 欄位的值是比自己本身的值小或是相等
如果在 Sales 欄位中沒有同樣大小的資料，那這部分的 WHERE 子句本身就可以產生出正確的排名。

子句的第二部分 (a1.Sales=a2.Sales AND a1.Name = a2.Name)：
則是讓我們在 Sales 欄位中有同樣大小的資料時 (像 Stella 及 Jeff 這兩筆資料)，仍然能夠產生正確的排名。 
------------------------------------------------------------------------------------------
*/

-- 列出每一行的排名
SELECT a1.Name, a1.Sales, COUNT(a2.Sales) Sales_Rank
FROM Total_Sales a1, Total_Sales a2
WHERE a1.Sales <= a2.Sales OR
      (a1.Sales = a2.Sales AND a1.Name = a2.Name)
GROUP BY a1.Name, a1.Sales
ORDER BY a1.Sales DESC, a1.Name DESC


/*	
SQL 中位數
-- 將資料依序排出，並找出每一行資料的排名
-- 找出『中間』的排名為何：
   舉例來說，如果總共有 9 筆資料，那中間排名就是 5 
   (有 4 筆資料比第 5 筆資料大，有 4 筆資料比第 5 筆資料小)
-- 找出中間排名資料的值
-------------------------------------------------------
SELECT Sales Median FROM 
(SELECT a1.Name, a1.Sales, COUNT(a1.Sales) Rank 
FROM Total_Sales a1, Total_Sales a2 
WHERE a1.Sales < a2.Sales OR (a1.Sales=a2.Sales AND a1.Name <= a2.Name) 
GROUP BY a1.Name, a1.Sales 
ORDER BY a1.Sales desc) a3 
WHERE Rank = (SELECT (COUNT(*)+1) DIV 2 FROM Total_Sales);
-------------------------------------------------------
第 2 行到第 6 行是跟產生 排名 的語句完全一樣。第 7 行則是算出中間的排名。DIV 是在 MySQL 中算出商的方式。在不同的資料庫中會有不同的方式求商。第 1 行則是列出排名中間的資料值。
*/

-- SQL 中位數 (MySQL)
SELECT Sales Median 
FROM 
  (
    SELECT a1.Name, a1.Sales, COUNT(a1.Sales) Rank 
    FROM Total_Sales a1, Total_Sales a2 
    WHERE a1.Sales < a2.Sales OR (a1.Sales=a2.Sales AND a1.Name <= a2.Name) 
    GROUP BY a1.Name, a1.Sales 
    ORDER BY a1.Sales desc
  ) a3 
WHERE Rank = (SELECT (COUNT(*)+1) DIV 2 FROM Total_Sales);


/* 
SQL 累積總計(SUM)
算出累積總計是一個常見的需求，可惜以 SQL 並沒有一個很直接的方式達到這個需求
要以 SQL 算出累積總計，基本上的概念與列出排名類似：
-- 第一是先做個表格自我連結 (Self Join)，然後將結果依序列出
-- 在做列出排名時，我們算出每一行之前 (包含那一行本身) 有多少行數
-- 而在做累積總計時，我們則是算出每一行之前 (包含那一行本身) 的總合
*/
SELECT a1.Name, a1.Sales, SUM(a2.Sales) Running_Total 
FROM Total_Sales a1, Total_Sales a2 
WHERE a1.Sales <= a2.Sales OR 
     (a1.Sales = a2.Sales AND a1.Name = a2.Name) 
GROUP BY a1.Name, a1.Sales 
ORDER BY a1.Sales DESC, a1.Name DESC;


/* 
SQL 總和百分比
需要用到算排名和累積總計的概念，以及運用子查詢的做法
我們把子查詢放在外部查詢的 SELECT 子句中

SELECT SUM(Sales) FROM Total_Sales 這一段子查詢是用來算出總和
總和算出後，我們就能夠將每一行一一除以總和來求出每一行的總和百分比。
*/

-- 算出總和百分比
SELECT a1.Name, a1.Sales, 
       a1.Sales/(SELECT SUM(Sales) FROM Total_Sales) Pct_To_Total 
FROM Total_Sales a1, Total_Sales a2 
WHERE a1.Sales <= a2.Sales OR 
      (a1.Sales=a2.Sales AND a1.Name = a2.Name) 
GROUP BY a1.Name, a1.Sales 
ORDER BY a1.Sales DESC, a1.Name DESC;


/* 
SQL 累積總和百分比
用類似總和百分比的概念
要算出到目前為止的累積總和是所有總和的百分之幾
而不是光看每一筆資料是所有總和的百分之幾

SELECT SUM(Sales) FROM Total_Sales 這一段子查詢是用來算出總和
我們接下來用累積總計 SUM(a2.Sales) 除以總和來求出每一行的累積總和百分比 
*/

-- 算出累積總和百分比
SELECT a1.Name, a1.Sales, 
       SUM(a2.Sales)/(SELECT SUM(Sales) FROM Total_Sales) Pct_To_Total 
FROM Total_Sales a1, Total_Sales a2 
WHERE a1.Sales <= a2.Sales or (a1.Sales=a2.Sales and a1.Name = a2.Name) 
GROUP BY a1.Name, a1.Sales 
ORDER BY a1.Sales DESC, a1.Name DESC;




