---gia thanh Bot ca---
SELECT id, a1, a2, round(a3, 0) AS a3, round(a4, 0) AS a4, round(a5, 0) AS a5
FROM (
	SELECT "id", "name" AS a1, NULL::int4 AS a2, qty AS a3, tt AS a4, dg AS a5
	FROM (
		SELECT '1' AS id, sum(qtyinvoiced) AS qty, sum(linenetamt) AS tt, CASE WHEN sum(qtyinvoiced) <> 0 THEN sum(linenetamt) / sum(qtyinvoiced) ELSE 0 END AS dg
		FROM c_invoiceline civ
		JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1015087
		WHERE ci.issotrx = 'N' AND civ.ad_client_id = 1000019 AND ci.docstatus IN ('CL', 'CO') AND ci.dateacct >= '07-01-2019' AND ci.dateacct <= '07-31-2019'
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '1'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, NULL::int4 AS a4, NULL::int4 AS a5
	FROM (
		SELECT '2' AS id, sum(qty) - sum(qty1) AS qty
		FROM (
			SELECT sum(civ.productionqty) AS qty, 0 AS qty1
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty, sum(civ.productionqty) AS qty1
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '2'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, NULL::int4 AS a4, NULL::int4 AS a5
	FROM (
		SELECT '3' AS id, sum(qty) AS qty
		FROM (
			SELECT sum(civ.productionqty) AS qty
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015086 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT sum(civ.productionqty) AS qty
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '3'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '4' AS id, - 1 * sum(fc.qty) AS qty, - 1 * sum(fc.amtacctdr - fc.amtacctcr) AS "tt"
		FROM fact_acct fc
		WHERE fc.ad_client_id = 1000019 AND ad_table_id = 318 AND fc.m_product_id = 1015087 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.amtacctdr = 0
		GROUP BY id
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '4'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '5' AS id, - 1 * sum(fc.qty) AS qty, - 1 * sum(fc.amtacctdr - fc.amtacctcr) AS "tt"
		FROM fact_acct fc
		WHERE ad_table_id = 318 AND fc.m_product_id = 1015086 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_client_id = 1000019
		GROUP BY id
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '5'
	
	UNION ALL
	
	SELECT '6' AS "id", "name" AS a1, NULL::int4 AS a2, NULL::int4 AS a3, NULL::int4 AS a4, NULL::int4 AS a5
	FROM hsv_giathanh
	WHERE ad_client_id = 1000019 AND "value" = '6'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '7' AS id, sum(qty) - sum(qty1) AS qty, sum(tt) AS tt
		FROM (
			SELECT sum(fc.qty) AS qty, 0 AS qty1, 0 AS tt
			FROM fact_acct fc
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND ad_table_id = 325 AND M_Product_ID = 1015087 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.C_Campaign_ID = 1000060
			
			UNION ALL
			
			SELECT 0 AS qty, sum(fc.qty) AS qty1, 0 AS tt
			FROM m_production ci
			INNER JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			INNER JOIN m_productionline cil ON cil.m_productionplan_id = civ.m_productionplan_id
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
			INNER JOIN fact_acct fc ON fc.record_id = ci.m_production_id AND fc.line_id = cil.m_productionline_id
			WHERE fc.ad_table_id = 325 AND fc.ad_client_id = 1000019 AND fc.M_Product_ID = 1015087 AND fc.C_Campaign_ID = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty, 0 AS qty1, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493) AND fc.C_Campaign_ID = 1000060 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND ad_table_id = 321
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '7'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '8' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT sum(fc.qty) AS qty, 0 AS "tt"
			FROM fact_acct fc
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND ad_table_id = 325 AND M_Product_ID = 1015086 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.C_Campaign_ID = 1000060
			
			UNION ALL
			
			SELECT sum(fc.qty) AS qty, 0 AS "tt"
			FROM m_production ci
			INNER JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			INNER JOIN m_productionline cil ON cil.m_productionplan_id = civ.m_productionplan_id
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
			INNER JOIN fact_acct fc ON fc.record_id = ci.m_production_id AND fc.line_id = cil.m_productionline_id
			WHERE fc.ad_table_id = 325 AND fc.ad_client_id = 1000019 AND fc.M_Product_ID = 1015087 AND fc.C_Campaign_ID = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND M_Product_ID = 1015083 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.C_Campaign_ID = 1000060
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '8'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT '9' AS id, sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT '9' AS id, 0 AS qty, sum(amtacctdr - amtacctcr) AS "tt"
			FROM (
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_table_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_table_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_table_id <> 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				) AS t
			JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '6213'
			) AS k
		GROUP BY id
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '9'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '10' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT  sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT  0 AS qty, sum(amtacctdr - amtacctcr) AS "tt"
			FROM (
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_table_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_table_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_table_id <> 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				) AS t
			JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '6221'
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '10'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '11' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT  sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT  0 AS qty, sum(amtacctdr - amtacctcr) AS "tt"
			FROM (
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_table_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_table_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_table_id <> 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				) AS t
			JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '6223'
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '11'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '12' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT  sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT  0 AS qty, sum(amtacctdr - amtacctcr) AS "tt"
			FROM (
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_table_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_table_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_table_id <> 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				) AS t
			JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '6271'
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '12'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '13' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT  sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT  0 AS qty, sum(amtacctdr - amtacctcr) AS "tt"
			FROM (
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id <> 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				) AS t
			JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '6272'
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '13'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '14' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT  sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT  0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID = 1000058
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
		
			) AS k
		GROUP BY id
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '14'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '15' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT  sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT  0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID = 1000060
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
		
			) AS k
		GROUP BY id
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '15'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '16' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT  sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT  0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID = 1000059
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
	
			) AS k
		GROUP BY id
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '16'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '17' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT  sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			UNION ALL
			
			SELECT  0 AS qty, sum(amtacctdr - amtacctcr) AS "tt"
			FROM (
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id <> 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				) AS t
			JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '6273'
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '17'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '18' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT  sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT  0 AS qty, sum(amtacctdr - amtacctcr) AS "tt"
			FROM (
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id <> 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				) AS t
			JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '6274'
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '18'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '19' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT  sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT  0 AS qty, sum(amtacctdr - amtacctcr) AS "tt"
			FROM (
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id <> 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				) AS t
			JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '6275'
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '19'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '20' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT  sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT  0 AS qty, sum(amtacctdr - amtacctcr) AS "tt"
			FROM (
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id <> 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				) AS t
			JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '6276'
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '20'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '21' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT  sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT  0 AS qty, sum(amtacctdr - amtacctcr) AS "tt"
			FROM (
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id <> 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				) AS t
			JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '6277'
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '21'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '22' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT  sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT  0 AS qty, sum(amtacctdr - amtacctcr) AS "tt"
			FROM (
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id <> 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				) AS t
			JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '6278'
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '22'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '23' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT  sum(qtyinvoiced) AS qty, 0 AS tt
			FROM c_invoice ci
			JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND ci.issotrx = 'Y'
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.ad_client_id = 1000019 AND ci.docstatus IN ('CO', 'CL') AND ci.dateacct >= '07-01-2019' AND ci.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT  0 AS qty, sum(amtacctdr - amtacctcr) AS "tt"
			FROM (
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id <> 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				) AS t
			JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '6411'
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '23'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '24' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT  sum(qtyinvoiced) AS qty, 0 AS tt
			FROM c_invoice ci
			JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND ci.issotrx = 'Y'
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.ad_client_id = 1000019 AND ci.docstatus IN ('CO', 'CL') AND ci.dateacct >= '07-01-2019' AND ci.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT  0 AS qty, sum(amtacctdr - amtacctcr) AS "tt"
			FROM (
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id <> 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				) AS t
			JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '6417'
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '24'
	
	UNION ALL
	
	SELECT id, "name" AS a1, hsv_dinhmuc AS a2, qty AS a3, tt AS a4, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS a5
	FROM (
		SELECT '25' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT  sum(qtyinvoiced) AS qty, 0 AS tt
			FROM c_invoice ci
			JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND ci.issotrx = 'Y'
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.ad_client_id = 1000019 AND ci.docstatus IN ('CO', 'CL') AND ci.dateacct >= '07-01-2019' AND ci.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT  0 AS qty, sum(amtacctdr - amtacctcr) AS "tt"
			FROM (
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id <> 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				) AS t
			JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '6418'
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '25'
	
	UNION ALL
	
	SELECT id, concat ("name", '(', tp.hsv_dinhmuc1, '%)') AS a1, hsv_dinhmuc AS a2, qty AS a3, CASE WHEN tp.hsv_dinhmuc1 <> 0 AND tp.hsv_dinhmuc1 IS NOT NULL THEN k.tt * hsv_dinhmuc1 / 100 ELSE 0 END AS a4, CASE WHEN k.qty <> 0 AND 
				hsv_dinhmuc1 <> 0 AND hsv_dinhmuc1 IS NOT NULL THEN round((k.tt * hsv_dinhmuc1) / (k.qty * 100), 0) ELSE 0 END AS a5
	FROM (
		SELECT '26' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT  sum(qtyinvoiced) AS qty, 0 AS tt
			FROM c_invoice ci
			JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND ci.issotrx = 'Y'
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.ad_client_id = 1000019 AND ci.docstatus IN ('CO', 'CL') AND ci.dateacct >= '07-01-2019' AND ci.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT  0 AS qty, sum(amtacctdr - amtacctcr) AS "tt"
			FROM (
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id <> 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				) AS t
			JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '6421'
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '26'
	
	UNION ALL
	
	SELECT id, concat ("name", '(', tp.hsv_dinhmuc1, '%)') AS a1, hsv_dinhmuc AS a2, qty AS a3, CASE WHEN tp.hsv_dinhmuc1 <> 0 AND tp.hsv_dinhmuc1 IS NOT NULL THEN k.tt * hsv_dinhmuc1 / 100 ELSE 0 END AS a4, CASE WHEN k.qty <> 0 AND 
				hsv_dinhmuc1 <> 0 AND hsv_dinhmuc1 IS NOT NULL THEN round((k.tt * hsv_dinhmuc1) / (k.qty * 100), 0) ELSE 0 END AS a5
	FROM (
		SELECT '27' AS id, sum(qty) AS qty, sum(tt) AS tt
		FROM (
			SELECT  sum(qtyinvoiced) AS qty, 0 AS tt
			FROM c_invoice ci
			JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND ci.issotrx = 'Y'
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.ad_client_id = 1000019 AND ci.docstatus IN ('CO', 'CL') AND ci.dateacct >= '07-01-2019' AND ci.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT  0 AS qty, sum(amtacctdr - amtacctcr) AS "tt"
			FROM (
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND fc.ad_client_id <> 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				) AS t
			JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '6428'
			) AS k
		) AS k
	RIGHT JOIN hsv_giathanh tp ON tp.value = k.id
	WHERE ad_client_id = 1000019 AND tp.value = '27'
	) AS k
	