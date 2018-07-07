/* SQL Select */

/* 
SQL Distinct 
找出表格內的不同資料值 
---------------------------
SELECT DISTINCT "欄位名" 
FROM "表格名";
---------------------------
*/

SELECT DISTINCT Store_Name
FROM Store_Information


/* 
SQL WHERE 
由表格中有條件地選取資料
---------------------------
SELECT "欄位名" 
FROM "表格名" 
WHERE "條件";
---------------------------
*/

-- 抓出營業額超過 $1,000 的資料
SELECT *
FROM Store_Information
WHERE Sales > 1000


/* 
SQL And Or
複雜條件是由二或多個簡單條件透過 AND 或是 OR 的連接而成
AND 加 簡單條件
OR 加簡單條件的情況可以發生一或多次
可以用 ( ) 來代表條件的先後次序

一個 SQL 語句中可以有無限多個簡單條件的存在
---------------------------------------------------
SELECT "欄位名" 
FROM "表格名" 
WHERE "簡單條件" 
{[AND|OR] "簡單條件"}+;
---------------------------------------------------
*/

-- 選出所有 Sales 高於 $1,000 或是 Sales 在 $500 及 $275 之間的資料
SELECT *
FROM Store_Information
WHERE Sales > 1000
OR (Sales < 500 AND Sales > 275)


/* 
SQL In 
在 SQL 中，在兩個情況下會用到 IN 這個指令
IN 這個指令可以讓我們依照一或數個不連續 (discrete) 的值的限制之內抓出資料庫中的值
-----------------------------------------------------------------------
SELECT "欄位名" 
FROM "表格名" 
WHERE "欄位名" IN ('值一', '值二', ...);
-----------------------------------------------------------------------
*/

-- 找出所有含蓋 Los Angeles 或 San Diego 的資料
SELECT *
FROM Store_Information
WHERE Store_Name IN ('Los Angeles', 'San Diego')


/* 	
SQL Between
BETWEEN 是讓我們可以運用一個範圍 (range) 內抓出資料庫中的值
---------------------------------------------------
SELECT "欄位名" 
FROM "表格名" 
WHERE "欄位名" BETWEEN '值一' AND '值二';
---------------------------------------------------
*/

-- 找出所有介於 January 6, 1999 及 January 10, 1999 中的資料
SELECT *
FROM Store_Information
WHERE Txn_Date BETWEEN '01-Jan-1999' AND '05-Jan-1999'


/*
SQL 萬用字元
SQL 中有兩個萬用字元 (wildcard)：
% (百分比符號)：代表零個、一個、或數個字母
_ (底線)：代表剛好一個字母

萬用字元是與 LIKE 關鍵字一起使用的

'ABC%': 所有以 'ABC' 起頭的字串。舉例來說，'ABCD' 和 'ABCABC' 都符合這個模式
'%XYZ': 所有以 'XYZ' 結尾的字串。舉例來說，'WXYZ' 和 'ZZXYZ' 都符合這個模式
'%AN%': 所有含有 'AN'這個模式的字串。舉例來說， 'LOS ANGELES' 和 'SAN FRANCISCO' 都符合這個模式
'_AN%': 所有第二個字母為 'A' 和第三個字母為 'N' 的字串
        舉例來說，'SAN FRANCISCO' 符合這個模式，而 'LOS ANGELES' 則不符合這個模式
*/


/* 	
SQL Like
{模式} 經常包括萬用字元 (wildcard)
---------------------------------------------------
SELECT "欄位名" 
FROM "表格名" 
WHERE "欄位名" LIKE {模式};
---------------------------------------------------
*/

-- 找出所有名稱內包含 AN 這兩個字串的資訊
SELECT *
FROM Store_Information
WHERE Store_Name Like '%AN%'


