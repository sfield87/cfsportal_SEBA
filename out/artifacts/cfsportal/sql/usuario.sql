/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  field.sebastian
 * Created: Apr 4, 2020
 */

SELECT [lookup_id]
      ,[lookup_category]
      ,[lookup_value]
      ,[lookup_parent_id]
      ,[active]
  FROM [BillingOpsDB].[dbo].[bop_lookup_values]  lv
  where 1=1
  and lv.lookup_category = (?)
  and lv.lookup_value = (?)