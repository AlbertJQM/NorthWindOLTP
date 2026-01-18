CREATE TABLE [dbo].[Orders]
(
    [OrderID] INT IDENTITY(1,1) NOT NULL,
    [CustomerID] NCHAR(5) NULL,
    [EmployeeID] INT NULL,
    [OrderDate] DATETIME NULL,
    [RequiredDate] DATETIME NULL,
    [ShippedDate] DATETIME NULL,
    [ShipVia] INT NULL,
    [Freight] MONEY NULL
        CONSTRAINT [DF_Orders_Freight] DEFAULT ((0)),
    [ShipName] NVARCHAR(40) NULL,
    [ShipAddress] NVARCHAR(60) NULL,
    [ShipCity] NVARCHAR(15) NULL,
    [ShipRegion] NVARCHAR(15) NULL,
    [ShipPostalCode] NVARCHAR(10) NULL,
    [ShipCountry] NVARCHAR(15) NULL,
    [rowversion] TIMESTAMP NULL,

    CONSTRAINT [PK_Orders]
        PRIMARY KEY CLUSTERED ([OrderID]),

    CONSTRAINT [FK_Orders_Customers]
        FOREIGN KEY ([CustomerID])
        REFERENCES [dbo].[Customers] ([CustomerID]),

    CONSTRAINT [FK_Orders_Employees]
        FOREIGN KEY ([EmployeeID])
        REFERENCES [dbo].[Employees] ([EmployeeID]),

    CONSTRAINT [FK_Orders_Shippers]
        FOREIGN KEY ([ShipVia])
        REFERENCES [dbo].[Shippers] ([ShipperID])
);
GO

CREATE NONCLUSTERED INDEX [IX_Orders_CustomerID]
    ON [dbo].[Orders] ([CustomerID]);
GO

CREATE NONCLUSTERED INDEX [IX_Orders_EmployeeID]
    ON [dbo].[Orders] ([EmployeeID]);
GO

CREATE NONCLUSTERED INDEX [IX_Orders_OrderDate]
    ON [dbo].[Orders] ([OrderDate]);
GO

CREATE NONCLUSTERED INDEX [IX_Orders_ShippedDate]
    ON [dbo].[Orders] ([ShippedDate]);
GO

CREATE NONCLUSTERED INDEX [IX_Orders_ShipVia]
    ON [dbo].[Orders] ([ShipVia]);
GO

CREATE NONCLUSTERED INDEX [IX_Orders_ShipPostalCode]
    ON [dbo].[Orders] ([ShipPostalCode]);
GO