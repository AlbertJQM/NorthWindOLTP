-- Crear vista combinada con ExtendedPrice
CREATE VIEW [dbo].[OrderDetails_Combinados_Extended]
AS
SELECT 
    od.OrderID,
    od.ProductID,
    od.UnitPrice,
    od.Quantity,
    od.Discount,
    (od.UnitPrice * od.Quantity * (1 - od.Discount)) AS ExtendedPrice
FROM 
    dbo.OrderDetails od
INNER JOIN 
    dbo.Vista_OrderDetails vo
    ON od.ProductID = vo.ProductID;
GO

