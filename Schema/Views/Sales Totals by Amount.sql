CREATE VIEW [dbo].[Sales Totals by Amount] AS
	SELECT [Order_Subtotals].Subtotal AS SaleAmount, Orders.OrderID, Customers.CompanyName, Orders.ShippedDate
	FROM 	Customers INNER JOIN 
			(Orders INNER JOIN [Order_Subtotals] ON Orders.OrderID = [Order_Subtotals].OrderID) 
		ON Customers.CustomerID = Orders.CustomerID
	WHERE ([Order_Subtotals].Subtotal >2500) AND (Orders.ShippedDate BETWEEN '19970101' And '19971231')
GO