# NorthWind OLAP

<center>
	<img src = "https://i.ibb.co/Z11PjtTF/Power-BI-North-Wind.png">
</center>


## Categorizaciones y Métricas – Modelo OLAP Northwind

Este documento describe las categorizaciones (columnas calculadas) y métricas (medidas DAX) implementadas sobre la tabla de hechos Orders, utilizadas en el modelo SSAS Tabular / OLAP.

### Categorizaciones en la tabla de hechos

| Categorización           | Tipo              | Columnas utilizadas                 | Lógica de cálculo                                           | Valores posibles                  |
| ---------------------    | ----------------- | ----------------------------------- | ----------------------------------------------------------- | --------------------------------- |
| **GrossSales**           | Cálculo base      | `UnitPrice`, `Quantity`			 | `UnitPrice * Quantity`     				 	               | Valor numérico                    |
| **DiscountSales**        | Columna calculada | `GrossSales`, `Discount`  		  	 | `GrossSales * Discount`				                       | Valor numérico                    |
| **NetSales**             | Cálculo calculada | `GrossSales`, `DiscountSales`		 | `GrossSales - DiscountSales`                     		   | Valor numérico                    |
| **CategorySale**    	   | Columna calculada | `NetSales`						  	 | `< 100 → Baja<br>< 500 → Media<br>≥ 500 → Alta`             | Venta Baja / Media / Alta         |
| **CategoryQuantitySold** | Columna calculada | `Quantity`                          | `= 1 → Unidad<br>2–5 → Pocas Unidades<br>> 5 → Volumen`     | Unidad / Pocas Unidades / Volumen |
| **HasDiscount**          | Columna calculada | `Discount`                          | `Discount > 0`                                              | Con Descuento / Sin Descuento     |
| **TypeDiscount**         | Columna calculada | `Discount`                          | `= 0 → Sin<br>≤ 5% → Bajo<br>≤ 15% → Medio<br>> 15% → Alto` | Sin / Bajo / Medio / Alto         |
| **ShippingStatus**       | Columna calculada | `ShippedDateKey`                    | `= 0 → No Enviado`                                          | Enviado / No Enviado              |
| **ShippingCompliance**   | Columna calculada | `ShippedDateKey`, `RequiredDateKey` | `<= Required → A Tiempo<br>> Required → Retrasado`          | A Tiempo / Retrasado / Pendiente  |
| **CategoryShippingCost** | Columna calculada | `Freight`                           | `< 50 → Bajo<br>< 150 → Medio<br>≥ 150 → Alto`              | Sin / Bajo / Medio / Alto         |

### Métricas (Medidas DAX)

Las siguientes métricas se construyen sobre la tabla de hechos y pueden analizarse utilizando las categorizaciones anteriores.

| Métrica                 | Tipo   | Fórmula base                                  | Uso                             |
| ----------------------- | ------ | --------------------------------------------- | ------------------------------- |
| **TotalQuantity**       | Medida | `SUM(Quantity)`                               | Demanda de productos            |
| **TotalGrossSales**     | Medida | `SUMX(GrossSales)`                            | Volumen total de ventas         |
| **TotalNetSales**       | Medida | `SUMX(NetSales)`                              | Ingreso real                    |
| **TotalOrders**         | Medida | `DISTINCTCOUNT(OrderID)`                      | Flujo de pedidos                |
| **TotalDiscountSales**  | Medida | `SUMX(DiscountSales)`                         | Costo de descuentos             |
| **AVGDiscount**         | Medida | `AVERAGE(Discount)`                           | Promedio de descuentos          |
| **AVGProductsOrder**    | Medida | `DIVIDE(TotalQuantity, TotalOrders)`          | Promedio de productos por venta |

## Nota de diseño
```
Las categorizaciones se implementan como columnas calculadas, mientras que las métricas se implementan como medidas DAX.
Este enfoque mantiene el modelo limpio, eficiente y alineado con las buenas prácticas OLAP.
```