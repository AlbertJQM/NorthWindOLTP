CREATE PROCEDURE [dbo].[DW_MergeDimProduct]
AS
BEGIN
	UPDATE dp
	SET  [ProductName] = sc.[ProductName]
		,[CompanyName] = sc.[CompanyName]
		,[City] = sc.[City]
		,[Country] = sc.[Country]
		,[CategoryName] = sc.[CategoryName]
		,[Description] = sc.[Description]
		,[QuantityPerUnit] = sc.[QuantityPerUnit]
		,[UnitPrice] = sc.[UnitPrice]
		,[UnitsInStock] = sc.[UnitsInStock]
		,[UnitsOnOrder] = sc.[UnitsOnOrder]
		,[ReorderLevel] = sc.[ReorderLevel]
		,[Discontinued] = sc.[Discontinued]
	FROM [dw].[DimProduct] dp
	INNER JOIN [stg].[Products] sc
		ON dp.[ProductID] = sc.[ProductSK]
END
GO