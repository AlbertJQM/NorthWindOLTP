CREATE TABLE [dw].[FactOrders]
(
	[OrderID] INT NOT NULL,
    [ProductSK] INT NOT NULL,
    [CustomerSK] INT,
    [EmployeeSK] INT,
    [ShipperSK] INT,

    [OrderDateKey] INT NOT NULL,
    [RequiredDateKey] INT NOT NULL,
    [ShippedDateKey] INT NULL,
    [OrderDate] DATETIME NULL,
    [RequiredDate] DATETIME NULL,
    [ShippedDate] DATETIME NULL,
    [Freight] MONEY,

    [UnitPrice] MONEY,
    [Quantity] SMALLINT,
    [Discount] REAL,

    [ShipName] NVARCHAR(40),
    [ShipAddress] NVARCHAR(60),
    [ShipCity] NVARCHAR(15),
    [ShipRegion] NVARCHAR(15),
    [ShipPostalCode] NVARCHAR(10),
    [ShipCountry] NVARCHAR(15),

    CONSTRAINT PK_FactOrders PRIMARY KEY ([OrderID], [ProductSK]),
    CONSTRAINT FK_Fact_Product
        FOREIGN KEY ([ProductSK]) REFERENCES [dw].[DimProduct]([ProductSK]),
    CONSTRAINT FK_Fact_Customer
        FOREIGN KEY ([CustomerSK]) REFERENCES [dw].[DimCustomer]([CustomerSK]),
    CONSTRAINT FK_Fact_Employee
        FOREIGN KEY ([EmployeeSK]) REFERENCES [dw].[DimEmployee]([EmployeeSK]),
    CONSTRAINT FK_Fact_Shipper
        FOREIGN KEY ([ShipperSK]) REFERENCES [dw].[DimShipper]([ShipperSK]),
    CONSTRAINT FK_Fact_OrderDate
        FOREIGN KEY ([OrderDateKey]) REFERENCES [dw].[DimDate]([DateKey]),
    CONSTRAINT FK_Fact_RequiredDate
        FOREIGN KEY ([RequiredDateKey]) REFERENCES [dw].[DimDate]([DateKey]),
    CONSTRAINT FK_Fact_ShippedDate
        FOREIGN KEY ([ShippedDateKey]) REFERENCES [dw].[DimDate]([DateKey])
)
GO