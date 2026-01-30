CREATE TABLE [dw].[DimProduct]
(
	[ProductSK] INT IDENTITY PRIMARY KEY,
    [ProductID] INT,
    [ProductName] NVARCHAR(40),

    [CompanyName] NVARCHAR(40),
    [City] NVARCHAR(15),
    [Country] NVARCHAR(15),

    [CategoryName] NVARCHAR(15),
    [Description] NVARCHAR(MAX),

    [QuantityPerUnit] NVARCHAR(20),
    [UnitPrice] MONEY,
    [UnitsInStock] SMALLINT,
    [UnitsOnOrder] SMALLINT,
    [ReorderLevel] SMALLINT,
    [Discontinued] BIT
) TEXTIMAGE_ON [PRIMARY];
GO