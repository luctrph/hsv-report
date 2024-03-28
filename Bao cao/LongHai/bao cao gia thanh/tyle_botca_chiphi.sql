SELECT id, tp.name, a29
FROM(
    SELECT '29' AS id, sum(a5) AS a29
    FROM(
        
    SELECT  id,"name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty<>0 THEN round(tt/qty,0) ELSE 0 END AS a5 
    FROM(
        SELECT id, sum(qty) AS qty, sum(tt) AS tt
        FROM(
            SELECT '9' AS id, sum(civ.productionqty) AS qty,0 AS tt
            FROM m_production ci
            JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000086
            WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id=1000060  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='04-30-2019' 
            UNION ALL
            SELECT '9' AS id, 0 AS qty, sum( fc.amtacctdr - fc.amtacctcr) AS "tt"
            FROM fact_acct fc
            JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value = '6213'
            WHERE fc.C_Activity_ID = 1000272  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='04-30-2019' 
            GROUP BY id
        ) AS k GROUP BY id
    ) AS k
    RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
    WHERE ad_client_id = 1000019 AND tp.value = '9'
    
    UNION ALL

    SELECT  id,"name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty<>0 THEN round(tt/qty,0) ELSE 0 END AS a5
    FROM(
        SELECT id, sum(qty) AS qty, sum(tt) AS tt
        FROM(
            SELECT '10' AS id, sum(civ.productionqty) AS qty,0 AS tt
            FROM m_production ci
            JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000086
            WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id=1000060  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='04-30-2019' 
            UNION ALL
            SELECT '10' AS id, 0 AS qty, sum( fc.amtacctdr - fc.amtacctcr) AS "tt"
            FROM fact_acct fc
            JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value = '6221'
            WHERE fc.C_Activity_ID = 1000272  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='04-30-2019' 
            GROUP BY id
        ) AS k GROUP BY id
    ) AS k
    RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
    WHERE ad_client_id = 1000019 AND tp.value = '10'

UNION ALL

    SELECT  id,"name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty<>0 THEN round(tt/qty,0) ELSE 0 END AS a5
    FROM(
    SELECT id, sum(qty) AS qty, sum(tt) AS tt
    FROM(
        SELECT '11' AS id, sum(civ.productionqty) AS qty,0 AS tt
        FROM m_production ci
        JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
        JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000086
        WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id=1000060  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='04-30-2019' 
        UNION ALL
        SELECT '11' AS id, 0 AS qty, sum( fc.amtacctdr - fc.amtacctcr) AS "tt"
        FROM fact_acct fc
        JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value = '6223'
        WHERE fc.C_Activity_ID = 1000272  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='04-30-2019' 
        GROUP BY id
        ) AS k GROUP BY id
    ) AS k
    RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
    WHERE ad_client_id = 1000019 AND tp.value = '11'

UNION ALL

    SELECT  id,"name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty<>0 THEN round(tt/qty,0) ELSE 0 END AS a5
    FROM(
        SELECT id, sum(qty) AS qty, sum(tt) AS tt
        FROM(
            SELECT '12' AS id, sum(civ.productionqty) AS qty,0 AS tt
            FROM m_production ci
            JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000086
            WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id=1000060  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='04-30-2019' 
            UNION ALL
            SELECT '12' AS id, 0 AS qty, sum( fc.amtacctdr - fc.amtacctcr) AS "tt"
            FROM fact_acct fc
            JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value = '6271'
            WHERE fc.C_Activity_ID = 1000272  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='04-30-2019' 
            GROUP BY id
        ) AS k GROUP BY id
    ) AS k
    RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
    WHERE ad_client_id = 1000019 AND tp.value = '12'	

    UNION ALL

    SELECT  id,"name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty<>0 THEN round(tt/qty,0) ELSE 0 END AS a5
    FROM(
        SELECT id, sum(qty) AS qty, sum(tt) AS tt
        FROM(
            SELECT '13' AS id, sum(civ.productionqty) AS qty,0 AS tt
            FROM m_production ci
            JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000086
            WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id=1000060  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='04-30-2019' 
            UNION ALL
            SELECT '13' AS id, 0 AS qty, sum( fc.amtacctdr - fc.amtacctcr) AS "tt"
            FROM fact_acct fc
            JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value = '6272'
            WHERE fc.C_Activity_ID = 1000272  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='04-30-2019' 
            GROUP BY id
        ) AS k GROUP BY id
    ) AS k
    RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
    WHERE ad_client_id = 1000019 AND tp.value = '13'

    UNION ALL

    SELECT  id,"name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty<>0 THEN round(tt/qty,0) ELSE 0 END AS a5
    FROM(
        SELECT id, sum(qty) AS qty, sum(tt) AS tt
        FROM(
            SELECT '17' AS id, sum(civ.productionqty) AS qty,0 AS tt
            FROM m_production ci
            JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000086
            WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id=1000060  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='04-30-2019' 
            UNION ALL
            SELECT '17' AS id, 0 AS qty, sum( fc.amtacctdr - fc.amtacctcr) AS "tt"
            FROM fact_acct fc
            JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value = '6273'
            WHERE fc.C_Activity_ID = 1000272  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='04-30-2019' 
            GROUP BY id
        ) AS k GROUP BY id
    ) AS k
    RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
    WHERE ad_client_id = 1000019 AND tp.value = '17'

    UNION ALL

    SELECT  id,"name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty<>0 THEN round(tt/qty,0) ELSE 0 END AS a5
    FROM(
        SELECT id, sum(qty) AS qty, sum(tt) AS tt
        FROM(
            SELECT '18' AS id, sum(civ.productionqty) AS qty,0 AS tt
            FROM m_production ci
            JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000086
            WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id=1000060  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='04-30-2019' 
            UNION ALL
            SELECT '18' AS id, 0 AS qty, sum( fc.amtacctdr - fc.amtacctcr) AS "tt"
            FROM fact_acct fc
            JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value ='6274'
            WHERE fc.C_Activity_ID = 1000272  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='04-30-2019' 
            GROUP BY id
        ) AS k GROUP BY id
    ) AS k
    RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
    WHERE ad_client_id = 1000019 AND tp.value = '18'

    UNION ALL

    SELECT  id,"name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty<>0 THEN round(tt/qty,0) ELSE 0 END AS a5
    FROM(
        SELECT id, sum(qty) AS qty, sum(tt) AS tt
        FROM(
            SELECT '19' AS id, sum(civ.productionqty) AS qty,0 AS tt
            FROM m_production ci
            JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000086
            WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id=1000060  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='04-30-2019' 
            UNION ALL
            SELECT '19' AS id, 0 AS qty, sum( fc.amtacctdr - fc.amtacctcr) AS "tt"
            FROM fact_acct fc
            JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value ='6275'
            WHERE fc.C_Activity_ID = 1000272  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='04-30-2019' 
            GROUP BY id
        ) AS k GROUP BY id
    ) AS k
    RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
    WHERE ad_client_id = 1000019 AND tp.value = '19'
    UNION ALL

    SELECT  id,"name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty<>0 THEN round(tt/qty,0) ELSE 0 END AS a5
    FROM(
        SELECT id, sum(qty) AS qty, sum(tt) AS tt
        FROM(
            SELECT '20' AS id, sum(civ.productionqty) AS qty,0 AS tt
            FROM m_production ci
            JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000086
            WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id=1000060  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='04-30-2019' 
            UNION ALL
            SELECT '20' AS id, 0 AS qty, sum( fc.amtacctdr - fc.amtacctcr) AS "tt"
            FROM fact_acct fc
            JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value ='6276'
            WHERE fc.C_Activity_ID = 1000272  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='04-30-2019' 
            GROUP BY id
        ) AS k GROUP BY id
    ) AS k
    RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
    WHERE ad_client_id = 1000019 AND tp.value = '20'

    UNION ALL

    SELECT  id,"name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty<>0 THEN round(tt/qty,0) ELSE 0 END AS a5
    FROM(
        SELECT id, sum(qty) AS qty, sum(tt) AS tt
        FROM(
            SELECT '21' AS id, sum(civ.productionqty) AS qty,0 AS tt
            FROM m_production ci
            JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000086
            WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id=1000060  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='04-30-2019' 
            UNION ALL
            SELECT '21' AS id, 0 AS qty, sum( fc.amtacctdr - fc.amtacctcr) AS "tt"
            FROM fact_acct fc
            JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value ='6277'
            WHERE fc.C_Activity_ID = 1000272  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='04-30-2019' 
            GROUP BY id
        ) AS k GROUP BY id
    ) AS k
    RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
    WHERE ad_client_id = 1000019 AND tp.value = '21'

    UNION ALL

    SELECT  id,"name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty<>0 THEN round(tt/qty,0) ELSE 0 END AS a5
    FROM(
        SELECT id, sum(qty) AS qty, sum(tt) AS tt
        FROM(
            SELECT '22' AS id, sum(civ.productionqty) AS qty,0 AS tt
            FROM m_production ci
            JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000086
            WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id=1000060  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='04-30-2019' 
            UNION ALL
            SELECT '22' AS id, 0 AS qty, sum( fc.amtacctdr - fc.amtacctcr) AS "tt"
            FROM fact_acct fc
            JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value ='6278'
            WHERE fc.C_Activity_ID = 1000272  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='04-30-2019' 
            GROUP BY id
        ) AS k GROUP BY id
    ) AS k
    RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
    WHERE ad_client_id = 1000019 AND tp.value = '22'

    UNION ALL

    SELECT  id,"name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty<>0 THEN round(tt/qty,0) ELSE 0 END AS a5
    FROM(
        SELECT id, sum(qty) AS qty, sum(tt)AS tt 
        FROM (
            SELECT '23' AS id,sum(qtyinvoiced) AS qty,0 AS tt 
            FROM c_invoice ci 
            JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id  AND ci.issotrx = 'Y'
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000086
            WHERE ci.ad_client_id = 1000019 AND ci.docstatus IN ('CO','CL') AND ci.dateacct>='01-01-2019' AND ci.dateacct<='04-30-2019' 
            UNION ALL
            SELECT '23' AS id, 0 AS qty, sum(fc.amtacctdr - fc.amtacctcr) AS "tt"
            FROM fact_acct fc
            JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value = '6411'
            WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='04-30-2019' 
            GROUP BY id
        ) AS k GROUP BY id
    ) AS k	
    RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
    WHERE ad_client_id = 1000019 AND tp.value = '23'

    UNION ALL

    SELECT  id,"name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty<>0 THEN round(tt/qty,0) ELSE 0 END AS a5
    FROM(
        SELECT id, sum(qty) AS qty, sum(tt)AS tt 
        FROM (
            SELECT '24' AS id,sum(qtyinvoiced) AS qty,0 AS tt FROM c_invoice ci 
            JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id  AND ci.issotrx = 'Y'
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000086
            WHERE ci.ad_client_id = 1000019 AND ci.docstatus IN ('CO','CL') AND ci.dateacct>='01-01-2019' AND ci.dateacct<='04-30-2019' 
            UNION ALL
            SELECT '24' AS id, 0 AS qty, sum(fc.amtacctdr - fc.amtacctcr) AS "tt"
            FROM fact_acct fc
            JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value = '6417'
            WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='04-30-2019' 
            GROUP BY id
        ) AS k GROUP BY id
    ) AS k	
    RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
    WHERE ad_client_id = 1000019 AND tp.value = '24'	

    UNION ALL

    SELECT  id,"name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty<>0 THEN round(tt/qty,0) ELSE 0 END AS a5
    FROM(
        SELECT id, sum(qty) AS qty, sum(tt)AS tt 
        FROM (
            SELECT '25' AS id,sum(qtyinvoiced) AS qty,0 AS tt FROM c_invoice ci 
            JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id  AND ci.issotrx = 'Y'
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000086
            WHERE ci.ad_client_id = 1000019 AND ci.docstatus IN ('CO','CL') AND ci.dateacct>='01-01-2019' AND ci.dateacct<='04-30-2019' 
            UNION ALL
            SELECT '25' AS id, 0 AS qty, sum(fc.amtacctdr - fc.amtacctcr) AS "tt"
            FROM fact_acct fc
            JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value = '6418'
            WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272  AND fc.dateacct>='01-01-2019' AND fc.dateacct<='04-30-2019' 
            GROUP BY id
        ) AS k GROUP BY id
    ) AS k	
    RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
    WHERE ad_client_id = 1000019 AND tp.value = '25'


UNION ALL

    SELECT  id,"name" AS a1, hsv_dinhmuc AS a2, qty AS a3,  CASE WHEN tp.hsv_dinhmuc1 <> 0 AND tp.hsv_dinhmuc1 IS NOT NULL  THEN k.tt*hsv_dinhmuc1/100 ELSE 0 END AS a4,  CASE WHEN k.qty<>0 AND hsv_dinhmuc1<>0 AND hsv_dinhmuc1 IS NOT NULL THEN round((k.tt*hsv_dinhmuc1) / (k.qty*100),0) ELSE 0 END AS a5
    FROM(
        SELECT id, sum(qty) AS qty, sum(tt)AS tt 
        FROM (
            SELECT '26' AS id,sum(qtyinvoiced) AS qty,0 AS tt FROM c_invoice ci 
            JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND civ.m_product_id = 1015086 AND ci.issotrx = 'Y'
            WHERE ci.docstatus IN ('CO','CL') AND ci.dateacct>='01-01-2019' AND ci.dateacct<='04-30-2019'
            UNION ALL
            SELECT '26' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
            FROM fact_acct fc
            JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6421' 
            WHERE  fc.ad_client_id = 1000019 AND  fc.dateacct>='01-01-2019' AND fc.dateacct<='04-30-2019' 
            GROUP BY id
        ) AS k GROUP BY id
    ) AS k
    RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
    WHERE ad_client_id = 1000019 AND tp.value = '26'

    UNION ALL

    SELECT  id,"name" AS a1, hsv_dinhmuc AS a2, qty AS a3,  CASE WHEN tp.hsv_dinhmuc1 <> 0 AND tp.hsv_dinhmuc1 IS NOT NULL  THEN k.tt*hsv_dinhmuc1/100 ELSE 0 END AS a4,  CASE WHEN k.qty<>0 AND hsv_dinhmuc1<>0 AND hsv_dinhmuc1 IS NOT NULL THEN round((k.tt*hsv_dinhmuc1) / (k.qty*100),0) ELSE 0 END AS a5
    FROM(
        SELECT id, sum(qty) AS qty, sum(tt)AS tt 
        FROM (
            SELECT '27' AS id,sum(qtyinvoiced) AS qty,0 AS tt FROM c_invoice ci 
            JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND civ.m_product_id = 1015086 AND ci.issotrx = 'Y'
            WHERE ci.docstatus IN ('CO','CL') AND ci.dateacct>='01-01-2019' AND ci.dateacct<='04-30-2019'
            UNION ALL
            SELECT '27' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
            FROM fact_acct fc
            JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND acct.value= '6428' 
            WHERE  fc.ad_client_id = 1000019 AND  fc.dateacct>='01-01-2019' AND fc.dateacct<='04-30-2019' 
            GROUP BY id
        ) AS k GROUP BY id
    ) AS k
    RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
    WHERE ad_client_id = 1000019 AND tp.value = '27'
    ) AS k
) AS k JOIN hsv_giathanh tp ON tp.value = k.id  AND  tp.value = '29'
WHERE ad_client_id =1000019


