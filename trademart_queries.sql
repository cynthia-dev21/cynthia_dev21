-- TradeMart Sales Analysis
-- Analyst: Chiamaka Cynthia Okoye

-- Total revenue by city
SELECT City, SUM(Quantity * Price) AS Revenue
FROM Orders
GROUP BY City
ORDER BY Revenue DESC;

-- Top spending customers
SELECT Customers.Name, SUM(Orders.Quantity * Orders.Price) AS Total_Spent
FROM Customers
INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Name
ORDER BY Total_Spent DESC;



-- TradeMart Sales Analysis
-- Analyst: Chiamaka Cynthia Okoye
-- Tool: MySQL
-- Date: 2026

-- =============================================
-- TABLE CREATION
-- =============================================

CREATE TABLE Customers (
  CustomerID INTEGER,
  Name TEXT,
  City TEXT,
  Age INTEGER
);

CREATE TABLE Orders (
  OrderID INTEGER,
  CustomerID INTEGER,
  Product TEXT,
  Quantity INTEGER,
  Price INTEGER
);

-- =============================================
-- BASIC QUERIES
-- =============================================

-- Get all customers
SELECT * FROM Customers;

-- Get all customers from Lagos
SELECT * FROM Customers
WHERE City = 'Lagos';

-- Get customers above age 30
SELECT * FROM Customers
WHERE Age > 30;

-- =============================================
-- AGGREGATION QUERIES
-- =============================================

-- Total number of orders
SELECT COUNT(*) AS Total_Orders
FROM Orders;

-- Total revenue from all orders
SELECT SUM(Quantity * Price) AS Total_Revenue
FROM Orders;

-- Revenue by product
SELECT Product,
       SUM(Quantity * Price) AS Revenue
FROM Orders
GROUP BY Product
ORDER BY Revenue DESC;

-- =============================================
-- JOIN QUERIES
-- =============================================

-- All customers with their orders
SELECT Customers.Name,
       Customers.City,
       Orders.Product,
       Orders.Quantity,
       Orders.Price
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID;

-- Total spending per customer
SELECT Customers.Name,
       SUM(Orders.Quantity * Orders.Price) AS Total_Spent
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Name
ORDER BY Total_Spent DESC;

-- Top 3 highest spending customers
SELECT Customers.Name,
       SUM(Orders.Quantity * Orders.Price) AS Total_Spent
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.Name
ORDER BY Total_Spent DESC
LIMIT 3;

-- Customers with NO orders (LEFT JOIN)
SELECT Customers.Name,
       Customers.City
FROM Customers
LEFT JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
WHERE Orders.OrderID IS NULL;

-- Revenue by city
SELECT Customers.City,
       SUM(Orders.Quantity * Orders.Price) AS City_Revenue
FROM Customers
INNER JOIN Orders
ON Customers.CustomerID = Orders.CustomerID
GROUP BY Customers.City
ORDER BY City_Revenue DESC;
