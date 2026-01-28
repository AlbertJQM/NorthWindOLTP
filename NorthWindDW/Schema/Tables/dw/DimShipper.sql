CREATE TABLE [dw].[DimShipper]
(
	[ShipperSK] INT IDENTITY PRIMARY KEY,
    [ShipperID] INT,
    [CompanyName] NVARCHAR(40),
    [Phone] NVARCHAR(24)
)
GO