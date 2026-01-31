CREATE PROCEDURE [dbo].[DW_MergeFactOrders]
AS
BEGIN
	UPDATE fo
	SET  [CustomerSK] = sc.[CustomerSK]
		,[EmployeeSK] = sc.[EmployeeSK]
		,[ShipperSK] = sc.[ShipperSK]
		,[OrderDateKey] = CONVERT(INT, FORMAT(sc.[OrderDate], 'yyyyMMdd'))
		,[RequiredDateKey] = CONVERT(INT, FORMAT(sc.[RequiredDate], 'yyyyMMdd'))
		,[ShippedDateKey] = CONVERT(INT, FORMAT(sc.[ShippedDate], 'yyyyMMdd'))
		,[OrderDate] = sc.[OrderDate]
		,[RequiredDate] = sc.[RequiredDate]
		,[ShippedDate] = sc.[ShippedDate]
		,[Freight] = sc.[Freight]
		,[UnitPrice] = sc.[UnitPrice]
		,[Quantity] = sc.[Quantity]
		,[Discount] = sc.[Discount]
		,[ShipName] = sc.[ShipName]
		,[ShipAddress] = sc.[ShipAddress]
		,[ShipCity] = sc.[ShipCity]
		,[ShipRegion] = sc.[ShipRegion]
		,[ShipPostalCode] = sc.[ShipPostalCode]
		,[ShipCountry] = sc.[ShipCountry]
	FROM [dw].[FactOrders] fo
	INNER JOIN [stg].[Orders] sc
		ON fo.[OrderID] = sc.[OrderID]
	   AND fo.[ProductSK] = sc.[ProductSK]
END
GO