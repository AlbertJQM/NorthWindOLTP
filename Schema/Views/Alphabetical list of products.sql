CREATE VIEW [dbo].[Alphabetical list of products]
	AS 
	SELECT 	
       Products.[ProductID]
      ,Products.[ProductName]
      ,Products.[SupplierID]
      ,Products.[CategoryID]
      ,Products.[QuantityPerUnit]
      ,Products.[UnitPrice]
      ,Products.[UnitsInStock]
      ,Products.[UnitsOnOrder]
      ,Products.[ReorderLevel]
      ,Products.[Discontinued]
      ,Products.[rowversion]
      ,Categories.[CategoryName]
FROM Categories INNER JOIN Products ON Categories.CategoryID = Products.CategoryID
WHERE (((Products.Discontinued)=0))
