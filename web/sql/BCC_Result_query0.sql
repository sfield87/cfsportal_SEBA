/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  field.sebastian
 * Created: Apr 4, 2020
 */

SELECT distinct 'Refacturación de Cargos'  
,0  
,ciam.external_id  
,bi.bill_ref_no   
,case 
    when bid.type_code = 3 then ((bid.to_date - 1) + (1/24)) 
    when bid.type_code = 7 then (cdb.trans_dt + (1/24))
    else ((select min(nvl(bid2.from_date, bid2.to_date)) 
                    from bill_invoice_detail bid2 
                    where BID.BILL_REF_NO = bid2.bill_ref_no 
                    and bid.tracking_id = bid2.tracking_id) + (1/24)) 
    end  
,case 
    when bid.type_code = 3 then ((bid.to_date - 1)+(1/24)) 
    when bid.type_code = 7 then ((ADD_MONTHS(cdb.trans_dt,1) - 1)+ (1/24)) 
    else ((select max(bid3.to_date-1) 
                   from bill_invoice_detail bid3 
                    where BID.BILL_REF_NO = bid3.bill_ref_no 
                    and bid.tracking_id = bid3.tracking_id)+(1/24)) 
    end     
, case 
       when bid.type_code = 7 then to_char(c.currency_code) 
       else rcv.short_display end  
, nvl(ciem.external_id, sed164.param_value)  
, case 
         when bid.type_code = 2 then  ped164.param_value 
         when bid.type_code = 3 then  ned164.param_value 
         when bid.type_code = 7 then  to_char(cdb.type_id_usg) 
   else 'Error' end  
, case 
         when bid.type_code = 2 then  ped133.param_value 
         when bid.type_code = 3 then  ned133.param_value 
         when bid.type_code = 7 then  sed206.param_value 
   else 'Error' end  
,case 
         when bid.type_code = 3 then  (nrc.rate/100) 
         when bid.type_code = 7 then  (cdb.billed_amount/100) 
         else  (pro.override_rate / 100) 
     end      
,'1' 
,case 
   when bid.type_code = 2 then 'MRC' 
   when bid.type_code = 3 then 'NRC' 
   when bid.type_code = 4 then 'ADJ' 
   when bid.type_code = 7 then 'USAGE' 
   else 'Unknown' end 
, round(1/( exchange_rate / (POWER (10, implied_decimal))),2) 
,c.bill_company 
,nvl(acct179.external_id,c.bill_company) 
,nvl(sine.invoice_no, bi.bill_ref_no) 
,(bi.statement_date)+(1/24) 
,ciem.external_id 
,des2.description_text 
,rcv2.short_display 
,occv.owning_cost_ctr || ' - ' || occv.display_value 
, case 
    when substr(sed171.param_value,1,1) = 'R' then 'Refacturacion' 
    when substr(sed171.param_value,1,1) = 'M' then 'Factura Manual' 
    when substr(sed171.param_value,1,1) = 'A' then 'Auditoria' 
    when substr(sed171.param_value,1,1) = 'D' then 'Nota Debito' 
    else 'Factura Automatica' end 
FROM cmf c, 
customer_id_acct_map ciam, 
customer_id_equip_map ciem, 
service s, 
product p, 
nrc, 
bill_invoice bi, 
bill_invoice_detail bid, 
cdr_billed cdb, 
owning_cost_ctr_values occv, 
country_code_values ccv, 
rate_currency_values rcv, 
rate_currency_values rcv2, 
descriptions des2, 
cus_arbor.seq_inv_no_ext sine, 
 (select * from service_ext_data where param_id = 171) sed171   