/* 
SQL Order By 
資料排序
ASC： 由小往大排序 (ascending)，預設值。
DESC：由大往小排序 (descending)

[] 代表 WHERE 子句不是一定需要的
不過，如果 WHERE 子句存在的話，它是在 ORDER BY 子句之前
---------------------------------------------------
SELECT "欄位名" 
FROM "表格名" 
[WHERE "條件"]
ORDER BY "欄位名" [ASC, DESC];
---------------------------------------------------

可以照好幾個不同的欄位來排順序
---------------------------------------------------
ORDER BY "欄位一" [ASC, DESC], "欄位二" [ASC, DESC]
---------------------------------------------------
*/

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


/* 
SQL 函數 
資料庫中有許多資料都是以數字的型態存在，一個很重要的用途就是要能夠對這些數字做一些運算：
-------------------------------------------------------------------------
AVG (平均)
COUNT (計數)
MAX (最大值)
MIN (最小值)
SUM (總合)
-------------------------------------------------------------------------
SELECT "函數名"("欄位名") 
FROM "表格名";
-------------------------------------------------------------------------
*/

/* 
-- SQL 平均值 -------------------------------------------------------------
SELECT AVG("欄位名") 
FROM "表格名";
-------------------------------------------------------------------------
*/

-- 求出 Sales 欄位的平均值
SELECT AVG(Sales)
FROM Store_Information
---------------------------------------
SELECT AVG(Sales) AS 'AVG(Sales)'
FROM Store_Information

/* 
SQL COUNT
讓我們能夠數出在表格中有多少筆資料被選出來

COUNT 和 DISTINCT 經常被合起來使用
目的是找出表格中有多少筆不同的資料 (至於這些資料實際上是什麼並不重要)
-------------------------------------------------------------------------
SELECT COUNT("欄位名") 
FROM "表格名";
-------------------------------------------------------------------------
*/

-- COUNT("欄位名")：找出我們的範例表格中有幾筆 Store_Name 欄不是空白的資料
SELECT COUNT(Store_Name) AS 'COUNT(Store_Name)'
FROM Store_Information
WHERE Store_Name IS NOT NULL

-- COUNT(DISTINCT "欄位名")：找出我們的表格中有多少個不同的 Store_Name
SELECT COUNT (DISTINCT Store_Name) AS 'COUNT(DISTINCT Store_Name)'
FROM Store_Information

/* 
SQL 最大值
-------------------------------------------------------------------------
SELECT MAX ("欄位名") 
FROM "表格名";
-------------------------------------------------------------------------
*/

-- MAX("欄位名")：求出 Sales 欄位的最大值
SELECT MAX (Sales) AS 'MAX(Sales)'
FROM Store_Information

/* 
SQL 最小值
-------------------------------------------------------------------------
SELECT MIN ("欄位名") 
FROM "表格名";
-------------------------------------------------------------------------
*/

-- MIN("欄位名")：求出 Sales 欄位的最小值
SELECT MIN (Sales) AS 'MIN(Sales)'
FROM Store_Information

/* 
SQL 總合
-------------------------------------------------------------------------
SELECT SUM ("欄位名") 
FROM "表格名";
-------------------------------------------------------------------------
*/

-- SUM ("欄位名")：求出 Sales 欄位的總合
SELECT SUM (Sales) AS 'SUM(Sales)'
FROM Store_Information



/* 
SQL Group By
當我們選不只一個欄位，且其中至少一個欄位有包含函數的運用時，我們就需要用到 GROUP BY 這個指令。
在這個情況下，我們需要確定我們有 GROUP BY 所有其他的欄位。
換句話說，除了有包括函數的欄位外，我們都需要將其放在 GROUP BY 的子句中。

EX：
算出每一間店 (Store_Name) 的營業額 (Sales)
第一，我們對於 Store_Name 及 Sales 這兩個欄位都要選出。
第二，我們需要確認所有的 Sales 都要依照各個 Store_Name 來分開算
-------------------------------------------------------------------------
SELECT "欄位1", SUM("欄位2") 
FROM "表格名" 
GROUP BY "欄位1";
-------------------------------------------------------------------------
*/

