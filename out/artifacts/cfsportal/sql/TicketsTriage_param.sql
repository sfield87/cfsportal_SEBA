/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  field.sebastian
 * Created: Apr 4, 2020
 */

select att.[Create Date] 
                           , att.Ticket 
                           , att.Condition 
                           , att.[Billing Account] 
                           , att.[Customer Name] 
                           , att.[OCC Code] 
                           , att.[Case Subtype] 
                           , att.[Case Subtype Detail] 
                           , att.[Case Title] 
                           , att.Assigned 
                           , att.[Current QUEUE] 
                           , att.[Contact Mail] 
                           , att.Assignments 
                           , att.[Invoice Validation] 
                           , att.[Mail Validation] 
                           , att.[Open Case Validation] 
                           , '||||||||||||||||||||||||' 'VARIABLES' 
                           , dbo.[vaValidOpenCases](Ticket) 'Open Case New Validation' 
                           , isnull([dbo].[ExistingAssignee](Ticket), 'N/A') 'Existing Assignee Find'  
                           , [dbo].[GetSegment](att.[Billing Account]) 'Segmento' 
                           , CASE  
                                  WHEN   [Invoice Validation] = 'OK'  
                                               and [Mail Validation] = 'OK' 
                                               and [Open Case Validation]<>'Existing Ticket' 
                                               AND [Assignments]<>'Not Assigned' 
                                               AND [BillingOpsDB].[dbo].[GetSegment]([Billing Account]) = 'Pool'  COLLATE Modern_Spanish_CI_AS   
                                               THEN 'CANDIDATE' 
                                               ELSE 'CHECK VALIDATIONS' 
                                  END as 'Final Status' 
                     from BillingOpsDB.dbo.arb_tickets_triage att   
                     WHERE 1=1  and att.Ticket = ? 
                     AND [Assigned]= 0 
                     AND [Condition] = 'Open-Dispatch' 
                     order by [Create Date]