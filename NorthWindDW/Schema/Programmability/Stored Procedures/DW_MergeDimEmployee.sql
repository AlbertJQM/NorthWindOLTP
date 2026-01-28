CREATE PROCEDURE [dbo].[DW_MergeDimEmployee]
AS
BEGIN
	UPDATE de
	SET  [FirstName] = sc.[FirstName]
		,[LastName] = sc.[LastName]
		,[Title] = sc.[Title]
		,[TitleOfCourtesy] = sc.[TitleOfCourtesy]
		,[BirthDate] = sc.[BirthDate]
		,[HireDate] = sc.[HireDate]
		,[Address] = sc.[Address]
		,[City] = sc.[City]
		,[Region] = sc.[Region]
		,[PostalCode] = sc.[PostalCode]
		,[Country] = sc.[Country]
		,[HomePhone] = sc.[HomePhone]
		,[Extension] = sc.[Extension]
		,[Notes] = sc.[Notes]
		,[ReportsTo] = sc.[ReportsTo]
		,[TerritoryDescription] = sc.[TerritoryDescription]
		,[RegionDescription] = sc.[RegionDescription]
	FROM [dw].[DimEmployee] de
	INNER JOIN [stg].[Employees] sc
		ON de.[EmployeeID] = sc.[EmployeeSK]
END
GO