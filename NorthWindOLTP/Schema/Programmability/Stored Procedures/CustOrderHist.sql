CREATE PROCEDURE [dbo].[CustOrderHist]
	@CustomerID NCHAR(5)
AS
	BEGIN
		SELECT P.ProductName
			,Total=SUM(OD.Quantity)
		FROM Products P
			INNER JOIN OrderDetails OD ON P.ProductID = OD.ProductID
			INNER JOIN Orders O ON OD.OrderID = O.OrderID
			INNER JOIN Customers C ON O.CustomerID = C.CustomerID
		WHERE C.CustomerID = @CustomerID
		GROUP BY P.ProductName
	END
RETURN 0
GO