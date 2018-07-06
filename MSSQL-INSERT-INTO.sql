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









