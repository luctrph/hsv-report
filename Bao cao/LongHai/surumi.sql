SELECT * FROM (
SELECT 'I' AS nhom,k.description, k.name,k.hsv_dinhmuc,k.id,round(k.qty,0) AS qty,round(k.tt,0) AS tt,  round(k.dg,0) AS dg FROM
(
SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value AS id, k.qty, NULL::int4 AS tt, NULL::int4  AS dg
FROM (
    SELECT '1' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 AND hh.M_Product_ID=1016903
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
	) AS k
RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.idSELECT id , tp.name, round(sum(a4)-(sum(a6)+sum(a36)-sum(a37)),0) AS a41
FROM(
SELECT '41' AS  id, sum(dg) AS a36, 0 AS a6, 0 AS a37, 0 AS a4
FROM(

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '8' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='07-31-2019'
UNION ALL
    SELECT '8' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value='6213'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019'
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '8'
  
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '14' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='07-31-2019'
   
UNION ALL
    SELECT '14' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value='6221'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019'
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '14'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '15' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='07-31-2019'
   UNION ALL
    SELECT '15' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value='6223'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019'
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '15'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
 
    SELECT '16' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='07-31-2019'
UNION ALL
    SELECT '16' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value='6271'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019'
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '16'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    
    SELECT '17' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='07-31-2019'
UNION ALL
    SELECT '17' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value='6272'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019'
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '17'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
  
    SELECT '21' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='07-31-2019'
UNION ALL
    SELECT '21' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value='6273'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019'
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '21'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
   
    SELECT '22' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='07-31-2019'
UNION ALL
    SELECT '22' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value='6274'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019'
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '22'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    
    SELECT '23' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='07-31-2019'
UNION ALL
    SELECT '23' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value='6275'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019'
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '23'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    
    SELECT '24' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='07-31-2019'
UNION ALL
    SELECT '24' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6276'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019'
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '24'
UNION ALL


SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    
    SELECT '29' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='07-31-2019'
UNION ALL
    SELECT '29' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6277'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019'
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '29'


UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (

    SELECT '30' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='07-31-2019'
	
	UNION ALL
    SELECT '30' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6278'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019'
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '30'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '31' AS id,sum(qtyinvoiced) AS qty,0 AS tt FROM c_invoice ci 
    JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND civ.m_product_id = 1015088 AND ci.issotrx = 'Y'
    WHERE ci.docstatus IN ('CO','CL') AND ci.dateacct>='01-01-2019' AND ci.dateacct<='07-31-2019'
    UNION ALL
    SELECT '31' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6411'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019'
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '31'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '32' AS id,sum(qtyinvoiced) AS qty,0 AS tt FROM c_invoice ci 
    JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND civ.m_product_id = 1015088 AND ci.issotrx = 'Y'
    WHERE ci.docstatus IN ('CO','CL') AND ci.dateacct>='01-01-2019' AND ci.dateacct<='07-31-2019'
UNION ALL
    SELECT '32' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6417'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019'
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '32'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
 SELECT '33' AS id,sum(qtyinvoiced) AS qty,0 AS tt FROM c_invoice ci 
    JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND civ.m_product_id = 1015088 AND ci.issotrx = 'Y'
    WHERE ci.docstatus IN ('CO','CL') AND ci.dateacct>='01-01-2019' AND ci.dateacct<='07-31-2019'UNION ALL
    SELECT '33' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6418'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019'
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '33'

UNION ALL


SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, CASE WHEN tp.hsv_dinhmuc1 <> 0 AND tp.hsv_dinhmuc1 IS NOT NULL  THEN k.tt*hsv_dinhmuc1/100 ELSE 0 END AS tt,  CASE WHEN k.qty<>0 AND hsv_dinhmuc1<>0 AND hsv_dinhmuc1 IS NOT NULL THEN round((k.tt*hsv_dinhmuc1) / (k.qty*100),0) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '34' AS id,sum(qtyinvoiced) AS qty,0 AS tt FROM c_invoice ci 
    JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND civ.m_product_id = 1015088 AND ci.issotrx = 'Y'
    WHERE ci.docstatus IN ('CO','CL') AND ci.dateacct>='01-01-2019' AND ci.dateacct<='07-31-2019'
    UNION ALL
    SELECT '34' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6421' 
	WHERE  fc.ad_client_id = 1000019 AND  fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019'
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '34'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, CASE WHEN tp.hsv_dinhmuc1 <> 0 AND tp.hsv_dinhmuc1 IS NOT NULL  THEN k.tt*hsv_dinhmuc1/100 ELSE 0 END AS tt,  CASE WHEN k.qty<>0 AND hsv_dinhmuc1<>0 AND hsv_dinhmuc1 IS NOT NULL THEN round((k.tt*hsv_dinhmuc1) / (k.qty*100),0) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '35' AS id,sum(qtyinvoiced) AS qty,0 AS tt FROM c_invoice ci 
    JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND civ.m_product_id = 1015088 AND ci.issotrx = 'Y'
    WHERE ci.docstatus IN ('CO','CL') AND ci.dateacct>='01-01-2019' AND ci.dateacct<='07-31-2019'
    UNION ALL
    SELECT '35' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6428' 
	WHERE  fc.ad_client_id = 1000019 AND  fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019'
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '35'

) AS k
UNION ALL
SELECT '41' AS  id, 0 AS a36, dg AS a6, 0 AS a37,0 AS a4
FROM(
SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value AS id, k.qty, k.tt AS tt, CASE WHEN qty<>0 THEN k.tt/qty ELSE 0 END  AS dg
FROM (
SELECT id, sum(qty) AS qty, sum(tt) AS tt
FROM(
    SELECT '6' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088  AND hh.m_product_id = 1016903
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='07-31-2019' 
	
	UNION ALL
	
	SELECT '6' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
        FROM fact_acct fc
        JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6211'
        JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_ID IN (1016501,1016346)
        WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 321 AND  fc.C_Campaign_ID=1000062  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019' 
) AS k GROUP BY id
) AS k 
RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '6'
) AS k

UNION ALL
SELECT '41' AS  id, 0 AS a36, 0 AS a6, a37 AS a37, 0 AS a4
FROM(
SELECT id,CASE WHEN sum(qty)<>0 THEN (sum(tt1)+sum(tt2))/sum(qty) ELSE 0 END AS a37
FROM(
SELECT id, k.qty, 0 AS tt1,0 AS tt2
FROM (
    SELECT '37' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='07-31-2019'  AND ci.ad_client_id = 1000019
	) AS k

UNION ALL

    SELECT id, 0 AS qty, sum(tt) AS tt1, 0 AS tt2
    FROM (
        SELECT '37' AS id,  sum(fc.qty) AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt", 0 AS qtytt
        FROM fact_acct fc
        JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
        WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1015083 AND fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019' AND fc.ad_client_id = 1000019
        ) AS k GROUP BY id
	
    UNION ALL

    SELECT id,0 AS qty, 0 AS tt1, sum(tt) AS tt2
    FROM (
        SELECT '37' AS id,  sum(fc.qty) AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt", 0 AS qtytt
        FROM fact_acct fc
        JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
        WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1015097 AND fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019'  AND fc.ad_client_id = 1000019
   ) AS k GROUP BY id
)AS k GROUP BY id) AS k
RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '37'

UNION ALL
SELECT '41' AS  id, 0 AS a36, 0 AS a6, 0 AS a37, sum(dg) AS a4
FROM(
	SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt AS tt, CASE WHEN qty<>0 THEN k.tt/qty ELSE 0 END  AS dg
	FROM(
	SELECT '4' AS id, -1*sum(fc.qty) AS qty, -1*sum(fc.amtacctdr-fc.amtacctcr) AS "tt"
	FROM fact_acct fc    
	WHERE  ad_table_id = 318 AND fc.m_product_id =1016903 AND fc.dateacct>='01-01-2019' AND fc.dateacct<='07-31-2019' AND fc.ad_client_id = 1000019 AND fc.amtacctdr =0
	GROUP BY id
) AS k
RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '4'
	
) AS k
) AS k
WHERE ad_client_id = 1000019 AND tp.value ='1'
UNION ALL    
SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, NULL::int4 AS tt, NULL::int4  AS dg
FROM (
    SELECT '2' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
	) AS k
RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '2'
UNION ALL
SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt AS tt, CASE WHEN qtytt<>0 THEN k.tt/qtytt ELSE 0 END  AS dg
FROM (
    SELECT id, sum(qty) AS qty, sum(tt) AS tt, sum(qtytt) AS qtytt
    FROM (
        SELECT '3' AS id,  sum(fc.qty) AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt", 0 AS qtytt
        FROM fact_acct fc
        JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
        WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1015083 AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
        UNION ALL
        SELECT '3' AS id, 0 AS qty, 0 AS tt, sum(civ.productionqty) AS qtytt
        FROM m_production ci
        JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
        JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
        WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
        ) AS k GROUP BY id
	) AS k
RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '3'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt AS tt, CASE WHEN qty<>0 THEN k.tt/qty ELSE 0 END  AS dg
FROM(
	SELECT '4' AS id, -1*sum(fc.qty) AS qty, -1*sum(fc.amtacctdr-fc.amtacctcr) AS "tt"
	FROM fact_acct fc    
	WHERE  ad_table_id = 318 AND fc.m_product_id =1016903 AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' AND fc.ad_client_id = 1000019 AND fc.amtacctdr =0
	GROUP BY id
) AS k
RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '4'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt AS tt, CASE WHEN qty<>0 THEN k.tt/qty ELSE 0 END  AS dg
FROM(
	SELECT '5' AS id, -1*sum(fc.qty) AS qty, -1*sum(fc.amtacctdr-fc.amtacctcr) AS "tt"
	FROM fact_acct fc    
	WHERE  ad_table_id = 318 AND fc.m_product_id =1015088 AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' AND fc.ad_client_id = 1000019 AND fc.amtacctdr =0
	GROUP BY id
) AS k
RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '5'
) AS k
UNION ALL

SELECT 'II' AS nhom,k.description, k.name,k.hsv_dinhmuc,k.id,round(k.qty,0) AS qty,round(k.tt,0) AS tt,  round(k.dg,0) AS dg 
FROM (
SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value AS id, k.qty, k.tt AS tt, CASE WHEN qty<>0 THEN k.tt/qty ELSE 0 END  AS dg
FROM (
SELECT id, sum(qty) AS qty, sum(tt) AS tt
FROM(
    SELECT '6' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088  AND hh.m_product_id = 1016903
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
	
	UNION ALL
	
	SELECT '6' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
        FROM fact_acct fc
        JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6211'
        JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_ID IN (1016501,1016346)
        WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 321 AND  fc.C_Campaign_ID=1000062  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
) AS k GROUP BY id
) AS k 
RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '6'

UNION ALL
SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt AS tt, CASE WHEN qty<>0 THEN k.tt/qty ELSE 0 END  AS dg
FROM (
SELECT id, sum(qty)- sum(qty6) AS qty, sum(tt)-sum(tt6) AS tt
FROM(
    SELECT '7' AS id, sum(civ.productionqty) AS qty,0 AS tt, 0 AS qty6, 0  AS tt6
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
	
	UNION ALL
	
	SELECT '7' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt",0 AS qty6, 0  AS tt6
        FROM fact_acct fc
        JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6211'
        JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_Category_ID IN (1000492,1000493)
        WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 321 AND  fc.C_Campaign_ID=1000062  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
    UNION ALL
        SELECT '7' AS id, 0 AS qty, 0 AS "tt",sum(civ.productionqty) AS qty6, 0  AS tt6
        FROM m_production ci
        JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
        JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088  AND hh.m_product_id = 1016903
        WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
        UNION ALL
        SELECT '7' AS id, 0 AS qty, 0 AS tt, 0 AS qty6, sum(-fc.amtacctcr + fc.amtacctdr) AS tt6
        FROM fact_acct fc
        JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6211'
        JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_ID IN (1016501,1016346)
        WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 321 AND  fc.C_Campaign_ID=1000062  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019'
) AS k GROUP BY id
) AS k 
RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '7'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '8' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
UNION ALL
    SELECT '8' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value='6213'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '8'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '9' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
UNION ALL
    SELECT '9' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000053
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '9'
UNION ALL
SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (

SELECT '10' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
    
    
UNION ALL
    SELECT '10' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000054
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '10'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '11' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.ad_client_id = 1000019 AND ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
    
UNION ALL
    SELECT '11' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000055
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '11'
UNION ALL
SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '12' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
    UNION ALL
    SELECT '12' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000056
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '12'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '13' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
    UNION ALL
    SELECT '13' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000057
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '13'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '14' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
   
UNION ALL
    SELECT '14' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value='6221'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '14'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '15' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
   UNION ALL
    SELECT '15' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value='6223'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '15'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
 
    SELECT '16' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
UNION ALL
    SELECT '16' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value='6271'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '16'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    
    SELECT '17' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
UNION ALL
    SELECT '17' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value='6272'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '17'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
   
    SELECT '18' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
UNION ALL
    SELECT '18' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000058
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '18'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    
    SELECT '19' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
UNION ALL
    SELECT '19' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000060
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '19'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
   
    SELECT '20' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
UNION ALL
    SELECT '20' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000059
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '20'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
  
    SELECT '21' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
UNION ALL
    SELECT '21' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value='6273'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '21'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
   
    SELECT '22' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
UNION ALL
    SELECT '22' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value='6274'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '22'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    
    SELECT '23' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
UNION ALL
    SELECT '23' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value='6275'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '23'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    
    SELECT '24' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
UNION ALL
    SELECT '24' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6276'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '24'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    
    SELECT '25' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
UNION ALL
    SELECT '25' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000065
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '25'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    
    SELECT '26' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
UNION ALL
    SELECT '26' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000061
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '26'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    
    SELECT '27' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
UNION ALL
    SELECT '27' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000062
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '27'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    
    SELECT '28' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
UNION ALL
    SELECT '28' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000063
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '28'
UNION ALL
SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    
    SELECT '29' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
UNION ALL
    SELECT '29' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6277'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '29'


UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (

    SELECT '30' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='05-01-2019' AND ci.movementdate<='05-31-2019' 
	
	UNION ALL
    SELECT '30' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6278'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '30'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '31' AS id,sum(qtyinvoiced) AS qty,0 AS tt FROM c_invoice ci 
    JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND civ.m_product_id = 1015088 AND ci.issotrx = 'Y'
    WHERE ci.docstatus IN ('CO','CL') AND ci.dateacct>='05-01-2019' AND ci.dateacct<='05-31-2019' 
    UNION ALL
    SELECT '31' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6411'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '31'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '32' AS id,sum(qtyinvoiced) AS qty,0 AS tt FROM c_invoice ci 
    JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND civ.m_product_id = 1015088 AND ci.issotrx = 'Y'
    WHERE ci.docstatus IN ('CO','CL') AND ci.dateacct>='05-01-2019' AND ci.dateacct<='05-31-2019'
UNION ALL
    SELECT '32' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6417'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '32'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
 SELECT '33' AS id,sum(qtyinvoiced) AS qty,0 AS tt FROM c_invoice ci 
    JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND civ.m_product_id = 1015088 AND ci.issotrx = 'Y'
    WHERE ci.docstatus IN ('CO','CL') AND ci.dateacct>='05-01-2019' AND ci.dateacct<='05-31-2019'UNION ALL
    SELECT '33' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6418'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273  AND fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '33'

UNION ALL


SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, CASE WHEN tp.hsv_dinhmuc1 <> 0 AND tp.hsv_dinhmuc1 IS NOT NULL  THEN k.tt*hsv_dinhmuc1/100 ELSE 0 END AS tt,  CASE WHEN k.qty<>0 AND hsv_dinhmuc1<>0 AND hsv_dinhmuc1 IS NOT NULL THEN round((k.tt*hsv_dinhmuc1) / (k.qty*100),0) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '34' AS id,sum(qtyinvoiced) AS qty,0 AS tt FROM c_invoice ci 
    JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND civ.m_product_id = 1015088 AND ci.issotrx = 'Y'
    WHERE ci.docstatus IN ('CO','CL') AND ci.dateacct>='05-01-2019' AND ci.dateacct<='05-31-2019'
    UNION ALL
    SELECT '34' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6421' 
	WHERE  fc.ad_client_id = 1000019 AND  fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '34'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, CASE WHEN tp.hsv_dinhmuc1 <> 0 AND tp.hsv_dinhmuc1 IS NOT NULL  THEN k.tt*hsv_dinhmuc1/100 ELSE 0 END AS tt,  CASE WHEN k.qty<>0 AND hsv_dinhmuc1<>0 AND hsv_dinhmuc1 IS NOT NULL THEN round((k.tt*hsv_dinhmuc1) / (k.qty*100),0) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '35' AS id,sum(qtyinvoiced) AS qty,0 AS tt FROM c_invoice ci 
    JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND civ.m_product_id = 1015088 AND ci.issotrx = 'Y'
    WHERE ci.docstatus IN ('CO','CL') AND ci.dateacct>='05-01-2019' AND ci.dateacct<='05-31-2019'
    UNION ALL
    SELECT '35' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6428' 
	WHERE  fc.ad_client_id = 1000019 AND  fc.dateacct>='05-01-2019' AND fc.dateacct<='05-31-2019' 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '35'
) AS k
) AS k ORDER BY CAST(id AS INTEGER) ASC