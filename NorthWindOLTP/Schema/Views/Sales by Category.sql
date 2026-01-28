CREATE VIEW [dbo].[Sales by Category] AS
	SELECT Categories.CategoryID, Categories.CategoryName, 
		SUM([Order Details Extended].ExtendedPrice) AS ProductSales
	FROM 	Categories INNER JOIN 
			(Products INNER JOIN 
				(Orders INNER JOIN [Order Details Extended] ON Orders.OrderID = [Order Details Extended].OrderID) 
			ON Products.ProductID = [Order Details Extended].ProductID) 
		ON Categories.CategoryID = Products.CategoryID
	WHERE Orders.OrderDate BETWEEN '19970101' AND '19971231'
	GROUP BY Categories.CategoryID, Categories.CategoryName
GO