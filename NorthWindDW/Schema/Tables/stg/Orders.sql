CREATE TABLE [stg].[Orders]
(
	[OrderID] INT,
    [ProductSK] INT,
    [CustomerSK] NCHAR(5),
    [EmployeeSK] INT,
    [ShipperSK] INT,

    [OrderDate] DATE,
    [RequiredDate] DATE,
    [ShippedDate] DATE,
    [Freight] MONEY,

    [UnitPrice] MONEY,
    [Quantity] SMALLINT,
    [Discount] REAL,

    [ShipName] NVARCHAR(40),
    [ShipAddress] NVARCHAR(60),
    [ShipCity] NVARCHAR(15),
    [ShipRegion] NVARCHAR(15),
    [ShipPostalCode] NVARCHAR(10),
    [ShipCountry] NVARCHAR(15)
)
GO