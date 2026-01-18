CREATE PROCEDURE [dbo].[CustOrdersOrders]
	@CustomerID NCHAR(5)
AS
	BEGIN
		SELECT O.OrderID
			,O.OrderDate
			,O.RequiredDate
			,O.ShippedDate
		FROM Orders O
		WHERE O.CustomerID = @CustomerID
		ORDER BY O.OrderID
	END
RETURN 0
GO
