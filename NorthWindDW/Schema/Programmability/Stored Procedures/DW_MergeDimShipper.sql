CREATE PROCEDURE [dbo].[DW_MergeDimShipper]
AS
BEGIN
	UPDATE ds
	SET  [CompanyName] = sc.[CompanyName]
		,[Phone] = sc.[Phone]
	FROM [dw].[DimShipper] ds
	INNER JOIN [stg].[Shippers] sc
		ON ds.[ShipperID] = sc.[ShipperSK]
END
GO