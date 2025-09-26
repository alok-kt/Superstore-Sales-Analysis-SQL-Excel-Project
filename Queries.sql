SELECT * FROM Customers;
SELECT * FROM  Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;

-- Total Sales --
SELECT SUM(Sales) AS TotalSales
FROM OrderDetails;

-- Total Profit --
SELECT SUM(Profit) AS TotalProfit
FROM OrderDetails;

-- Sales by Region --
SELECT c.Region, SUM(od.Sales) AS Sales
FROM OrderDetails od
JOIN Orders o ON o.OrderID = od.OrderID
JOIN Customers c ON c.CustomerID = o.CustomerID
GROUP BY c.Region
ORDER BY Sales DESC;

-- Profit by Category --
SELECT p.Category, SUM(od.Profit) AS Profits
FROM Products p
JOIN OrderDetails od ON od.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY Profits DESC;

-- Top 10 Products by Sales --
SELECT TOP 10 p.ProductName, SUM(od.Sales) AS Sales
FROM Products p
JOIN OrderDetails od ON od.ProductID = p.ProductID
GROUP BY p.ProductName
ORDER BY Sales;

-- Top 10 Customers by Sales --
SELECT TOP 10 c.CustomerName, SUM(od.Sales) AS Sales
FROM OrderDetails od
JOIN Orders o ON o.OrderID = od.OrderID
JOIN Customers c ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerName
ORDER BY Sales DESC;

-- Monthly Sales Trend --
SELECT FORMAT(o.OrderDate, 'yyyy-MM') AS YearMonth, SUM(od.Sales) AS Sales
FROM Orders o
JOIN OrderDetails od ON od.OrderID = o.OrderID
GROUP BY FORMAT(o.OrderDate, 'yyyy-MM')
ORDER BY YearMonth;

-- Average Discount --
SELECT AVG(Discount) AS AvgDiscount
FROM OrderDetails;

-- Profit Margin --
SELECT (SUM(Profit) / SUM(Sales)) * 100 AS ProfitMargin
FROM OrderDetails;

-- Orders by Ship Mode --
SELECT ShipMode, COUNT(*) AS TotalOrders
FROM Orders 
GROUP BY ShipMode
ORDER BY TotalOrders DESC;

-- High Return / Negative Profit Orders --
SELECT o.OrderID, SUM(od.Profit) AS TotalProfit
FROM Orders o
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY o.OrderID
HAVING SUM(od.Profit) < 0
ORDER BY TotalProfit;

-- Top 5 Customers by Profit --
WITH CustomerProfit AS (
	SELECT	c.CustomerID,
			c.CustomerName,
			SUM(od.Profit) AS TotalProfit
	FROM OrderDetails od
	JOIN Orders o ON o.OrderID = od.OrderID
	JOIN Customers c ON c.CustomerID = o.CustomerID
	GROUP BY c.CustomerID, c.CustomerName
)
SELECT TOP 5 CustomerName, TotalProfit
FROM CustomerProfit
ORDER BY TotalProfit DESC;

-- Monthly Sales Trend by Category --
WITH MonthlySales AS (
    SELECT p.Category,
           FORMAT(o.OrderDate, 'yyyy-MM') AS YearMonth,
           SUM(od.Sales) AS TotalSales
    FROM OrderDetails od
    JOIN Orders o ON od.OrderID = o.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    GROUP BY p.Category, FORMAT(o.OrderDate, 'yyyy-MM')
)
SELECT *
FROM MonthlySales
ORDER BY YearMonth, Category;
