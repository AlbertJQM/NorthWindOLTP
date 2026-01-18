-- Crear la vista
CREATE VIEW [dbo].[Order_Subtotals]
AS
SELECT OrderID, CustomerID, ShipName, ShipAddress, ShipCity
FROM ORDERS;
GO

