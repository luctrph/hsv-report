
select sum(tt1)+sum(tt2)-sum(tt3) as kq, sum(tienmua) as  tienmua, sum(tiendau) as tiendau,sum(tienda) as tienda
FROM(
select  tt as tt1,0 as tt2,0 as tt3,0 as  tienmua, 0 as tiendau,0 as tienda
FROM(
select sum(civ.qtyinvoiced)as sl,sum(linenetamt) as tt
from c_invoiceline civ
JOIN c_invoice ci on ci.c_invoice_id= civ.c_invoice_id 
JOIN m_product hh ON hh.m_product_id = civ.m_product_id 
 JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.lot IS NOT NULL
 JOIN m_lot lo ON lo.name = att.lot AND ci.dateacct >= '01-01-2019' AND ci.dateacct <= '07-01-2019' 
 AND (lo.M_Lot_ID = 1002387 OR 1002387 IS NULL) 
where ci.ad_client_id=1000023 and ci.docstatus in ('CO','CL') and ci.issotrx='Y' 
) as k

UNION ALL
select  0 as tt1, sl * dg as tt2, 0 as tt3, 0 as  tienmua, 0 as tiendau,0 as tienda
from (
        select lo.name as lo,hh.name as noidung,attv.name as thuoctinh  , sum(civ.productionqty)  as sl, attv.hsv_dinhmuc as dg
        from m_productionplan civ 
        join m_production ci on ci.m_production_id = civ.m_production_id and ci.docstatus IN ('CO', 'CL') 
        JOIN m_product hh on civ.m_product_id = hh.m_product_id 
        JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id   
        JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id
        JOIN m_lot lo on lo.m_lot_id = civ.m_lot_id
        where civ.ad_client_id = 1000023  AND (civ.M_Lot_ID = 1002387 OR 1002387 IS NULL)  AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-01-2019' 
        group by lo.name,hh.name,attv.name, attv.hsv_dinhmuc
        ) as k
        UNION ALL
        SELECT   0 as tt1, 0 as tt2,tienmua+tiendau+tienda as tt3,tienmua,tiendau,tienda
        FROM(
        SELECT 
        sum(CASE WHEN ci.issotrx = 'N' THEN civ.linenetamt ELSE 0  END) AS tienmua, sum(lo.hsv_dinhmuc) as tiendau,sum(lo.hsv_dinhmuc1) as tienda
            FROM c_invoiceline  civ 
            JOIN  c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id   AND ci.docstatus IN ('CO', 'CL') 
            JOIN m_product hh ON hh.m_product_id = civ.m_product_id 
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.lot IS NOT NULL
            JOIN m_lot lo ON lo.name = att.lot AND ci.dateacct >= '01-01-2019' AND ci.dateacct <= '07-01-2019' 
            AND (lo.M_Lot_ID = 1002387 OR 1002387 IS NULL) 
            WHERE civ.ad_client_id=1000023
            ) as k
     ) as k
            
            