CREATE PROCEDURE [dbo].[SalesByCategory]
	@CategoryName NVARCHAR(15), 
	@OrdYear NVARCHAR(4) = '1998'
AS
	BEGIN
		IF @OrdYear != '1996' AND @OrdYear != '1997' AND @OrdYear != '1998'
			SET @OrdYear = '1998'
		
		SELECT P.ProductName
			,TotalPurchase=ROUND(SUM(CONVERT(decimal(14,2), OD.Quantity * (1-OD.Discount) * OD.UnitPrice)), 0)
		FROM dbo.OrderDetails OD 
			INNER JOIN dbo.Orders O ON OD.OrderID = O.OrderID
			INNER JOIN dbo.Products P ON OD.ProductID = P.ProductID
			INNER JOIN dbo.Categories C ON P.CategoryID = C.CategoryID
		WHERE 
			C.CategoryName = @CategoryName
			AND SUBSTRING(CONVERT(NVARCHAR(22), O.OrderDate, 111), 1, 4) = @OrdYear
		GROUP BY P.ProductName
		ORDER BY P.ProductName
	END
RETURN 0
GO
