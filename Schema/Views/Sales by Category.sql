CREATE VIEW [dbo].[Sales by Category] AS
	SELECT Categories.CategoryID, Categories.CategoryName, 
		Sum([Order_Details_Extended_WithProducts].ExtendedPrice) AS ProductSales
	FROM 	Categories INNER JOIN 
			(Products INNER JOIN 
				(Orders INNER JOIN [Order_Details_Extended_WithProducts] ON Orders.OrderID = [Order_Details_Extended_WithProducts].OrderID) 
			ON Products.ProductID = [Order_Details_Extended_WithProducts].ProductID) 
		ON Categories.CategoryID = Products.CategoryID
	WHERE Orders.OrderDate BETWEEN '19970101' And '19971231'
	GROUP BY Categories.CategoryID, Categories.CategoryName
GO