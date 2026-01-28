CREATE PROCEDURE [dbo].[EmployeeSalesbyCountry]
	@Beginning_Date DATETIME, 
	@Ending_Date DATETIME
AS
	BEGIN
		SELECT E.Country
			,E.LastName
			,E.FirstName
			,O.ShippedDate
			,O.OrderID
			,OS.Subtotal AS SaleAmount
		FROM Employees E 
			INNER JOIN (Orders O 
						INNER JOIN [Order Subtotals] OS ON O.OrderID = OS.OrderID) 
						ON E.EmployeeID = O.EmployeeID
		WHERE 
			O.ShippedDate >= @Beginning_Date 
			AND O.ShippedDate < DATEADD(DAY, 1, @Ending_Date)
	END
RETURN 0
GO