-- 算出每一間店(Store_Name) 的營業額(Sales)
SELECT Store_Name, SUM(Sales)
FROM Store_Information
GROUP BY Store_Name


/* 
SQL Having
如何對函數產生的值來設定條件呢
HAVING 子句通常是在一個 SQL 句子的最後。
一個含有 HAVING 子句的 SQL 並不一定要包含 GROUP BY 子句

如果被 SELECT 的只有函數欄， 那就不需要 GROUP BY 子句
-------------------------------------------------------------------------
SELECT "欄位1", SUM("欄位2") 
FROM "表格名" 
GROUP BY "欄位1" 
HAVING (函數條件);
-------------------------------------------------------------------------
*/

-- 找出 Sales 大於 1,500 的 Store_Name
SELECT Store_Name, SUM(Sales) AS 'SUM(Sales)'
FROM Store_Information
GROUP BY Store_Name
HAVING SUM(Sales) > 1500







/*  */





/*
CONVERT
[SQL]各式各樣的GETDATE()時間格式轉換CONVERT
https://dotblogs.com.tw/kevinya/2014/09/05/146474
*/

-- SELECT convert(varchar, getdate(), 105) - dd-mm-yyyy
SELECT Store_Name, Sales, 
      (SELECT convert(varchar, Txn_Date, 105)) AS Txn_Date
FROM Store_information





/*
當我們選不只一個欄位，且其中至少一個欄位有包含函數的運用時，我們就需要用到 GROUP BY 這個指令。
在這個情況下，我們需要確定我們有 GROUP BY 所有其他的欄位。
換句話說，除了有包括函數的欄位外，我們都需要將其放在 GROUP BY 的子句中。
*/

/*
-- 運用 AS 這個關鍵字來找出每一間店的營業額總值，並根據營業額總值作降冪排序：
SELECT S.Store_Name, SUM(S.Sales) AS 'Total Sales'
FROM Store_information AS S
GROUP BY S.Store_Name
ORDER BY SUM(S.Sales) DESC
SQL WHERE 
由表格中有條件地選取資料
---------------------------
SELECT "欄位名" 
FROM "表格名" 
WHERE "條件";
---------------------------
*/

-- 抓出營業額超過 $1,000 的資料
SELECT *
FROM Store_Information
WHERE Sales > 1000


/* 
SQL And Or
複雜條件是由二或多個簡單條件透過 AND 或是 OR 的連接而成
AND 加 簡單條件
OR 加簡單條件的情況可以發生一或多次
可以用 ( ) 來代表條件的先後次序

一個 SQL 語句中可以有無限多個簡單條件的存在
---------------------------------------------------
SELECT "欄位名" 
FROM "表格名" 
WHERE "簡單條件" 
{[AND|OR] "簡單條件"}+;
---------------------------------------------------
*/

-- 選出所有 Sales 高於 $1,000 或是 Sales 在 $500 及 $275 之間的資料
SELECT *
FROM Store_Information
WHERE Sales > 1000
OR (Sales < 500 AND Sales > 275)


/* 
SQL In 
在 SQL 中，在兩個情況下會用到 IN 這個指令
IN 這個指令可以讓我們依照一或數個不連續 (discrete) 的值的限制之內抓出資料庫中的值
-----------------------------------------------------------------------
SELECT "欄位名" 
FROM "表格名" 
WHERE "欄位名" IN ('值一', '值二', ...);
-----------------------------------------------------------------------
*/

-- 找出所有含蓋 Los Angeles 或 San Diego 的資料
SELECT *
FROM Store_Information
WHERE Store_Name IN ('Los Angeles', 'San Diego')


/* 	
SQL Between
BETWEEN 是讓我們可以運用一個範圍 (range) 內抓出資料庫中的值
---------------------------------------------------
SELECT "欄位名" 
FROM "表格名" 
WHERE "欄位名" BETWEEN '值一' AND '值二';
---------------------------------------------------
*/

-- 找出所有介於 January 6, 1999 及 January 10, 1999 中的資料
SELECT *
FROM Store_Information
WHERE Txn_Date BETWEEN '01-Jan-1999' AND '05-Jan-1999'


