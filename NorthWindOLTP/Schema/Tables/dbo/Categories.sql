CREATE TABLE [dbo].[Categories] 
(
    [CategoryID] INT IDENTITY(1,1) NOT NULL,
    [CategoryName] NVARCHAR(15) NOT NULL,
    [Description] NVARCHAR(MAX) NULL,
    [Picture] IMAGE NULL,
    [rowversion] TIMESTAMP NULL,

    CONSTRAINT [PK_Categories]
        PRIMARY KEY CLUSTERED ([CategoryID])
) TEXTIMAGE_ON [PRIMARY];
GO

CREATE NONCLUSTERED INDEX [IX_Categories_CategoryName]
    ON [dbo].[Categories] ([CategoryName]);
GO