/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  field.sebastian
 * Created: Apr 4, 2020
 */

SELECT sti.[Ticket] 
      ,sti.[BAN] 
      ,sti.[BRN] 
      ,sti.[Invoice No] 
      ,sti.[Credit ID] 
      ,sti.[LastUpdate] 
      ,sti.[Status] 
      ,st.[NOMBRE CLIENTE]
      ,st.[Creator] 
  FROM [BillingOpsDB].[dbo].[sat_tickets_invoices] sti 
inner join sat_tickets st ON sti.Ticket = SUBSTRING(st.SUBCASE_ID,1,8)
  WHERE 1=1 
  and sti.Ticket = ?