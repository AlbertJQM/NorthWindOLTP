CREATE PROCEDURE [dbo].[TenMostExpensiveProducts]
AS
    BEGIN
        SET NOCOUNT ON;

        SELECT TOP (10)
            P.ProductName
            ,P.UnitPrice
        FROM dbo.Products P
        ORDER BY P.UnitPrice DESC;
    END
RETURN 0
GO
