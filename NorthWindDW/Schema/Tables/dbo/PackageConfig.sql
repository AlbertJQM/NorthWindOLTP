CREATE TABLE [dbo].[PackageConfig]
(
	[PackageID] INT IDENTITY(1,1) PRIMARY KEY,
    [TableName] VARCHAR(50) NOT NULL,
    [LastRowVersion] BIGINT NULL
)
GO