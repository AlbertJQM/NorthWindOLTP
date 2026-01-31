CREATE TABLE [dw].[FactOrders]
(
	[OrderID] INT NOT NULL,
    [ProductID] INT NOT NULL,
    [ProductSK] INT,
    [CustomerSK] INT,
    [EmployeeSK] INT,
    [ShipperSK] INT,

    [OrderDateKey] INT NULL,
    [RequiredDateKey] INT NULL,
    [ShippedDateKey] INT NULL,

    [OrderDate] DATE NULL,
    [RequiredDate] DATE NULL,
    [ShippedDate] DATE NULL,
    
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

    CONSTRAINT PK_FactOrders PRIMARY KEY ([OrderID], [ProductID]),
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