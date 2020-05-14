/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  field.sebastian
 * Created: Apr 4, 2020
 */

select ciam.external_id AS BAN 
       , to_char(p.chg_dt, 'DD/MM/YYYY') AS Prod_CHG_Dt 
       , c.owning_cost_ctr AS OCC 
       , ciam179.external_id as MASTER_NAME 
       , c.BILL_COMPANY as BAN_NAME 
       , ciem.external_id AS Service_ID 
       , sed164.param_value as SI_Unique 
       , ped164.param_value as SE_Unique 
       , decode(ss.status_id, 1,'Active',2,'Disconnected',3,'Suspended',4,'Transferred Out',5,'Transferred In', 'Other') as Service_Status 
       , ced185.param_value AS Agreement_Currency 
       , rc3.short_display AS Billing_Currency 
       , decode(c.no_bill, 1, 'Suppress', 'No') as Suppress 
       , decode(s.no_bill, 1, 'NO BILL', 'No') AS srv_NO_BILL 
       , ced205.param_value AS BAN_Modality 
      ,case P.IN_ARREARS_OVERRIDE 
           when 0 then 'Advance' 
           when 1 then 'Arrears' 
           else 'Advance' 
      end as Arrears_Product 
       ,case when ced185.param_value = 'CLP' then pro.override_rate else pro.override_rate / 100 end as Amount 
       ,c.bill_period  as Cycle 
       ,to_char(p.billing_active_dt, 'DD/MM/YYYY') as Product_ACT 
       ,to_char(p.product_inactive_dt , 'DD/MM/YYYY') as Product_INCTV 
       ,to_char(pcm.billed_thru_dt , 'DD/MM/YYYY') as kenanbilledthrudate 
       ,ped133.param_value as GRUPO_PERTENENCIA 
       ,d2.description_text AS ServicePartNumber 
       ,d.description_text AS charge_description 
    ,nvl(sed165.param_value, s.EMF_CONFIG_ID) as SI_CATALOG 
    ,sed166.param_value as SI_DESCRIPTION  
    ,ped165.param_value as SE_CATALOG 
    ,ped166.param_value as SE_DESCRIPTION 
FROM   arbor.cmf c, 
       arbor.customer_id_acct_map ciam, 
       arbor.customer_id_acct_map ciam179, 
       (select * from external_id_acct_map  eiam, cus_arbor.master_account_profile map where eiam.external_id = map.master_unique_id (+) and  eiam.external_id_type = 172 ) ciam172, 
       arbor.customer_id_equip_map ciem, 
       arbor.product p, 
       arbor.service_status ss, 
       arbor.product_elements pe, 
       arbor.product_lines pl, 
       arbor.product_rate_override pro, 
       arbor.product_charge_map pcm, 
       arbor.descriptions d,    
       arbor.descriptions d2,   
       arbor.customer_id_equip_map ciem183,     
       arbor.customer_id_equip_map ciem5,  
       (select * from cmf_ext_data where param_id = 205) ced205, 
       (select * from cmf_ext_data where param_id = 185) ced185, 
       (select * from product_ext_data where param_id = 164) ped164, 
       (select * from product_ext_data where param_id = 165) ped165, 
       (select * from product_ext_data where param_id = 166) ped166,  
       (select * from product_ext_data where param_id = 133) ped133, 
       (select * from service_ext_data where param_id = 164) SED164,  
       (select * from service_ext_data where param_id = 165) SED165,  
       (select * from service_ext_data where param_id = 166) SED166,  
       (select * from  arbor.RATE_CURRENCY_VALUES where language_code=1) rc3, 
       arbor.service s 
where  c.account_no = ciam.account_no 
   AND ciam.external_id_type = 1 
   AND ciam.is_current = 1 
   and c.account_no = ced205.account_no (+) 
   and c.account_no = ced185.account_no (+) 
   AND c.account_no = ciam179.account_no(+) 
   AND ciam179.external_id_type(+) = 179 
   AND c.account_no = ciam172.account_no(+) 
   AND ciam172.external_id_type(+) = 172 
   AND c.account_no = s.parent_account_no 
   AND s.subscr_no = ciem.subscr_no (+) 
   AND ciem.is_current = 1 
   AND ciem.external_id_type = 1 
   AND p.parent_subscr_no=s.subscr_no   
   AND p.parent_subscr_no_resets=s.subscr_no_resets 
   AND p.parent_subscr_no_resets=ciem.subscr_no_resets 
   AND p.element_id = pe.element_id 
   AND pe.product_line_id = pl.product_line_id(+) 
   AND p.tracking_id = pro.tracking_id(+) 
   AND p.tracking_id_serv = pro.tracking_id_serv(+) 
   AND p.tracking_id = pcm.tracking_id 
   AND p.tracking_id_serv = pcm.tracking_id_serv 
   AND pe.description_code = d.description_code 
   AND s.SUBSCR_NO = ss.SUBSCR_NO  (+) 
   AND s.subscr_no_resets = ss.subscr_no_resets (+) 
   AND d.language_code (+) = 1   
   AND pl.description_code = d2.description_code(+) 
   AND d2.language_code(+) = 1  
   AND s.subscr_no = ciem5.subscr_no(+) 
   AND ciem5.external_id_type(+) = 5 
   AND ciem5.is_current(+) = 1  
   AND s.subscr_no = ciem183.subscr_no(+)    
   AND ciem183.external_id_type(+) = 183 
   AND ciem183.is_current(+) = 1   
   and P.VIEW_ID = PED164.VIEW_ID (+) 
   and P.VIEW_ID = PED165.VIEW_ID (+) 
   and P.VIEW_ID = PED166.VIEW_ID (+)  
   and P.VIEW_ID = PED133.VIEW_ID (+) 
   and S.VIEW_ID = SED164.VIEW_ID (+) 
   and S.VIEW_ID = SED165.VIEW_ID (+) 
   and S.VIEW_ID = SED166.VIEW_ID (+)    
   and c.CURRENCY_CODE =rc3.CURRENCY_CODE(+)  
   and ss.inactive_dt is null  
and ped164.param_value not in ('GUIDE V','GUIDE D') 
and (to_char(p.product_inactive_dt, 'DD/MM/YYYY')  <>  to_char(pcm.billed_thru_dt , 'DD/MM/YYYY')   
or (to_char(p.product_inactive_dt, 'DD/MM/YYYY')  <>  to_char(p.product_active_dt , 'DD/MM/YYYY')  and pcm.billed_thru_dt is null) 
or p.product_inactive_dt is null) 
and ciam.external_id = ?  