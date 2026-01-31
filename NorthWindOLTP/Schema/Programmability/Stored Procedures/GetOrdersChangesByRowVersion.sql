CREATE PROCEDURE dbo.GetOrdersChangesByRowVersion
(
    @startRow BIGINT,
    @endRow   BIGINT
)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        o.OrderID,
        od.ProductID,

        o.CustomerID,
        o.EmployeeID,
        o.ShipVia      AS ShipperID,

        OrderDateKey =
            CONVERT(INT,
                CONVERT(CHAR(4), DATEPART(YEAR, o.OrderDate)) +
                RIGHT('0' + CONVERT(VARCHAR(2), DATEPART(MONTH, o.OrderDate)), 2) +
                RIGHT('0' + CONVERT(VARCHAR(2), DATEPART(DAY, o.OrderDate)), 2)
            ),

        RequiredDateKey =
            CONVERT(INT,
                CONVERT(CHAR(4), DATEPART(YEAR, o.RequiredDate)) +
                RIGHT('0' + CONVERT(VARCHAR(2), DATEPART(MONTH, o.RequiredDate)), 2) +
                RIGHT('0' + CONVERT(VARCHAR(2), DATEPART(DAY, o.RequiredDate)), 2)
            ),

        ShippedDateKey =
            CASE
                WHEN o.ShippedDate IS NULL THEN 0
                ELSE CONVERT(INT,
                    CONVERT(CHAR(4), DATEPART(YEAR, o.ShippedDate)) +
                    RIGHT('0' + CONVERT(VARCHAR(2), DATEPART(MONTH, o.ShippedDate)), 2) +
                    RIGHT('0' + CONVERT(VARCHAR(2), DATEPART(DAY, o.ShippedDate)), 2)
                )
            END,
        OrderDate = CONVERT(DATE, o.OrderDate),
        RequiredDate = CONVERT(DATE, o.RequiredDate),
        ShippedDate = CONVERT(DATE, o.ShippedDate),
        o.Freight,
        o.ShipName,
        o.ShipAddress,
        o.ShipCity,
        o.ShipRegion,
        o.ShipPostalCode,
        o.ShipCountry,

        od.UnitPrice,
        od.Quantity,
        od.Discount

    FROM dbo.Orders o
    INNER JOIN dbo.OrderDetails od
        ON o.OrderID = od.OrderID

    WHERE
        (
            o.[rowversion] > CONVERT(ROWVERSION, @startRow)
            AND o.[rowversion] <= CONVERT(ROWVERSION, @endRow)
        )
        OR
        (
            od.[rowversion] > CONVERT(ROWVERSION, @startRow)
            AND od.[rowversion] <= CONVERT(ROWVERSION, @endRow)
        );
END
GO