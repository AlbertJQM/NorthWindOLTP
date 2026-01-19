/*
Plantilla de script posterior a la implementación							
--------------------------------------------------------------------------------------
 Este archivo contiene instrucciones de SQL que se anexarán al script de compilación.		
 Use la sintaxis de SQLCMD para incluir un archivo en el script posterior a la implementación.			
 Ejemplo:      :r .\miArchivo.sql								
 Use la sintaxis de SQLCMD para hacer referencia a una variable en el script posterior a la implementación.		
 Ejemplo:      :setvar TableName miTabla							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
:r .\clean.data.sql
:r .\00-insert-Categories.sql
:r .\01-insert-Customers.sql
:r .\02-insert-Employees.sql
:r .\03-insert-Region.sql
:r .\04-insert-Territories.sql
:r .\05-insert-EmployeeTerritories.sql
:r .\06-insert-Shippers.sql
:r .\07-insert-Suppliers.sql
:r .\08-insert-Products.sql
:r .\09-insert-Orders.sql
:r .\10-insert-OrderDetails.sql