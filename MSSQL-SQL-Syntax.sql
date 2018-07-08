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
GROUP BY 與聚合函數 使用注意點
https://www.cnblogs.com/jinianjun/archive/2012/06/14/2549735.html
*/

-- 算出每一間店(Store_Name) 的營業額(Sales)
SELECT Store_Name, SUM(Sales)
FROM Store_Information
GROUP BY Store_Name

-- 在不使用聚合函數的時候，group by 子句中必須包含所有的列，否則會報錯，如下
SELECT S.Store_name Store, S.Sales
FROM Store_Information S
GROUP BY S.Store_Name, S.Sales


/*
Cartesian join ／ 笛卡兒乘積 (Cartesian product)／CROSS JOIN
如果不帶WHERE條件子句，它將會返回被連接的兩個表的笛卡爾積，返回結果的行數等於兩個表行數的乘積；

https://www.fooish.com/sql/cross-join.html
*/


/*
The ORDER BY clause is invalid in views, inline functions, derived tables, subqueries, and common table expressions, unless TOP, OFFSET or FOR XML is also specified.
*/


/* SQL 排名 (Self Join) */
-- 常用在同一表內不同數據間對同一列的比較
SELECT a1.Name, a1.Sales, COUNT(a2.Sales) Sales_Rank
FROM Total_Sales a1, Total_Sales a2
WHERE a1.Sales <= a2.Sales OR
      (a1.Sales = a2.Sales AND a1.Name = a2.Name)
GROUP BY a1.Name, a1.Sales
ORDER BY a1.Sales DESC, a1.Name DESC


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




