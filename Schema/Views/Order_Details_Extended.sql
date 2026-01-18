USE [NorthWindOLTP]
GO

/****** Object:  View [dbo].[Order_Details_Extended]    Script Date: 18/01/2026 19:31:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[Order_Details_Extended]
as
SELECT OrderID, ProductID, UnitPrice,Discount
FROM OrderDetails;
GO

