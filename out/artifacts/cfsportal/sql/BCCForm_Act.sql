/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 * Author:  field.sebastian
 * Created: Apr 4, 2020
 */

SELECT  ciam.external_id 
        , occv.owning_cost_ctr 
        , rcv2.short_display 
        , case  
            when c.owning_cost_ctr in (646, 631, 634) then c.bill_company  
            else acct179.external_id  
            end  
       , c.bill_company  
        , nvl(sine.invoice_no, bi.bill_ref_no)  
                , bi.BILL_REF_NO 
        , to_char(bi.prep_date, 'DD/MM/YYYY') 
        , sum(bid.amount / 100 + bid.tax /100 + bid.discount / 100) 
        , sum(bid.operating_amount / 100 + bid.operating_tax /100 + bid.operating_discount / 100)  
        , sine.status  
FROM cmf c, 
       customer_id_acct_map ciam, 
       bill_invoice bi, 
       bill_invoice_detail bid, 
       owning_cost_ctr_values occv, 
       country_code_values ccv, 
       rate_currency_values rcv2, 
       descriptions des2, 
       cus_arbor.seq_inv_no_ext sine 
      , invoice_latam_split_doc ilsp     
      , (Select * from customer_id_acct_map ext,  cus_arbor.master_account_profile map where map.MASTER_UNIQUE_ID = ext.external_id and ext.external_id_type = 172) ciam172 
      ,(select * from external_id_acct_map where external_id_type = 179 and inactive_date is null) acct179 
WHERE     1 = 1 
       and c.account_no = ciam.account_no 
   and c.account_no = bi.account_no 
   and c.account_no = ciam172.account_no (+) 
       and c.account_no = acct179.account_no (+) 
       and c.owning_cost_ctr = occv.owning_cost_ctr   and occv.language_code = 1 
       and c.owning_cost_ctr in (273, 634, 646, 631, 637, 638, 639, 641, 642, 643, 644, 645, 647, 625) 
       and c.cust_country_code = ccv.country_code     and ccv.language_code = 1 
       and bi.bill_ref_no = sine.bill_ref_no(+) 
       and bi.bill_ref_no = bid.bill_ref_no 
       and bi.currency_code = rcv2.currency_code      and rcv2.language_code = 1 
       and bid.type_code in (2, 3, 4, 7) 
       and ciam.external_id_type = 1 
       and bid.description_code = des2.description_code  and des2.language_code = 1 
       and bid.bill_invoice_row = CASE  
            WHEN c.owning_cost_ctr in (638, 637, 639, 642, 643, 644, 645,647) and sine.status is not null then ilsp.bill_invoice_row 
            WHEN c.owning_cost_ctr in (638, 637, 639, 642, 643, 644, 645,647) and sine.status is  null then bid.bill_invoice_row 
            WHEN c.owning_cost_ctr in (646, 631, 634) and sine.doc_type = 'CM' and bid.amount < 0 then bid.bill_invoice_row 
            WHEN c.owning_cost_ctr in (646, 631, 634) and sine.doc_type = 'INV' and bid.amount > 0 then bid.bill_invoice_row 
            WHEN c.owning_cost_ctr in (646, 631, 634) and sine.doc_type is null and bid.amount < 0 then bid.bill_invoice_row 
            WHEN c.owning_cost_ctr in (646, 631, 634) and sine.doc_type is null and bid.amount > 0 then bid.bill_invoice_row 
            WHEN c.owning_cost_ctr in (273, 641,625) then bid.bill_invoice_row 
       else  null  END 
       and sine.INVOICEDOCUMENTID = ilsp.INVOICEDOCUMENTID (+) 
        and bi.prep_status = 1             
        and bi.backout_status = 0 
        and ciam.external_id in ( ? ) 
        and (bid.amount + bid.tax) > 0 
group by  occv.owning_cost_ctr 
        , ciam.external_id 
        , to_char(bi.prep_date, 'DD/MM/YYYY') 
        , rcv2.short_display  
        , case  
            when c.owning_cost_ctr in (646, 631, 634) then c.bill_company  
            else acct179.external_id  
            end  
       , c.bill_company  
        , nvl(sine.invoice_no, bi.bill_ref_no)  
        , sine.status 
        , bi.BILL_REF_NO  