USE [NorthWindOLTP]
GO

/****** Object:  View [dbo].[Order_Subtotals]    Script Date: 18/01/2026 19:33:13 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- Crear la vista
CREATE VIEW [dbo].[Order_Subtotals]
AS
SELECT OrderID, CustomerID, ShipName, ShipAddress, ShipCity
FROM ORDERS;
GO