/*
SQL 萬用字元
SQL 中有兩個萬用字元 (wildcard)：
% (百分比符號)：代表零個、一個、或數個字母
_ (底線)：代表剛好一個字母

萬用字元是與 LIKE 關鍵字一起使用的

'ABC%': 所有以 'ABC' 起頭的字串。舉例來說，'ABCD' 和 'ABCABC' 都符合這個模式
'%XYZ': 所有以 'XYZ' 結尾的字串。舉例來說，'WXYZ' 和 'ZZXYZ' 都符合這個模式
'%AN%': 所有含有 'AN'這個模式的字串。舉例來說， 'LOS ANGELES' 和 'SAN FRANCISCO' 都符合這個模式
'_AN%': 所有第二個字母為 'A' 和第三個字母為 'N' 的字串
        舉例來說，'SAN FRANCISCO' 符合這個模式，而 'LOS ANGELES' 則不符合這個模式
*/


/* 	
SQL Like
{模式} 經常包括萬用字元 (wildcard)
---------------------------------------------------
SELECT "欄位名" 
FROM "表格名" 
WHERE "欄位名" LIKE {模式};
---------------------------------------------------
*/

-- 找出所有名稱內包含 AN 這兩個字串的資訊
SELECT *
FROM Store_Information
WHERE Store_Name Like '%AN%'


/* 
SQL Order By 
資料排序
ASC： 由小往大排序 (ascending)，預設值。
DESC：由大往小排序 (descending)

[] 代表 WHERE 子句不是一定需要的
不過，如果 WHERE 子句存在的話，它是在 ORDER BY 子句之前
---------------------------------------------------
SELECT "欄位名" 
FROM "表格名" 
[WHERE "條件"]
ORDER BY "欄位名" [ASC, DESC];
---------------------------------------------------

可以照好幾個不同的欄位來排順序
---------------------------------------------------
ORDER BY "欄位一" [ASC, DESC], "欄位二" [ASC, DESC]
---------------------------------------------------
*/

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


/* 
SQL 函數 
資料庫中有許多資料都是以數字的型態存在，一個很重要的用途就是要能夠對這些數字做一些運算：
-------------------------------------------------------------------------
AVG (平均)
COUNT (計數)
MAX (最大值)
MIN (最小值)
SUM (總合)
-------------------------------------------------------------------------
SELECT "函數名"("欄位名") 
FROM "表格名";
-------------------------------------------------------------------------
*/

/* 
-- SQL 平均值 -------------------------------------------------------------
SELECT AVG("欄位名") 
FROM "表格名";
-------------------------------------------------------------------------
*/

-- 求出 Sales 欄位的平均值
SELECT AVG(Sales)
FROM Store_Information
---------------------------------------
SELECT AVG(Sales) AS 'AVG(Sales)'
FROM Store_Information

/* 
SQL COUNT
讓我們能夠數出在表格中有多少筆資料被選出來

COUNT 和 DISTINCT 經常被合起來使用
目的是找出表格中有多少筆不同的資料 (至於這些資料實際上是什麼並不重要)
-------------------------------------------------------------------------
SELECT COUNT("欄位名") 
FROM "表格名";
-------------------------------------------------------------------------
*/

-- COUNT("欄位名")：找出我們的範例表格中有幾筆 Store_Name 欄不是空白的資料
SELECT COUNT(Store_Name) AS 'COUNT(Store_Name)'
FROM Store_Information
WHERE Store_Name IS NOT NULL

-- COUNT(DISTINCT "欄位名")：找出我們的表格中有多少個不同的 Store_Name
SELECT COUNT (DISTINCT Store_Name) AS 'COUNT(DISTINCT Store_Name)'
FROM Store_Information

/* 
SQL 最大值
-------------------------------------------------------------------------
SELECT MAX ("欄位名") 
FROM "表格名";
-------------------------------------------------------------------------
*/

