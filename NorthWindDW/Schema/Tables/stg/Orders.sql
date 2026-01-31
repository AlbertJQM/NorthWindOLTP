CREATE TABLE [stg].[Orders]
(
	[OrderID] INT NOT NULL,
    [ProductID] INT NOT NULL,
    [ProductSK] INT NOT NULL,
    [CustomerSK] NCHAR(5) NOT NULL,
    [EmployeeSK] INT NOT NULL,
    [ShipperSK] INT NOT NULL,

    [OrderDateKey] INT NOT NULL,
    [RequiredDateKey] INT NOT NULL,
    [ShippedDateKey] INT NOT NULL,

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