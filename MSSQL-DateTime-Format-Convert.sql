/*
[SQL]各式各樣的GETDATE()時間格式轉換CONVERT
https://dotblogs.com.tw/kevinya/2014/09/05/146474

How to Format Date/Time
-- Microsoft SQL Server T-SQL date and datetime formats
-- Date time formats - mssql datetime 
-- MSSQL getdate returns current system date and time in standard internal format
*/

SELECT convert(varchar, getdate(), 100) -- mon dd yyyy hh:mmAM (or PM)
                                        -- Oct  2 2008 11:01AM          
SELECT convert(varchar, getdate(), 101) -- mm/dd/yyyy - 10/02/2008                  
SELECT convert(varchar, getdate(), 102) -- yyyy.mm.dd - 2008.10.02           
SELECT convert(varchar, getdate(), 103) -- dd/mm/yyyy
SELECT convert(varchar, getdate(), 104) -- dd.mm.yyyy
SELECT convert(varchar, getdate(), 105) -- dd-mm-yyyy
SELECT convert(varchar, getdate(), 106) -- dd mon yyyy
SELECT convert(varchar, getdate(), 107) -- mon dd, yyyy
SELECT convert(varchar, getdate(), 108) -- hh:mm:ss
SELECT convert(varchar, getdate(), 109) -- mon dd yyyy hh:mm:ss:mmmAM (or PM)
                                        -- Oct  2 2008 11:02:44:013AM   
SELECT convert(varchar, getdate(), 110) -- mm-dd-yyyy
SELECT convert(varchar, getdate(), 111) -- yyyy/mm/dd
SELECT convert(varchar, getdate(), 112) -- yyyymmdd
SELECT convert(varchar, getdate(), 113) -- dd mon yyyy hh:mm:ss:mmm
                                        -- 02 Oct 2008 11:02:07:577     
SELECT convert(varchar, getdate(), 114) -- hh:mm:ss:mmm(24h)
SELECT convert(varchar, getdate(), 120) -- yyyy-mm-dd hh:mm:ss(24h)
SELECT convert(varchar, getdate(), 121) -- yyyy-mm-dd hh:mm:ss.mmm
SELECT convert(varchar, getdate(), 126) -- yyyy-mm-ddThh:mm:ss.mmm
                                        -- 2008-10-02T10:52:47.513
-- SQL create different date styles with t-sql string functions
SELECT replace(convert(varchar, getdate(), 111), -/-, - -) -- yyyy mm dd
SELECT convert(varchar(7), getdate(), 126)                 -- yyyy-mm
SELECT right(convert(varchar, getdate(), 106), 8)          -- mon yyyy








