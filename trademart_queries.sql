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
