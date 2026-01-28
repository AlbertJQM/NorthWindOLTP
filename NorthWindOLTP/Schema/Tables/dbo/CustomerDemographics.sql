CREATE TABLE [dbo].[CustomerDemographics]
(
    [CustomerTypeID] NCHAR(10) NOT NULL,
    [CustomerDesc] NVARCHAR(MAX) NULL,
    [rowversion] TIMESTAMP NULL,

    CONSTRAINT [PK_CustomerDemographics]
        PRIMARY KEY NONCLUSTERED ([CustomerTypeID])
) TEXTIMAGE_ON [PRIMARY];
GO