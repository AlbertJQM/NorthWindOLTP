CREATE TABLE [dbo].[Products]
(
    [ProductID] INT IDENTITY(1,1) NOT NULL,
    [ProductName] NVARCHAR(40) NOT NULL,
    [SupplierID] INT NULL,
    [CategoryID] INT NULL,
    [QuantityPerUnit] NVARCHAR(20) NULL,
    [UnitPrice] MONEY NULL 
        CONSTRAINT [DF_Products_UnitPrice] DEFAULT ((0))
        CONSTRAINT [CK_Products_UnitPrice] CHECK ([UnitPrice] >= 0),
    [UnitsInStock] SMALLINT NULL 
        CONSTRAINT [DF_Products_UnitsInStock] DEFAULT ((0))
        CONSTRAINT [CK_UnitsInStock] CHECK ([UnitsInStock] >= 0),
    [UnitsOnOrder] SMALLINT NULL 
        CONSTRAINT [DF_Products_UnitsOnOrder] DEFAULT ((0))
        CONSTRAINT [CK_UnitsOnOrder] CHECK ([UnitsOnOrder] >= 0),
    [ReorderLevel] SMALLINT NULL 
        CONSTRAINT [DF_Products_ReorderLevel] DEFAULT ((0))
        CONSTRAINT [CK_ReorderLevel] CHECK ([ReorderLevel] >= 0),
    [Discontinued] BIT NOT NULL 
        CONSTRAINT [DF_Products_Discontinued] DEFAULT ((0)),
    [rowversion] TIMESTAMP NULL,

    CONSTRAINT [PK_Products] 
        PRIMARY KEY CLUSTERED ([ProductID]),

    CONSTRAINT [FK_Products_Categories] 
        FOREIGN KEY ([CategoryID]) 
        REFERENCES [dbo].[Categories] ([CategoryID]),

    CONSTRAINT [FK_Products_Suppliers] 
        FOREIGN KEY ([SupplierID]) 
        REFERENCES [dbo].[Suppliers] ([SupplierID])
);
GO

CREATE NONCLUSTERED INDEX [IX_Products_CategoryID]
    ON [dbo].[Products] ([CategoryID]);
GO

CREATE NONCLUSTERED INDEX [IX_Products_SupplierID]
    ON [dbo].[Products] ([SupplierID]);
GO

CREATE NONCLUSTERED INDEX [IX_Products_ProductName]
    ON [dbo].[Products] ([ProductName]);
GO