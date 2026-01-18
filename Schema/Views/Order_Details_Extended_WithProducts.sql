CREATE   VIEW [dbo].[Order_Details_Extended_WithProducts]
AS
SELECT 
    od.OrderID,
    od.ProductID,
    p.ProductName,
    p.Discontinued,
    p.ReorderLevel,
    p.UnitsOnOrder,
    p.QuantityPerUnit,
    od.UnitPrice,
    od.Quantity,
    od.Discount,
    (od.UnitPrice * od.Quantity * (1 - od.Discount)) AS ExtendedPrice
FROM OrderDetails od
INNER JOIN Products p
    ON od.ProductID = p.ProductID;
GO

