SELECT * FROM cleandata -- selecting fro reference --

-- Schema development or normalizing tables --
-- Create 4 tables from clean data --
-- 1. Customers
-- 2. Products
-- 3. Orders 
-- 4. OrderDetails

-- Creating Customers table & Inserting data from Cleaned data --
CREATE TABLE Customers (
	CustomerID VARCHAR(50) PRIMARY KEY,
	CustomerName VARCHAR(255),
	Segment VARCHAR(100),
	City VARCHAR(100),
	State VARCHAR(100),
	Country VARCHAR(100),
	Region VARCHAR(100)
);

INSERT INTO Customers (CustomerID, CustomerName, Segment, City, State, Country, Region)
SELECT Customer_ID,
       MAX(Customer_Name)  AS CustomerName,
       MAX(Segment)       AS Segment,
       MAX(City)          AS City,
       MAX(State)         AS State,
       MAX(Country)       AS Country,
       MAX(Region)        AS Region
FROM cleandata
GROUP BY Customer_ID;

-- Creating Products table --
CREATE TABLE Products (
	ProductID VARCHAR(50),
	ProductName VARCHAR(255),
	Category VARCHAR(100),
	SubCategory VARCHAR(100)
);

INSERT INTO Products (ProductID, ProductName, Category, SubCategory)
SELECT DISTINCT
	Product_ID,
	Product_Name,
	Category,
	Sub_Category
FROM cleandata;

-- Creating Orders table --
CREATE TABLE Orders (
	OrderID VARCHAR(50) PRIMARY KEY,
	OrderDate DATE,
	ShipDate DATE,
	ShipMode VARCHAR(100),
	CustomerID VARCHAR(50),
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, OrderDate, ShipDate, ShipMode, CustomerID)
SELECT DISTINCT
       Order_ID,
       Order_Date,
       Ship_Date,
       Ship_Mode,
       Customer_ID
FROM cleandata;

-- Creating the OrderDetails table --
CREATE TABLE OrderDetails (
    OrderDetailID INT IDENTITY(1,1) PRIMARY KEY,  -- Auto-increment
    OrderID   VARCHAR(50),
    ProductID VARCHAR(50),
    Quantity  INT,
    Discount  DECIMAL(5,2),
    Sales     DECIMAL(10,2),
    Profit    DECIMAL(10,2),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
);

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, Discount, Sales, Profit)
SELECT
       Order_ID,
       Product_ID,
       Quantity,
       Discount,
       Sales,
       Profit
FROM cleandata;

-- Selecting newly created tables --
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;