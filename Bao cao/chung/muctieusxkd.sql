SELECT VALUE AS id, description AS stt, NAME, hsv_dinhmuc, NULL::int4 AS a1, NULL::int4 AS a2, NULL::int4 AS a3
FROM hsv_muctieu
WHERE VALUE = '1' AND ad_client_id = 1000019

UNION

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '2' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT sum(qty) - sum(qty1) AS qty, 0 AS qty1
		FROM (
			SELECT sum(civ.productionqty) AS qty, 0 AS qty1
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '06-01-2019' AND ci.movementdate <= '06-30-2019'
			
			UNION ALL
			
			SELECT 0 AS qty, sum(civ.productionqty) AS qty1
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '06-01-2019' AND ci.movementdate <= '06-30-2019'
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, sum(qty) - sum(qty1) AS qty1
		FROM (
			SELECT sum(civ.productionqty) AS qty, 0 AS qty1
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '06-30-2019'
			
			UNION ALL
			
			SELECT 0 AS qty, sum(civ.productionqty) AS qty1
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '06-30-2019'
			) AS k
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '2'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '3' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT sum(qty) AS qty, 0 AS qty1
		FROM (
			SELECT sum(civ.productionqty) AS qty
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015086 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '06-01-2019' AND ci.movementdate <= '06-30-2019'
			
			UNION ALL
			
			SELECT sum(civ.productionqty) AS qty
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '06-01-2019' AND ci.movementdate <= '06-30-2019'
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, sum(qty) AS qty1
		FROM (
			SELECT sum(civ.productionqty) AS qty
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015086 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '06-30-2019'
			
			UNION ALL
			
			SELECT sum(civ.productionqty) AS qty
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '06-30-2019'
			) AS k
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '3'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '4' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT - 1 * sum(fc.qty) AS qty, 0 AS qty1
		FROM fact_acct fc
		WHERE fc.ad_client_id = 1000019 AND ad_table_id = 318 AND fc.m_product_id = 1015087 AND fc.dateacct >= '06-01-2019' AND fc.dateacct <= '06-30-2019' AND fc.amtacctdr = 0
		
		UNION ALL
		
		SELECT 0 AS qty, - 1 * sum(fc.qty) AS qty1
		FROM fact_acct fc
		WHERE fc.ad_client_id = 1000019 AND ad_table_id = 318 AND fc.m_product_id = 1015087 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '06-30-2019' AND fc.amtacctdr = 0
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '4'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '5' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT - 1 * sum(fc.qty) AS qty, 0 AS qty1
		FROM fact_acct fc
		WHERE fc.ad_client_id = 1000019 AND ad_table_id = 318 AND fc.m_product_id = 1015086 AND fc.dateacct >= '06-01-2019' AND fc.dateacct <= '06-30-2019' AND fc.amtacctdr = 0
		
		UNION
		
		SELECT 0 AS qty, - 1 * sum(fc.qty) AS qty1
		FROM fact_acct fc
		WHERE fc.ad_client_id = 1000019 AND ad_table_id = 318 AND fc.m_product_id = 1015086 AND fc.dateacct >= '06-01-2019' AND fc.dateacct <= '06-30-2019' AND fc.amtacctdr = 0
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '5'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '6' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT sum(qtyinvoiced) AS qty, 0 AS qty1
		FROM c_invoiceline civ
		JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1015087
		WHERE ci.issotrx = 'N' AND civ.ad_client_id = 1000019 AND ci.docstatus IN ('CL', 'CO') AND ci.dateacct >= '06-01-2019' AND ci.dateacct <= '06-30-2019'
		
		UNION ALL
		
		SELECT 0 AS qty, sum(qtyinvoiced) AS qty1
		FROM c_invoiceline civ
		JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1015087
		WHERE ci.issotrx = 'N' AND civ.ad_client_id = 1000019 AND ci.docstatus IN ('CL', 'CO') AND ci.dateacct >= '01-01-2019' AND ci.dateacct <= '06-30-2019'
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '6'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '7' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT - 1 * sum(fc.qty) AS qty, 0 AS qty1
		FROM fact_acct fc
		WHERE fc.ad_client_id = 1000019 AND ad_table_id = 318 AND fc.m_product_id = 1016751 AND fc.dateacct >= '06-01-2019' AND fc.dateacct <= '06-30-2019' AND fc.amtacctdr = 0
		
		UNION
		
		SELECT 0 AS qty, - 1 * sum(fc.qty) AS qty1
		FROM fact_acct fc
		WHERE fc.ad_client_id = 1000019 AND ad_table_id = 318 AND fc.m_product_id = 1016751 AND fc.dateacct >= '06-01-2019' AND fc.dateacct <= '06-30-2019' AND fc.amtacctdr = 0
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '7'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '8' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT sum(civ.productionqty) AS qty, 0 AS qty1
		FROM m_production ci
		JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000088
		WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id = 1000062 AND ci.movementdate >= '06-01-2019' AND ci.movementdate <= '06-30-2019'
		
		UNION ALL
		
		SELECT 0 AS qty, sum(civ.productionqty) AS qty1
		FROM m_production ci
		JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000088
		WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id = 1000062 AND ci.movementdate >= '06-01-2019' AND ci.movementdate <= '06-30-2019'
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '8'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '9' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT - 1 * sum(fc.qty) AS qty, 0 AS qty1
		FROM fact_acct fc
		WHERE ad_table_id = 318 AND fc.m_product_id = 1015088 AND fc.dateacct >= '06-01-2019' AND fc.dateacct <= '06-30-2019' AND fc.ad_client_id = 1000019 AND fc.amtacctdr = 0
		
		UNION ALL
		
		SELECT 0 AS qty, - 1 * sum(fc.qty) AS qty1
		FROM fact_acct fc
		WHERE ad_table_id = 318 AND fc.m_product_id = 1015088 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '06-30-2019' AND fc.ad_client_id = 1000019 AND fc.amtacctdr = 0
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '9'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '10' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT sum(civ.productionqty) AS qty, 0 AS qty1
		FROM m_production ci
		JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000088 AND hh.M_Product_ID = 1016903
		WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id = 1000062 AND ci.movementdate >= '06-01-2019' AND ci.movementdate <= '06-30-2019'
		
		UNION ALL
		
		SELECT 0 AS qty, sum(civ.productionqty) AS qty1
		FROM m_production ci
		JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000088 AND hh.M_Product_ID = 1016903
		WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id = 1000062 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '06-30-2019'
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '10'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '11' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT - 1 * sum(fc.qty) AS qty, 0 AS qty1
		FROM fact_acct fc
		WHERE ad_table_id = 318 AND fc.m_product_id = 1016903 AND fc.dateacct >= '06-01-2019' AND fc.dateacct <= '06-30-2019' AND fc.ad_client_id = 1000019 AND fc.amtacctdr = 0
		
		UNION ALL
		
		SELECT 0 AS qty, - 1 * sum(fc.qty) AS qty1
		FROM fact_acct fc
		WHERE ad_table_id = 318 AND fc.m_product_id = 1016903 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '06-30-2019' AND fc.ad_client_id = 1000019 AND fc.amtacctdr = 0
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '11'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '13' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT sum(qtyinvoiced) AS qty, 0 AS qty1
		FROM c_invoice ci
		JOIN c_invoiceline civ ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1015089 AND ci.docstatus IN ('CO', 'CL')
		WHERE issotrx = 'Y' AND ci.ad_client_id = 1000019 AND ci.dateacct >= '06-01-2019' AND ci.dateacct <= '06-30-2019'
		
		UNION ALL
		
		SELECT 0 AS qty, sum(qtyinvoiced) AS qty1
		FROM c_invoice ci
		JOIN c_invoiceline civ ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1015089 AND ci.docstatus IN ('CO', 'CL')
		WHERE issotrx = 'Y' AND ci.ad_client_id = 1000019 AND ci.dateacct >= '01-01-2019' AND ci.dateacct <= '06-30-2019'
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '13'

UNION ALL

SELECT VALUE AS id, description AS stt, NAME, hsv_dinhmuc, NULL::int4 AS a1, NULL::int4 AS a2, NULL::int4 AS a3
FROM hsv_muctieu
WHERE VALUE = '14' AND ad_client_id = 1000019

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '15' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT COALESCE(sum(t.sl), 0) AS qty, 0 AS qty1
		FROM (
			SELECT DISTINCT hh.m_product_id, hh.value, hh.name, civ.productionqty AS sl
			FROM m_productionplan civ
			JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL') AND ci.AD_Org_ID = 1000049 AND ci.movementdate >= '06-01-2019' AND ci.movementdate <= '06-30-2019'
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_ID = 1000017
			WHERE civ.ad_client_id = 1000003
			) t
		
		UNION ALL
		
		SELECT 0 AS qty, COALESCE(sum(t.sl), 0) AS qty1
		FROM (
			SELECT DISTINCT hh.m_product_id, hh.value, hh.name, civ.productionqty AS sl
			FROM m_productionplan civ
			JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL') AND ci.AD_Org_ID = 1000049 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '06-30-2019'
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_ID = 1000017
			WHERE civ.ad_client_id = 1000003
			) t
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '15'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '16' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT sum(qtyinvoiced) AS qty, 0 AS qty1
		FROM c_invoiceline civ
		JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1000017
		WHERE ci.issotrx = 'N' AND civ.ad_client_id = 1000003 AND ci.docstatus IN ('CL', 'CO') AND ci.dateacct >= '06-01-2019' AND ci.dateacct <= '06-30-2019'
		
		UNION ALL
		
		SELECT 0 AS qty, sum(qtyinvoiced) AS qty1
		FROM c_invoiceline civ
		JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1000017
		WHERE ci.issotrx = 'N' AND civ.ad_client_id = 1000003 AND ci.docstatus IN ('CL', 'CO') AND ci.dateacct >= '01-01-2019' AND ci.dateacct <= '06-30-2019'
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '16'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '17' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT sum(t.movementqty) AS qty, 0 AS qty1
		FROM (
			SELECT m_transaction.AD_Org_ID, hh.m_product_category_id, hh.value, hh.name, m_transaction.m_product_id, m_transaction.m_locator_id, m_transaction.movementdate, m_transaction.movementtype, m_transaction.
				movementqty
			FROM m_transaction
			JOIN m_product hh ON m_transaction.m_product_id = hh.m_product_id
			JOIN (
				SELECT ml.M_productionline_id
				FROM M_productionline ml
				JOIN (
					SELECT ml.M_productionplan_id
					FROM M_productionplan ml
					JOIN M_production m ON ml.M_production_id = m.M_production_id AND m.docstatus IN ('CO', 'CL') AND m.ad_client_id = 1000003
					) m ON ml.M_productionplan_id = m.M_productionplan_id
				) t3 ON m_transaction.M_productionline_id = t3.M_productionline_id
			WHERE m_transaction.movementtype IN ('P+') AND m_transaction.movementdate >= '06-01-2019' AND m_transaction.movementdate <= '06-30-2019' AND m_transaction.ad_client_id = 1000003 AND hh.
				m_product_category_id = 1000017
			
			UNION ALL
			
			SELECT m_transaction.AD_Org_ID, hh.m_product_category_id, hh.value, hh.name, m_transaction.m_product_id, m_transaction.m_locator_id, m_transaction.movementdate, m_transaction.movementtype, m_transaction.
				movementqty
			FROM m_transaction
			JOIN m_product hh ON m_transaction.m_product_id = hh.m_product_id
			JOIN (
				SELECT ml.M_productionline_id
				FROM M_productionline ml
				JOIN M_production m ON ml.M_production_id = m.M_production_id AND m.docstatus IN ('CO', 'CL') AND m.ad_client_id = 1000003
				) t4 ON m_transaction.M_productionline_id = t4.M_productionline_id
			WHERE m_transaction.movementtype IN ('P+') AND m_transaction.movementdate >= '06-01-2019' AND m_transaction.movementdate <= '06-30-2019' AND m_transaction.ad_client_id = 1000003 AND hh.
				m_product_category_id = 1000017
			) AS t
		
		UNION ALL
		
		SELECT 0 AS qty, sum(t.movementqty) AS qty1
		FROM (
			SELECT m_transaction.AD_Org_ID, hh.m_product_category_id, hh.value, hh.name, m_transaction.m_product_id, m_transaction.m_locator_id, m_transaction.movementdate, m_transaction.movementtype, m_transaction.
				movementqty
			FROM m_transaction
			JOIN m_product hh ON m_transaction.m_product_id = hh.m_product_id
			JOIN (
				SELECT ml.M_productionline_id
				FROM M_productionline ml
				JOIN (
					SELECT ml.M_productionplan_id
					FROM M_productionplan ml
					JOIN M_production m ON ml.M_production_id = m.M_production_id AND m.docstatus IN ('CO', 'CL') AND m.ad_client_id = 1000003
					) m ON ml.M_productionplan_id = m.M_productionplan_id
				) t3 ON m_transaction.M_productionline_id = t3.M_productionline_id
			WHERE m_transaction.movementtype IN ('P+') AND m_transaction.movementdate >= '01-01-2019' AND m_transaction.movementdate <= '06-30-2019' AND m_transaction.ad_client_id = 1000003 AND hh.
				m_product_category_id = 1000017
			
			UNION ALL
			
			SELECT m_transaction.AD_Org_ID, hh.m_product_category_id, hh.value, hh.name, m_transaction.m_product_id, m_transaction.m_locator_id, m_transaction.movementdate, m_transaction.movementtype, m_transaction.
				movementqty
			FROM m_transaction
			JOIN m_product hh ON m_transaction.m_product_id = hh.m_product_id
			JOIN (
				SELECT ml.M_productionline_id
				FROM M_productionline ml
				JOIN M_production m ON ml.M_production_id = m.M_production_id AND m.docstatus IN ('CO', 'CL') AND m.ad_client_id = 1000003
				) t4 ON m_transaction.M_productionline_id = t4.M_productionline_id
			WHERE m_transaction.movementtype IN ('P+') AND m_transaction.movementdate >= '01-01-2019' AND m_transaction.movementdate <= '06-30-2019' AND m_transaction.ad_client_id = 1000003 AND hh.
				m_product_category_id = 1000017
			) AS t
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '17'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '18' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT 0 AS qty, sum(qtyinvoiced) AS qty1
		FROM c_invoiceline civ
		JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id
		JOIN m_product hh ON hh.m_product_id = civ.m_product_id AND hh.m_product_category_id = 1000017
		WHERE ci.issotrx = 'Y' AND civ.ad_client_id = 1000003 AND ci.docstatus IN ('CL', 'CO') AND ci.dateacct >= '06-01-2019' AND ci.dateacct <= '06-30-2019'
		
		UNION ALL
		
		SELECT sum(qtyinvoiced) AS qty, 0 AS qty1
		FROM c_invoiceline civ
		JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id
		JOIN m_product hh ON hh.m_product_id = civ.m_product_id AND hh.m_product_category_id = 1000017
		WHERE ci.issotrx = 'Y' AND civ.ad_client_id = 1000003 AND ci.docstatus IN ('CL', 'CO') AND ci.dateacct >= '01-01-2019' AND ci.dateacct <= '06-30-2019'
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '18'

UNION ALL

SELECT VALUE AS id, description AS stt, NAME, hsv_dinhmuc, NULL::int4 AS a1, NULL::int4 AS a2, NULL::int4 AS a3
FROM hsv_muctieu
WHERE VALUE = '20' AND ad_client_id = 1000019

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '21' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT 0 AS qty, sum(qtyinvoiced) AS qty1
		FROM c_invoiceline civ
		JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016759
		WHERE ci.issotrx = 'Y' AND civ.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.dateacct >= '06-01-2019' AND ci.dateacct <= '06-30-2019'
		
		UNION ALL
		
		SELECT sum(qtyinvoiced) AS qty, 0 AS qty1
		FROM c_invoiceline civ
		JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016759
		WHERE ci.issotrx = 'Y' AND civ.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.dateacct >= '01-01-2019' AND ci.dateacct <= '06-30-2019'
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '21'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '22' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT sum(qtyinvoiced) AS qty, 0 AS qty1
		FROM c_invoiceline civ
		JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_category_id = 1000511
		WHERE ci.issotrx = 'N' AND civ.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.dateacct >= '06-01-2019' AND ci.dateacct <= '06-30-2019'
		
		UNION ALL
		
		SELECT 0 AS qty, sum(qtyinvoiced) AS qty1
		FROM c_invoiceline civ
		JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_category_id = 1000511
		WHERE ci.issotrx = 'N' AND civ.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.dateacct >= '01-01-2019' AND ci.dateacct <= '06-30-2019'
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '22'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '24' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT sum(t.movementqty) AS qty, 0 AS qty1
		FROM (
			SELECT m_transaction.AD_Org_ID, hh.m_product_category_id, hh.value, hh.name, m_transaction.m_product_id, m_transaction.m_locator_id, m_transaction.movementdate, m_transaction.movementtype, m_transaction.
				movementqty
			FROM m_transaction
			JOIN m_product hh ON m_transaction.m_product_id = hh.m_product_id
			JOIN (
				SELECT ml.M_productionline_id
				FROM M_productionline ml
				JOIN (
					SELECT ml.M_productionplan_id
					FROM M_productionplan ml
					JOIN M_production m ON ml.M_production_id = m.M_production_id AND m.docstatus IN ('CO', 'CL') AND m.ad_client_id = 1000023
					) m ON ml.M_productionplan_id = m.M_productionplan_id
				) t3 ON m_transaction.M_productionline_id = t3.M_productionline_id
			WHERE m_transaction.movementtype IN ('P+') AND m_transaction.movementdate >= '06-01-2019' AND m_transaction.movementdate <= '06-30-2019' AND m_transaction.ad_client_id = 1000023 AND hh.
				m_product_category_id = 1000513
			
			UNION ALL
			
			SELECT m_transaction.AD_Org_ID, hh.m_product_category_id, hh.value, hh.name, m_transaction.m_product_id, m_transaction.m_locator_id, m_transaction.movementdate, m_transaction.movementtype, m_transaction.
				movementqty
			FROM m_transaction
			JOIN m_product hh ON m_transaction.m_product_id = hh.m_product_id
			JOIN (
				SELECT ml.M_productionline_id
				FROM M_productionline ml
				JOIN M_production m ON ml.M_production_id = m.M_production_id AND m.docstatus IN ('CO', 'CL') AND m.ad_client_id = 1000023
				) t4 ON m_transaction.M_productionline_id = t4.M_productionline_id
			WHERE m_transaction.movementtype IN ('P+') AND m_transaction.movementdate >= '06-01-2019' AND m_transaction.movementdate <= '06-30-2019' AND m_transaction.ad_client_id = 1000023 AND hh.
				m_product_category_id = 1000513
			) AS t
		
		UNION ALL
		
		SELECT 0 AS qty, sum(t.movementqty) AS qty1
		FROM (
			SELECT m_transaction.AD_Org_ID, hh.m_product_category_id, hh.value, hh.name, m_transaction.m_product_id, m_transaction.m_locator_id, m_transaction.movementdate, m_transaction.movementtype, m_transaction.
				movementqty
			FROM m_transaction
			JOIN m_product hh ON m_transaction.m_product_id = hh.m_product_id
			JOIN (
				SELECT ml.M_productionline_id
				FROM M_productionline ml
				JOIN (
					SELECT ml.M_productionplan_id
					FROM M_productionplan ml
					JOIN M_production m ON ml.M_production_id = m.M_production_id AND m.docstatus IN ('CO', 'CL') AND m.ad_client_id = 1000023
					) m ON ml.M_productionplan_id = m.M_productionplan_id
				) t3 ON m_transaction.M_productionline_id = t3.M_productionline_id
			WHERE m_transaction.movementtype IN ('P+') AND m_transaction.movementdate >= '01-01-2019' AND m_transaction.movementdate <= '06-30-2019' AND m_transaction.ad_client_id = 1000023 AND hh.
				m_product_category_id = 1000513
			
			UNION ALL
			
			SELECT m_transaction.AD_Org_ID, hh.m_product_category_id, hh.value, hh.name, m_transaction.m_product_id, m_transaction.m_locator_id, m_transaction.movementdate, m_transaction.movementtype, m_transaction.
				movementqty
			FROM m_transaction
			JOIN m_product hh ON m_transaction.m_product_id = hh.m_product_id
			JOIN (
				SELECT ml.M_productionline_id
				FROM M_productionline ml
				JOIN M_production m ON ml.M_production_id = m.M_production_id AND m.docstatus IN ('CO', 'CL') AND m.ad_client_id = 1000023
				) t4 ON m_transaction.M_productionline_id = t4.M_productionline_id
			WHERE m_transaction.movementtype IN ('P+') AND m_transaction.movementdate >= '01-01-2019' AND m_transaction.movementdate <= '06-30-2019' AND m_transaction.ad_client_id = 1000023 AND hh.
				m_product_category_id = 1000513
			) AS t
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '24'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2, CASE WHEN hm.hsv_dinhmuc <> 0 THEN 100 * qty1 / hm.hsv_dinhmuc ELSE 0 END AS a3
FROM (
	SELECT '25' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT sum(qtyinvoiced) AS qty, 0 AS qty1
		FROM c_invoiceline civ
		JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_category_id = 1000511
		WHERE ci.issotrx = 'Y' AND civ.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.dateacct >= '06-01-2019' AND ci.dateacct <= '06-30-2019'
		
		UNION ALL
		
		SELECT 0 AS qty, sum(qtyinvoiced) AS qty1
		FROM c_invoiceline civ
		JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_category_id = 1000511
		WHERE ci.issotrx = 'Y' AND civ.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.dateacct >= '01-01-2019' AND ci.dateacct <= '06-30-2019'
		) AS k
	) AS k
JOIN hsv_muctieu hm ON k.id = hm.value AND hm.value = '25'
