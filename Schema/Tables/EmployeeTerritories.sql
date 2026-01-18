CREATE TABLE [dbo].[EmployeeTerritories]
(
    [EmployeeID] INT NOT NULL,
    [TerritoryID] NVARCHAR(20) NOT NULL,
    [rowversion] TIMESTAMP NULL,

    CONSTRAINT [PK_EmployeeTerritories]
        PRIMARY KEY NONCLUSTERED ([EmployeeID], [TerritoryID]),

    CONSTRAINT [FK_EmployeeTerritories_Employees]
        FOREIGN KEY ([EmployeeID])
        REFERENCES [dbo].[Employees] ([EmployeeID]),

    CONSTRAINT [FK_EmployeeTerritories_Territories]
        FOREIGN KEY ([TerritoryID])
        REFERENCES [dbo].[Territories] ([TerritoryID])
);
GO
