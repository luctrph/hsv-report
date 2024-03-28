SELECT id,CASE WHEN sum(qty)<>0 THEN (sum(tt1)+sum(tt2))/sum(qty) ELSE 0 END AS a37
FROM(
SELECT id, k.qty, 0 AS tt1,0 AS tt2
FROM (
    SELECT '37' AS id, sum(civ.productionqty) AS qty,0 AS tt
	FROM m_production ci
	JOIN m_productionplan  civ ON ci.m_production_id = civ.m_production_id 
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088 
	WHERE ci.docstatus IN ('CO','CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id=1000062  AND ci.movementdate>='01-01-2019' AND ci.movementdate<='04-30-2019'  AND ci.ad_client_id = 1000019
	) AS k

UNION ALL

    SELECT id, 0 AS qty, sum(tt) AS tt1, 0 AS tt2
    FROM (
        SELECT '37' AS id,  sum(fc.qty) AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt", 0 AS qtytt
        FROM fact_acct fc
        JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
        WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1015083 AND fc.dateacct>='01-01-2019' AND fc.dateacct<='04-30-2019' AND fc.ad_client_id = 1000019
        ) AS k GROUP BY id
	
    UNION ALL

    SELECT id,0 AS qty, 0 AS tt1, sum(tt) AS tt2
    FROM (
        SELECT '37' AS id,  sum(fc.qty) AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt", 0 AS qtytt
        FROM fact_acct fc
        JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
        WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1015097 AND fc.dateacct>='01-01-2019' AND fc.dateacct<='04-30-2019'  AND fc.ad_client_id = 1000019
   ) AS k GROUP BY id
)AS k GROUP BY id
