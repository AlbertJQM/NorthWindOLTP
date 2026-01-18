CREATE PROCEDURE [dbo].[SalesbyYear]
	@Beginning_Date DATETIME,
	@Ending_Date DATETIME
AS
	BEGIN
		SELECT O.ShippedDate
			,O.OrderID
			,OS.Subtotal
			,DATENAME(yy,O.ShippedDate) AS Year
		FROM Orders O 
			INNER JOIN [Order Subtotals] OS ON O.OrderID = OS.OrderID
		WHERE O.ShippedDate BETWEEN @Beginning_Date AND @Ending_Date
	END
RETURN 0
GO
