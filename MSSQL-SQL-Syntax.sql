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





