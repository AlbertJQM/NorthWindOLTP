CREATE PROCEDURE [dbo].[CustOrdersDetail]
	@OrderID INTEGER
AS
	BEGIN
		SELECT P.ProductName
			,UnitPrice=ROUND(OD.UnitPrice, 2)
			,OD.Quantity, Discount=CONVERT(INTEGER, OD.Discount * 100)
			,ExtendedPrice=ROUND(CONVERT(MONEY, OD.Quantity * (1 - OD.Discount) * OD.UnitPrice), 2)
		FROM Products P
			INNER JOIN OrderDetails OD ON P.ProductID = OD.ProductID
		WHERE OD.OrderID = @OrderID
	END
RETURN 0
GO
