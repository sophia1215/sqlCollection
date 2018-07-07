
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
    
    

