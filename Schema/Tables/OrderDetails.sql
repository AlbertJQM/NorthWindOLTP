CREATE TABLE [dbo].[OrderDetails]
(
    [OrderID] INT NOT NULL,
    [ProductID] INT NOT NULL,
    [UnitPrice] MONEY NOT NULL
        CONSTRAINT [DF_OrderDetails_UnitPrice] DEFAULT ((0))
        CONSTRAINT [CK_OrderDetails_UnitPrice] CHECK ([UnitPrice] >= 0),
    [Quantity] SMALLINT NOT NULL
        CONSTRAINT [DF_OrderDetails_Quantity] DEFAULT ((1))
        CONSTRAINT [CK_OrderDetails_Quantity] CHECK ([Quantity] > 0),
    [Discount] REAL NOT NULL
        CONSTRAINT [DF_OrderDetails_Discount] DEFAULT ((0))
        CONSTRAINT [CK_OrderDetails_Discount] CHECK ([Discount] >= 0 AND [Discount] <= 1),
    [rowversion] TIMESTAMP NULL,

    CONSTRAINT [PK_OrderDetails]
        PRIMARY KEY CLUSTERED ([OrderID], [ProductID]),

    CONSTRAINT [FK_OrderDetails_Orders]
        FOREIGN KEY ([OrderID])
        REFERENCES [dbo].[Orders] ([OrderID]),

    CONSTRAINT [FK_OrderDetails_Products]
        FOREIGN KEY ([ProductID])
        REFERENCES [dbo].[Products] ([ProductID])
);
GO

CREATE NONCLUSTERED INDEX [IX_OrderDetails_OrderID]
    ON [dbo].[OrderDetails] ([OrderID]);
GO

CREATE NONCLUSTERED INDEX [IX_OrderDetails_ProductID]
    ON [dbo].[OrderDetails] ([ProductID]);
GO