, invoice_latam_split_doc ilsp     
, (Select * from customer_id_acct_map ext,  cus_arbor.master_account_profile map where map.MASTER_UNIQUE_ID = ext.external_id and ext.external_id_type = 172) ciam172 
,(select * from external_id_acct_map where external_id_type = 179) acct179 
, (select * from service_ext_data where param_id = 164) sed164 
, (select * from service_ext_data where param_id = 206) sed206 
, (select * from product_ext_data where param_id = 164) ped164 
, (select * from product_ext_data where param_id = 133) ped133 
, (select * from nrc_ext_data where param_id = 164) ned164 
, (select * from nrc_ext_data where param_id = 133) ned133 
,arbor.product_rate_override pro 
WHERE     1 = 1 
and c.account_no = s.parent_account_no 
and c.account_no = bi.account_no 
and c.account_no = ciam.account_no  and ciam.external_id_type = 1 
and c.account_no = ciam172.account_no (+) 
and bi.account_no = cdb.account_no (+) 
and ciam.account_no = acct179.account_no (+)               
and bi.bill_ref_no = sine.bill_ref_no(+) 
and bi.bill_ref_no = bid.bill_ref_no 
and bi.bill_ref_no =  cdb.bill_ref_no (+) 
and bid.bill_ref_no = CASE WHEN bid.type_code = 7 THEN cdb.bill_ref_no ELSE bid.bill_ref_no end 
and bi.bill_ref_no = CASE WHEN c.owning_cost_ctr in (638, 637, 639, 642, 643, 644, 645,647, 646, 631, 634) then sine.bill_ref_no else bi.bill_ref_no   END 
and bid.type_code in (2, 3, 4, 7) 
and c.owning_cost_ctr = occv.owning_cost_ctr   and occv.language_code = 1 
and c.cust_country_code = ccv.country_code     and ccv.language_code = 1 
and s.currency_code = rcv.currency_code      and rcv.language_code = 1 
and bi.currency_code = rcv2.currency_code      and rcv2.language_code = 1 
and bid.subscr_no = s.subscr_no 
and ciem.subscr_no = bid.subscr_no 
and ciem.subscr_no_resets = bid.subscr_no_resets  and ciem.external_id_type = 1 
and bid.description_code = des2.description_code  and des2.language_code = 1 
and s.view_id = sed171.view_id (+) 
and s.subscr_no = CASE WHEN bid.type_code = 2 THEN p.parent_subscr_no 
                        WHEN bid.type_code = 3 THEN nrc.parent_subscr_no 
                        WHEN bid.type_code = 7 THEN cdb.subscr_no 
                        ELSE  s.subscr_no 
                        END 
and sine.INVOICEDOCUMENTID = ilsp.INVOICEDOCUMENTID (+)   
and bid.bill_invoice_row = CASE 
     WHEN occv.owning_cost_ctr in (638, 637, 639, 642, 643, 644, 645,647) and sine.status is not null then ilsp.bill_invoice_row 
     WHEN occv.owning_cost_ctr in (638, 637, 639, 642, 643, 644, 645,647) and sine.status is  null then bid.bill_invoice_row 
     WHEN occv.owning_cost_ctr in (646, 631, 634) and sine.doc_type = 'CM' and bid.amount < 0 then bid.bill_invoice_row 
     WHEN occv.owning_cost_ctr in (646, 631, 634) and sine.doc_type = 'INV' and bid.amount > 0 then bid.bill_invoice_row 
     WHEN occv.owning_cost_ctr in (273, 641,625) then bid.bill_invoice_row 
else bid.bill_invoice_row  END 
and bid.tracking_id = p.tracking_id (+) 
and bid.tracking_id = nrc.tracking_id (+) 
and p.view_id = ped164.view_id (+) 
and p.view_id = ped133.view_id (+) 
and s.view_id = sed164.view_id (+) 
and s.view_id = sed206.view_id (+) 
and nrc.view_id = ned133.view_id (+) 
and nrc.view_id = ned164.view_id (+) 
AND p.tracking_id = pro.tracking_id(+) 
AND p.tracking_id_serv = pro.tracking_id_serv(+) 
 and bi.prep_status = 1       
 and bi.backout_status = 0    
 and bid.amount > 0 
 and bi.bill_ref_no in ( 