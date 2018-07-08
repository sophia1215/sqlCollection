
CREATE TABLE Store_Information(
    Store_Name varchar(50),
    Sales float,
    Txn_Date datetime
);

INSERT INTO Store_Information
VALUES
    ('Los Angeles', 1500, '05-Jan-1999'),
    ('San Diego', 250, '07-Jan-1999'),
    ('Los Angeles', 300, '08-Jan-1999'),
    ('Boston', 700, '08-Jan-1999');

-- 2018/07/07 --------------------------------------------------
CREATE TABLE Geography(
    Region_Name varchar(10),
    Store_Name varchar(50)
);

INSERT INTO Geography
    (Region_Name, Store_Name)
VALUES
    ('East', 'Boston'),
    ('East', 'New York'),
    ('West', 'Los Angeles'),
    ('West', 'San Diego');
    
-- 2018/07/08 -------------------------------------------
CREATE TABLE Customer(
    First_Name char(50),
    Last_Name char(50),
    Address char(50),
    City char(50),
    Country char(25),
    Birth_Date datetime
);

INSERT INTO Customer 
  (First_Name, Last_Name, Address, City, Country, Birth_Date)
VALUES 
  ('Sophia', 'Wang', 'Street 100', 'Taipei', 'Taiwan', '08-Jan-1999');

----------------------------------------------------------------------
CREATE TABLE Total_Sales(
    Name char(50),
    Sales float
);

INSERT INTO Total_Sales
    (Name, Sales)
VALUES
    ('John', 10),
    ('Jennifer', 15),
    ('Stella', 20),
    ('Sophia', 40),
    ('Greg', 50),
    ('Jeff', 20);

----------------------------------------------------------------------
CREATE TABLE Internet_Sales(
    Txn_Date date,
    Sales float
);

INSERT INTO Internet_Sales
    (Txn_Date, Sales)
VALUES
    ('07-Jan-1999', 250),
    ('10-Jan-1999', 535),
    ('11-Jan-1999', 320),
    ('12-Jan-1999', 750);
----------------------------------------------------------------------





