CREATE VIEW [dbo].[Summary of Sales by Year] AS
	SELECT Orders.ShippedDate, Orders.OrderID, [Order_Subtotals].Subtotal
	FROM Orders INNER JOIN [Order_Subtotals] ON Orders.OrderID = [Order_Subtotals].OrderID
	WHERE Orders.ShippedDate IS NOT NULL
GO