CREATE VIEW [dbo].[Order_Details_Extended]
as
SELECT OrderID, ProductID, UnitPrice,Discount
FROM OrderDetails;
GO

