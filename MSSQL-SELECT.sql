/* SQL Select */

SELECT Store_Name, Sales, 
      (SELECT convert(varchar, Txn_Date, 105)) AS Txn_Date
FROM Store_information

--要找出 Sales 大於 1,500 的 Store_Name
SELECT Store_Name, SUM(Sales) AS 'Sales_SUM'
FROM Store_information
GROUP BY Store_Name
HAVING SUM(Sales) > 1500

--運用 AS 這個關鍵字來找出每一間店的營業額總值，並根據營業額總值作降冪排序：
SELECT S.Store_Name, SUM(S.Sales) AS 'Total Sales'
FROM Store_information AS S
GROUP BY S.Store_Name
ORDER BY SUM(S.Sales) DESC