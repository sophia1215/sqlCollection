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

/* GROUP BY 與聚合函數 使用注意點 */
-- 在不使用聚合函數的時候，group by 子句中必須包含所有的列，否則會報錯，如下
SELECT Store_name Store, Sales
FROM Store_Information
GROUP BY Store_Name, Sales

/* 
可以看出來 GROUP BY 在這裡並沒有發揮任何的作用，我們完全可以直接 SELECT 而不用 GROUP BY
所以 GROUP BY 子句要配合聚合函數使用，
而且在配合聚合函數使用的時候，在 GROUP BY 子句中不要加上聚合函數處的列名（加入as了的話）
*/

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


/* 
SQL Alias(別名)
最常用到的別名有兩種：欄位別名 及 表格別名
欄位別名：是為了讓 SQL 產生的結果易讀
        如果這個欄位不是一個簡單的總合，而是一個複雜的計算，那欄位名就沒有這麼易懂了

表格別名：便於用 SQL 由數個不同的表格中獲取資料
        只要在 FROM 子句中的表格名後空一格，然後再列出要用的表格別名就可以了
-------------------------------------------------------------------------
SELECT "表格別名"."欄位1" "欄位別名" 
FROM "表格名" "表格別名";
-------------------------------------------------------------------------
*/

-- 加上欄位別名以及表格別名
SELECT S.Store_name Store, SUM(S.Sales) "Total(Sales)"
FROM Store_Information S
GROUP BY S.Store_Name


/* 
SQL AS
AS 關鍵字是用來指定欄位別名或是表格別名的
它是被放在欄位名和欄位別名之間，或是放在表格名和表格別名之間
-------------------------------------------------------------------------
SELECT "表格別名"."欄位1" AS "欄位別名" 
FROM "表格名" AS "表格別名";
-------------------------------------------------------------------------
*/	

-- 運用 AS 這個關鍵字來找出每一間店的營業額總值：
SELECT S.Store_name AS Store, SUM(S.Sales) AS "Total Sales"
FROM Store_Information AS S
GROUP BY S.Store_Name

/* 
T-SQL 中的 JOIN 語法解析 (for SQL Server)
https://dotblogs.com.tw/caubekimo/2010/07/28/16874
*/

/* 
SQL 表格連接 (Join)
https://www.1keydata.com/tw/sql/sqljoins.html

這個 WHERE 子句是一個連接的靈魂人物，因為它的角色是確定兩個表格之間的連接是正確的。
如果 WHERE 子句是錯誤的，我們就極可能得到一個笛卡兒連接 (Cartesian join)。
笛卡兒連接會造成我們得到所有兩個表格每兩行之間所有可能的組合。

Cartesian join ／ 笛卡兒乘積 (Cartesian product)／CROSS JOIN
如果不帶WHERE條件子句，它將會返回被連接的兩個表的笛卡爾積，返回結果的行數等於兩個表行數的乘積
http://www.itread01.com/content/1495776073.html
*/

-- 求每一區 (Region_Name) 的營業額 (Sales)
SELECT G.Region_Name REGION, SUM(S.Sales) SALES
FROM Geography G, Store_Information S
WHERE G.Store_Name = S.Store_Name
GROUP BY G.Region_Name


/* 
左連接 (left join)，又稱內部連接 (inner join)
在這個情況下，要兩個表格內都有同樣的值，那一筆資料才會被選出
*/

/* 
SQL OUTER JOIN (外部連接)
https://www.1keydata.com/tw/sql/sqlouterjoin.html

想要列出一個表格中每一筆的資料，無論它的值在另一個表格中有沒有出現
外部連接的語法是依資料庫的不同而有所不同的：

Oracle — 
我們會在 WHERE 子句中要選出所有資料的那個表格之後加上一個 "(+)" 
來代表說這個表格中的所有資料我們都要。

圖解SQL的inner join、left join、right join、full outer join、union、union all的區別
https://hk.saowen.com/a/95b9ef6e416701f294551cb3774e3144c3bb793ecd2392dea4833fbe8430b635
*/

