/*
CONVERT
[SQL]各式各樣的GETDATE()時間格式轉換CONVERT
https://dotblogs.com.tw/kevinya/2014/09/05/146474
*/

-- SELECT convert(varchar, getdate(), 105) - dd-mm-yyyy
SELECT Store_Name, Sales, 
      (SELECT convert(varchar, Txn_Date, 105)) AS Txn_Date
FROM Store_information


