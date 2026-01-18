CREATE TABLE [dbo].[Region]
(
    [RegionID] INT NOT NULL,
    [RegionDescription] NCHAR(50) NOT NULL,
    [rowversion] TIMESTAMP NULL,

    CONSTRAINT [PK_Region]
        PRIMARY KEY NONCLUSTERED ([RegionID])
);
GO