-- Oracle
SELECT G.Store_Name, SUM(S.Sales) SALES 
FROM Geography G, Store_Information S 
WHERE G.Store_Name = S.Store_Name (+) 
GROUP BY G.Store_Name;

-- MSSQL SERVER (FULL OUTER JOIN)
SELECT G.Store_Name, SUM(S.Sales) SALES
FROM Geography G
FULL OUTER JOIN Store_Information S
ON G.Store_Name = S.Store_Name
GROUP BY G.Store_Name;


/* 
SQL Concatenate 函數
將由不同欄位獲得的資料串連在一起
--------------------------------------
MySQL: CONCAT()
Oracle: CONCAT(), ||
        只允許兩個參數；換言之，一次只能將兩個字串串連起來。
        但可以用 '||' 來一次串連多個字串。
SQL Server: +
--------------------------------------
CONCAT(字串1, 字串2, 字串3, ...)
--------------------------------------
*/

-- MSSQL SERVER：將由不同欄位獲得的資料串連在一起
SELECT Region_Name + ' ' + Store_Name
FROM Geography
WHERE Store_Name = 'Boston'

-- MySQL/Oracle:
SELECT CONCAT(Region_Name, Store_Name) 
FROM Geography 
WHERE Store_Name = 'Boston';


/*
SQL SUBSTRING 函數
用來抓出一個欄位資料中的其中一部分
這個函數的名稱在不同的資料庫中不完全一樣
--------------------------------------
MySQL: SUBSTR( ), SUBSTRING( )
Oracle: SUBSTR( )
SQL Server: SUBSTRING( )
--------------------------------------
SUBSTR (str, pos)

SUBSTR (str, pos, len)
--------------------------------------
*/

SELECT SUBSTRING(Store_Name, 1, 3) 
FROM Geography 
WHERE Store_Name = 'Los Angeles';


/*
SQL Trim 函數
移除掉一個字串中的字頭或字尾，最常見的用途是移除字首或字尾的空白
這個函數在不同的資料庫中有不同的名稱：
-------------------------------------------------------
MySQL: TRIM( ), RTRIM( ), LTRIM( )
Oracle: RTRIM( ), LTRIM( )
SQL Server: RTRIM( ), LTRIM( )
-------------------------------------------------------
TRIM ([ [位置] [要移除的字串] FROM ] 字串): 
        [位置] 的可能值為 LEADING (起頭), TRAILING (結尾), or BOTH (起頭及結尾)
        這個函數將把 [要移除的字串] 從字串的起頭、結尾，或是起頭及結尾移除。
        如果我們沒有列出 [要移除的字串] 是什麼的話，那空白就會被移除。

LTRIM (字串): 將所有字串起頭的空白移除。
RTRIM (字串): 將所有字串結尾的空白移除。
-------------------------------------------------------
*/

SELECT TRIM ('    Sample     ');
SELECT LTRIM ('   Sample dd  ');
SELECT RTRIM (' cc  Sample   ');


/*
SQL Length 函數
用來找出一個字串的長度。
這個函數的名稱在不同的資料庫中不完全一樣：
-------------------------------------
MySQL: LENGTH( )
Oracle: LENGTH( )
SQL Server: LEN( )
-------------------------------------
*/

-- SQL LEN()
SELECT Len(Store_Name) 
FROM Geography 
WHERE Store_Name = 'Los Angeles';

SELECT Region_Name, Len(Region_Name) 
FROM Geography;


/*
SQL Replace 函數
用來改變一個字串的內容。
---------------------------------------------
在字串 str1 中，當 str2 出現時，將其以 str3 替代

Replace (str1, str2, str3)
---------------------------------------------
*/

SELECT REPLACE (Region_Name, 'ast', 'astern')
FROM Geography;




