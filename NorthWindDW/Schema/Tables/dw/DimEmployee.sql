CREATE TABLE [dw].[DimEmployee]
(
	[EmployeeSK] INT IDENTITY PRIMARY KEY,
    [EmployeeID] INT,
    [FirstName] NVARCHAR(10),
    [LastName] NVARCHAR(20),
    [Title] NVARCHAR(30),
    [TitleOfCourtesy] NVARCHAR(25),
    [BirthDate] DATETIME,
    [HireDate] DATETIME,
    [Address] NVARCHAR(60),
    [City] NVARCHAR(15),
    [Region] NVARCHAR(15),
    [PostalCode] NVARCHAR(10),
    [Country] NVARCHAR(15),
    [HomePhone] NVARCHAR(24),
    [Extension] NVARCHAR(4),
    [Notes] NVARCHAR(MAX),
    [ReportsTo] INT,
    [TerritoryDescription] NVARCHAR(50),
    [RegionDescription] NVARCHAR(50)
)
GO