-- MAX("欄位名")：求出 Sales 欄位的最大值
SELECT MAX (Sales) AS 'MAX(Sales)'
FROM Store_Information

/* 
SQL 最小值
-------------------------------------------------------------------------
SELECT MIN ("欄位名") 
FROM "表格名";
-------------------------------------------------------------------------
*/

-- MIN("欄位名")：求出 Sales 欄位的最小值
SELECT MIN (Sales) AS 'MIN(Sales)'
FROM Store_Information

/* 
SQL 總合
-------------------------------------------------------------------------
SELECT SUM ("欄位名") 
FROM "表格名";
-------------------------------------------------------------------------
*/

-- SUM ("欄位名")：求出 Sales 欄位的總合
SELECT SUM (Sales) AS 'SUM(Sales)'
FROM Store_Information



/* 
SQL Group By
當我們選不只一個欄位，且其中至少一個欄位有包含函數的運用時，我們就需要用到 GROUP BY 這個指令。
在這個情況下，我們需要確定我們有 GROUP BY 所有其他的欄位。
換句話說，除了有包括函數的欄位外，我們都需要將其放在 GROUP BY 的子句中。

EX：
算出每一間店 (Store_Name) 的營業額 (Sales)
第一，我們對於 Store_Name 及 Sales 這兩個欄位都要選出。
第二，我們需要確認所有的 Sales 都要依照各個 Store_Name 來分開算
-------------------------------------------------------------------------
SELECT "欄位1", SUM("欄位2") 
FROM "表格名" 
GROUP BY "欄位1";
-------------------------------------------------------------------------
*/

-- 算出每一間店(Store_Name) 的營業額(Sales)
SELECT Store_Name, SUM(Sales)
FROM Store_Information
GROUP BY Store_Name

/* 
SQL Having
如何對函數產生的值來設定條件呢
HAVING 子句通常是在一個 SQL 句子的最後。
一個含有 HAVING 子句的 SQL 並不一定要包含 GROUP BY 子句

如果被 SELECT 的只有函數欄， 那就不需要 GROUP BY 子句
-------------------------------------------------------------------------
SELECT "欄位1", SUM("欄位2") 
FROM "表格名" 
GROUP BY "欄位1" 
HAVING (函數條件);
-------------------------------------------------------------------------
*/

-- 要找出 Sales 大於 1,500 的 Store_Name







/*  */










/*
當我們選不只一個欄位，且其中至少一個欄位有包含函數的運用時，我們就需要用到 GROUP BY 這個指令。
在這個情況下，我們需要確定我們有 GROUP BY 所有其他的欄位。
換句話說，除了有包括函數的欄位外，我們都需要將其放在 GROUP BY 的子句中。
*/

-- 運用 AS 這個關鍵字來找出每一間店的營業額總值，並根據營業額總值作降冪排序：
SELECT S.Store_Name, SUM(S.Sales) AS 'Total Sales'
FROM Store_information AS S
GROUP BY S.Store_Name
ORDER BY SUM(S.Sales) DESC

/*
如何對函數產生的值來設定條件呢？
舉例來說，我們可能只需要知道哪些店的營業額有超過 $1,500。在這個情況下，我們不能使用 WHERE 的指令。
那要怎麼辦呢？很幸運地，SQL 有提供一個 HAVING 的指令，而我們就可以用這個指令來達到這個目標。 
HAVING 子句通常是在一個 SQL 句子的最後。
一個含有 HAVING 子句的 SQL 並不一定要包含 GROUP BY 子句。
*/

/*
-- HAVING 的語法：
SELECT "欄位1", SUM("欄位2") 
FROM "表格名" 
GROUP BY "欄位1" 
HAVING (函數條件);
*/

-- 要找出 Sales 大於 1,500 的 Store_Name
SELECT Store_Name, SUM(Sales) AS 'Total Sales'
FROM Store_information
GROUP BY Store_Name
HAVING SUM(Sales) > 1500

-- having 子句中的每一個元素並不一定要出現在 select 列表中




