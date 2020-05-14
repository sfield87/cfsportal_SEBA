/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  field.sebastian
 * Created: Apr 4, 2020
 */

SELECT [SUBCASE_ID] 
       ,[BAN] 
       ,[NOMBRE CLIENTE] 
       ,[OCC] 
       ,cast([Fecha Creacion] as Date)
       ,[Asignee] 
       ,[Status Bops] 
       ,[Substatus]  
       ,[Fecha Cierre Cliente] 
       ,[Comentario] 
       ,[Cantidad de Facturas] 
       ,[Creator] 
       ,[Owner] 
       ,[Status Fusion] 
       ,cast([Fecha Cierre] as Date) 
       ,[Tipo] 
  FROM [BillingOpsDB].[dbo].[sat_tickets] 
  WHERE [Status Bops] not in ('Closed','Reassigned', 'Declined')