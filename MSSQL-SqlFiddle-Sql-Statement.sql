-- EXEC sp_helplanguage
-- SET dateformat dmy;

/* SQL Distinct 找出表格內的不同資料值 */
SELECT DISTINCT Store_Name
FROM Store_Information

/* SQL WHERE */
-- 抓出營業額超過 $1,000 的資料
SELECT *
FROM Store_Information
WHERE Sales > 1000

/* SQL And Or */
-- 選出所有 Sales 高於 $1,000 或是 Sales 在 $500 及 $275 之間的資料
SELECT *
FROM Store_Information
WHERE Sales > 1000
OR (Sales < 500 AND Sales > 275)

/* SQL In */
-- 找出所有含蓋 Los Angeles 或 San Diego 的資料
SELECT *
FROM Store_Information
WHERE Store_Name IN ('Los Angeles', 'San Diego')

/* SQL Between */
-- 找出所有介於 January 6, 1999 及 January 10, 1999 中的資料
SELECT *
FROM Store_Information
WHERE Txn_Date BETWEEN '01-Jan-1999' AND '05-Jan-1999'

/* SQL 萬用字元Like */
/* SQL Like */
-- 找出所有名稱內包含 AN 這兩個字串的資訊
SELECT *
FROM Store_Information
WHERE Store_Name Like '%AN%'

/* SQL Order By */
-- 以欄位名來指定排列順序的依據
-- 依照 Sales 欄位的由大往小列出 Store_Information 表格中的資料
SELECT *
FROM Store_Information
ORDER BY Sales DESC

-- 也可以用欄位的順序 (依據 SQL 句中的順序)
-- 在 SELECT 後的第一個欄位為 1，第二個欄位為 2，以此類推

SELECT Store_Name, Sales, Txn_Date
FROM Store_Information
ORDER BY 2 DESC

/* SQL 函數 */
-- AVG("欄位名")：求出 Sales 欄位的平均值
SELECT AVG(Sales) AS 'AVG(Sales)'
FROM Store_Information

-- COUNT("欄位名")：找出我們的範例表格中有幾筆 Store_Name 欄不是空白的資料
SELECT COUNT(Store_Name) AS 'COUNT(Store_Name)'
FROM Store_Information
WHERE Store_Name IS NOT NULL

-- COUNT(DISTINCT "欄位名")：找出我們的表格中有多少個不同的 Store_Name
SELECT COUNT (DISTINCT Store_Name) AS 'COUNT(DISTINCT Store_Name)'
FROM Store_Information

-- MAX("欄位名")：求出 Sales 欄位的最大值
SELECT MAX (Sales) AS 'MAX(Sales)'
FROM Store_Information

-- MIN("欄位名")：求出 Sales 欄位的最小值
SELECT MIN (Sales) AS 'MIN(Sales)'
FROM Store_Information

-- SUM ("欄位名")：求出 Sales 欄位的總合
SELECT SUM (Sales) AS 'SUM(Sales)'
FROM  Store_Information

/* SQL Group By */
-- GROUP BY 子句要配合聚合函數使用
-- 算出每一間店(Store_Name) 的營業額(Sales)
SELECT Store_Name, SUM(Sales)
FROM Store_Information
GROUP BY Store_Name

/* GROUP BY 與聚合函數 使用注意點 */
-- 在不使用聚合函數的時候，group by 子句中必須包含所有的列，否則會報錯，如下：
SELECT Store_name Store, Sales
FROM Store_Information
GROUP BY Store_Name, Sales

/* SQL Having */
-- 找出 Sales 大於 1,500 的 Store_Name
SELECT Store_Name, SUM(Sales) AS 'SUM(Sales)'
FROM Store_Information
GROUP BY Store_Name
HAVING SUM(Sales) > 1500

/* SQL Alias */
-- 加上欄位別名以及表格別名
SELECT S.Store_name Store, SUM(S.Sales) "Total(Sales)"
FROM Store_Information S
GROUP BY S.Store_Name

/* SQL AS */
-- 運用 AS 這個關鍵字來找出每一間店的營業額總值：
SELECT S.Store_name AS Store, SUM(S.Sales) AS "Total Sales"
FROM Store_Information AS S
GROUP BY S.Store_Name

/* SQL 表格連接 (Join) */
-- 求每一區 (Region_Name) 的營業額 (Sales)
SELECT G.Region_Name REGION, SUM(S.Sales) SALES
FROM Geography G, Store_Information S
WHERE G.Store_Name = S.Store_Name
GROUP BY G.Region_Name


/* SQL OUTER JOIN (外部連接) */
-- 外部連接的語法是依資料庫的不同而有所不同的
-- MSSQL SERVER (FULL OUTER JOIN)
SELECT G.Store_Name, SUM(S.Sales) SALES
FROM Geography G
FULL OUTER JOIN Store_Information S
ON G.Store_Name = S.Store_Name
GROUP BY G.Store_Name;


/* SQL Concatenate 函數 */
SELECT Region_Name + ' ' + Store_Name
FROM Geography
WHERE Store_Name = 'Boston'

-- MySQL/Oracle:
SELECT CONCAT(Region_Name, Store_Name) 
FROM Geography 
WHERE Store_Name = 'Boston';

-- SqlServer CharIndex 函數的使用
select charindex('A','BADF',1) 

-- SqlServer 中 SubString 函數的使用
SELECT SUBSTRING(Store_Name, 1, 3) 
FROM Geography 
WHERE Store_Name = 'Los Angeles';

-- SQL Trim 函數
SELECT TRIM ('    Sample     ');
SELECT LTRIM ('   Sample dd  ');
SELECT RTRIM (' cc  Sample   ');

-- SQL Length 函數
SELECT Len(Store_Name) 
FROM Geography 
WHERE Store_Name = 'Los Angeles';

SELECT Region_Name, Len(Region_Name) 
FROM Geography;

-- SQL Replace 函數
SELECT REPLACE (Region_Name, 'ast', 'astern')
FROM Geography;




