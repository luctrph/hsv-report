SELECT '1' AS id, hm.description AS stt, NAME, NULL::int4 AS hsv_dinhmuc, NULL::int4 AS a1, NULL::int4 AS a2
FROM hsv_chiso hm
WHERE VALUE = '1' AND ad_client_id = 1000019

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '2' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN sum(qty2) <> 0 THEN sum(qty1) / sum(qty2) ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT - 1 * sum(fc.qty) AS qty1, 0 AS qty2
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493) AND fc.C_Campaign_ID = 1000060 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND ad_table_id = 321
			
			UNION ALL
			
			SELECT 0 AS qty1, sum(qty) - sum(qty1) AS qty2
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
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN sum(qty2) <> 0 THEN sum(qty1) / sum(qty2) ELSE 0 END AS qty1
		FROM (
			SELECT - 1 * sum(fc.qty) AS qty1, 0 AS qty2
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493) AND fc.C_Campaign_ID = 1000060 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND ad_table_id = 321
			
			UNION ALL
			
			SELECT 0 AS qty1, sum(qty) - sum(qty1) AS qty2
			FROM (
				SELECT sum(civ.productionqty) AS qty, 0 AS qty1
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
				WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019'
				
				UNION ALL
				
				SELECT 0 AS qty, sum(civ.productionqty) AS qty1
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
				WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019'
				) AS k
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '2'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '3' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN sum(qty2) <> 0 THEN sum(qty1) / sum(qty2) ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT - 1 * sum(fc.qty) AS qty1, 0 AS qty2
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND M_Product_ID = 1015083 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.C_Campaign_ID = 1000060
			
			UNION ALL
			
			SELECT 0 AS qty1, sum(qty) AS qty2
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
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN sum(qty2) <> 0 THEN sum(qty1) / sum(qty2) ELSE 0 END AS qty1
		FROM (
			SELECT - 1 * sum(fc.qty) AS qty1, 0 AS qty2
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND M_Product_ID = 1015083 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.C_Campaign_ID = 1000060
			
			UNION ALL
			
			SELECT 0 AS qty1, sum(qty) AS qty2
			FROM (
				SELECT sum(civ.productionqty) AS qty
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
				WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015086 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019'
				
				UNION ALL
				
				SELECT sum(civ.productionqty) AS qty
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
				WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019'
				) AS k
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '3'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '4' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN sum(qty3) <> 0 THEN (sum(qty1) - sum(qty2)) / sum(qty3) ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT - 1 * sum(fc.qty) AS qty1, 0 AS qty2, 0 AS qty3
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493) AND fc.C_Campaign_ID = 1000062
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 321 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty1, - 1 * sum(fc.qty) AS qty2, 0 AS qty3
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_ID IN (1016501, 1016346,1016440) AND fc.C_Campaign_ID = 1000062
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 321 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty1, 0 AS qty2, sum(fc.qty) AS qty3
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15') AND fc.C_Campaign_ID = 1000062
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN sum(qty3) <> 0 THEN (sum(qty1) - sum(qty2)) / sum(qty3) ELSE 0 END AS qty1
		FROM (
			SELECT - 1 * sum(fc.qty) AS qty1, 0 AS qty2, 0 AS qty3
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493) AND fc.C_Campaign_ID = 1000062
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 321 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty1, - 1 * sum(fc.qty) AS qty2, 0 AS qty3
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_ID IN (1016501, 1016346,1016440) AND fc.C_Campaign_ID = 1000062
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 321 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty1, 0 AS qty2, sum(fc.qty) AS qty3
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15') AND fc.C_Campaign_ID = 1000062
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '4'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '5' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN sum(qty2) <> 0 THEN sum(qty1) / sum(qty2) ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT - 1 * sum(fc.qty) AS qty1, 0 AS qty2
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_ID IN (1016501, 1016346,1016440) AND fc.C_Campaign_ID = 1000062
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 321 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty1, sum(fc.qty) AS qty2
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID = 1000062 AND ad_table_id = 325 AND M_Product_ID = 1016903 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN sum(qty2) <> 0 THEN sum(qty1) / sum(qty2) ELSE 0 END AS qty1
		FROM (
			SELECT - 1 * sum(fc.qty) AS qty1, 0 AS qty2
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_ID IN (1016501, 1016346,1016440) AND fc.C_Campaign_ID = 1000062
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 321 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty1, sum(fc.qty) AS qty2
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID = 1000062 AND ad_table_id = 325 AND M_Product_ID = 1016903 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '5'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '6' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT sum(fc.amtacctcr - fc.amtacctdr) AS tt, 0 AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493) AND fc.C_Campaign_ID = 1000060 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND ad_table_id = 321
			
			UNION ALL
			
			SELECT 0 AS tt, sum(qty) - sum(qty1) AS qty
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
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty1
		FROM (
			SELECT sum(fc.amtacctcr - fc.amtacctdr) AS tt, 0 AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493) AND fc.C_Campaign_ID = 1000060 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND ad_table_id = 321
			
			UNION ALL
			
			SELECT 0 AS tt, sum(qty) - sum(qty1) AS qty
			FROM (
				SELECT sum(civ.productionqty) AS qty, 0 AS qty1
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
				WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019'
				
				UNION ALL
				
				SELECT 0 AS qty, sum(civ.productionqty) AS qty1
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
				WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019'
				) AS k
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '6'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '7' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT sum(fc.amtacctcr - fc.amtacctdr) AS "tt", 0 AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND M_Product_ID = 1015083 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.C_Campaign_ID = 1000060
			
			UNION ALL
			
			SELECT 0 AS "tt", sum(qty) AS qty
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
		
		UNION ALL
		
		SELECT 0 AS qty1, CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty1
		FROM (
			SELECT sum(fc.amtacctcr - fc.amtacctdr) AS "tt", 0 AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND M_Product_ID = 1015083 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.C_Campaign_ID = 1000060
			
			UNION ALL
			
			SELECT 0 AS "tt", sum(qty) AS qty
			FROM (
				SELECT sum(civ.productionqty) AS qty
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
				WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015086 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019'
				
				UNION ALL
				
				SELECT sum(civ.productionqty) AS qty
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
				WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019'
				) AS k
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '7'

UNION ALL
SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '8' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN qty <> 0 THEN k.tt / qty ELSE 0 END qty, 0 AS qty1
		FROM (
			SELECT sum(qty) - sum(qty6) AS qty, sum(tt) - sum(tt6) AS tt
			FROM (
				SELECT sum(civ.productionqty) AS qty, 0 AS tt, 0 AS qty6, 0 AS tt6
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
				JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000088
				WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id = 1000062 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
				
				UNION ALL
				
				SELECT 0 AS qty, sum(- amtacctcr + amtacctdr) AS "tt", 0 AS qty6, 0 AS tt6
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493)
					WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 224 AND fc.C_Campaign_ID = 1000062 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493)
					WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 224 AND fc.C_Campaign_ID = 1000062 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493)
					WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id <> 224 AND fc.C_Campaign_ID = 1000062 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
					) AS t
				INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000019 AND LEFT(tk.value, 4) IN ('6211')
				
				UNION ALL
				
				SELECT 0 AS qty, 0 AS "tt", sum(civ.productionqty) AS qty6, 0 AS tt6
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
				JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000088 AND hh.m_product_id = 1016903
				WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id = 1000062 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
				
				UNION ALL
				
				SELECT 0 AS qty, 0 AS tt, 0 AS qty6, sum(- amtacctcr + amtacctdr) AS tt6
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_ID IN (1016501, 1016346, 1016440)
					WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id <> 224 AND fc.C_Campaign_ID = 1000062 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_ID IN (1016501, 1016346, 1016440)
					WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 224 AND fc.C_Campaign_ID = 1000062 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_ID IN (1016501, 1016346, 1016440)
					WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 224 AND fc.C_Campaign_ID = 1000062 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
					) AS k
				) AS k
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN qty <> 0 THEN k.tt / qty ELSE 0 END qty1
		FROM (
			SELECT sum(qty) - sum(qty6) AS qty, sum(tt) - sum(tt6) AS tt
			FROM (
				SELECT sum(civ.productionqty) AS qty, 0 AS tt, 0 AS qty6, 0 AS tt6
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
				JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000088
				WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id = 1000062 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019'
				
				UNION ALL
				
				SELECT 0 AS qty, sum(- amtacctcr + amtacctdr) AS "tt", 0 AS qty6, 0 AS tt6
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493)
					WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 224 AND fc.C_Campaign_ID = 1000062 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493)
					WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 224 AND fc.C_Campaign_ID = 1000062 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493)
					WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id <> 224 AND fc.C_Campaign_ID = 1000062 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
					) AS t
				INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000019 AND LEFT(tk.value, 4) IN ('6211')
				
				UNION ALL
				
				SELECT 0 AS qty, 0 AS "tt", sum(civ.productionqty) AS qty6, 0 AS tt6
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
				JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000088 AND hh.m_product_id = 1016903
				WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id = 1000062 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019'
				
				UNION ALL
				
				SELECT 0 AS qty, 0 AS tt, 0 AS qty6, sum(- amtacctcr + amtacctdr) AS tt6
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_ID IN (1016501, 1016346, 1016440)
					WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id <> 224 AND fc.C_Campaign_ID = 1000062 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_ID IN (1016501, 1016346, 1016440)
					WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 224 AND fc.C_Campaign_ID = 1000062 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_ID IN (1016501, 1016346, 1016440)
					WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 224 AND fc.C_Campaign_ID = 1000062 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
					) AS k
				) AS k
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '8'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '9' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN qty <> 0 THEN k.tt / qty ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT  sum(qty) AS qty, sum(tt) AS tt
			FROM (
				SELECT  sum(civ.productionqty) AS qty, 0 AS tt
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
				JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000088 AND hh.m_product_id = 1016903
				WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id = 1000062 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
				
				UNION ALL
				
				SELECT 0 AS qty, sum(t.amtacctdr - t.amtacctcr) AS tt
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_ID IN (1016501, 1016346,1016440)
					WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id <> 224 AND fc.C_Campaign_ID = 1000062 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_ID IN (1016501, 1016346,1016440)
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 224 AND fc.C_Campaign_ID = 1000062 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_ID IN (1016501, 1016346,1016440)
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 224 AND fc.C_Campaign_ID = 1000062 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
					) AS t INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000019 AND LEFT(tk.value, 4) IN ('6211')
				) AS k
		
		
		) AS k
		UNION ALL
		SELECT 0 AS qty, CASE WHEN qty <> 0 THEN k.tt / qty ELSE 0 END AS qty1
		FROM (
			SELECT  sum(qty) AS qty, sum(tt) AS tt
			FROM (
				SELECT  sum(civ.productionqty) AS qty, 0 AS tt
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
				JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000088 AND hh.m_product_id = 1016903
				WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id = 1000062 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019'
				
				UNION ALL
				
				SELECT 0 AS qty, sum(t.amtacctdr - t.amtacctcr) AS tt
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_ID IN (1016501, 1016346,1016440)
					WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id <> 224 AND fc.C_Campaign_ID = 1000062 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_ID IN (1016501, 1016346,1016440)
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 224 AND fc.C_Campaign_ID = 1000062 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN m_product hh ON hh.m_product_id = fc.m_product_id AND hh.M_Product_ID IN (1016501, 1016346,1016440)
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND ad_table_id = 224 AND fc.C_Campaign_ID = 1000062 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
					) AS t INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000019 AND LEFT(tk.value, 4) IN ('6211')
				) AS k
		
		) AS k
	) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '9'

UNION ALL
SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '10' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
SELECT CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id = 1000060 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty, sum(t.amtacctdr - t.amtacctcr) AS tt
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					WHERE fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id <> 224 AND fc.c_activity_id = 1000272
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id = 224 AND fc.c_activity_id = 1000272
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_table_id = 224 AND fc.AD_Client_ID = 1000019 AND fc.c_activity_id = 1000272
					) AS t INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000019 AND LEFT(tk.value, 3) IN ('622', '627','621')
			
			) AS k
			UNION ALL
			SELECT 0 AS qty, CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty1
		FROM (
			SELECT sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000272 AND ci.c_campaign_id = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty, sum(t.amtacctdr - t.amtacctcr) AS tt
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					WHERE fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id <> 224 AND fc.c_activity_id = 1000272
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id = 224 AND fc.c_activity_id = 1000272
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_table_id = 224 AND fc.AD_Client_ID = 1000019 AND fc.c_activity_id = 1000272
					) AS t INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000019 AND LEFT(tk.value, 3) IN ('622', '627','621')
			
			) AS k
			) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '10'
UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '11' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
SELECT CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000088
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id = 1000062 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty, sum(t.amtacctdr - t.amtacctcr) AS tt
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					WHERE fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id <> 224 AND fc.c_activity_id = 1000273
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id = 224 AND fc.c_activity_id = 1000273
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_table_id = 224 AND fc.AD_Client_ID = 1000019 AND fc.c_activity_id = 1000273
					) AS t INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000019 AND LEFT(tk.value, 3) IN ('622', '627','621')
			
			) AS k
			UNION ALL
			SELECT 0 AS qty, CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty1
		FROM (
			SELECT sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000088
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id = 1000062 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty, sum(t.amtacctdr - t.amtacctcr) AS tt
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					WHERE fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id <> 224 AND fc.c_activity_id = 1000273
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id = 224 AND fc.c_activity_id = 1000273
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_table_id = 224 AND fc.AD_Client_ID = 1000019 AND fc.c_activity_id = 1000273
					) AS t INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000019 AND LEFT(tk.value, 3) IN ('622', '627','621')
			
			) AS k
			) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '11'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, concat ("name", '(', hm.hsv_dinhmuc1, '%)') AS NAME, hm.hsv_dinhmuc,  qty * hsv_dinhmuc1/100 AS a1,qty1 * hsv_dinhmuc1/100 AS a2
FROM (
	SELECT '12' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN sum(qty) <>0 THEN  sum(tt) /sum(qty) ELSE 0 END  AS qty, 0 AS qty1
		FROM (
			SELECT sum(qtyinvoiced) AS qty, 0 AS tt
			FROM c_invoice ci
			JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND ci.issotrx = 'Y'
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086
			WHERE ci.ad_client_id = 1000019 AND ci.docstatus IN ('CO', 'CL') AND ci.dateacct >= '07-01-2019' AND ci.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty, sum(t.amtacctdr - t.amtacctcr) AS tt
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					WHERE fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id <> 224 
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id = 224 
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_table_id = 224 AND fc.AD_Client_ID = 1000019 
					) AS t INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000019 AND LEFT(tk.value, 3) IN ('642')
			) AS k
			UNION ALL
			
		SELECT 0 AS qty, CASE WHEN sum(qty) <>0 THEN  sum(tt) /sum(qty) ELSE 0 END  AS qty1
		FROM (
			SELECT sum(qtyinvoiced) AS qty, 0 AS tt
			FROM c_invoice ci
			JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND ci.issotrx = 'Y'
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1015086
			WHERE ci.ad_client_id = 1000019 AND ci.docstatus IN ('CO', 'CL') AND ci.dateacct >= '01-01-2019' AND ci.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty, sum(t.amtacctdr - t.amtacctcr) AS tt
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					WHERE fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id <> 224 
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id = 224 
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_table_id = 224 AND fc.AD_Client_ID = 1000019 
					) AS t INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000019 AND LEFT(tk.value, 3) IN ('642')
			) AS k
			) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '12'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, concat ("name", '(', hm.hsv_dinhmuc1, '%)') AS NAME, hm.hsv_dinhmuc,  qty * hsv_dinhmuc1/100 AS a1,qty1 * hsv_dinhmuc1/100 AS a2
FROM (
	SELECT '13' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN sum(qty) <>0 THEN  sum(tt) /sum(qty) ELSE 0 END  AS qty, 0 AS qty1
		FROM (
			SELECT sum(qtyinvoiced) AS qty, 0 AS tt
			FROM c_invoice ci
			JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND ci.issotrx = 'Y'
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1015088
			WHERE ci.ad_client_id = 1000019 AND ci.docstatus IN ('CO', 'CL') AND ci.dateacct >= '07-01-2019' AND ci.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty, sum(t.amtacctdr - t.amtacctcr) AS tt
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					WHERE fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id <> 224 
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id = 224 
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_table_id = 224 AND fc.AD_Client_ID = 1000019 
					) AS t INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000019 AND LEFT(tk.value, 3) IN ('641')
			) AS k
			UNION ALL
			
		SELECT 0 AS qty, CASE WHEN sum(qty) <>0 THEN  sum(tt) /sum(qty) ELSE 0 END  AS qty1
		FROM (
			SELECT sum(qtyinvoiced) AS qty, 0 AS tt
			FROM c_invoice ci
			JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND ci.issotrx = 'Y'
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1015088
			WHERE ci.ad_client_id = 1000019 AND ci.docstatus IN ('CO', 'CL') AND ci.dateacct >= '01-01-2019' AND ci.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty, sum(t.amtacctdr - t.amtacctcr) AS tt
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					WHERE fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id <> 224 
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id = 224 
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_table_id = 224 AND fc.AD_Client_ID = 1000019 
					) AS t INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000019 AND LEFT(tk.value, 3) IN ('642')
			) AS k
			) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '13'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '14' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT - 1 * sum(fc.qty) AS qty, - 1 * sum(fc.amtacctdr - fc.amtacctcr) AS "tt"
			FROM fact_acct fc
			WHERE fc.ad_client_id = 1000019 AND ad_table_id = 318 AND fc.m_product_id = 1015087 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.amtacctdr = 0
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS qty1
		FROM (
			SELECT - 1 * sum(fc.qty) AS qty, - 1 * sum(fc.amtacctdr - fc.amtacctcr) AS "tt"
			FROM fact_acct fc
			WHERE fc.ad_client_id = 1000019 AND ad_table_id = 318 AND fc.m_product_id = 1015087 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.amtacctdr = 0
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '14'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '15' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT - 1 * sum(fc.qty) AS qty, - 1 * sum(fc.amtacctdr - fc.amtacctcr) AS "tt"
			FROM fact_acct fc
			WHERE ad_table_id = 318 AND fc.m_product_id = 1015086 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_client_id = 1000019
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN qty <> 0 THEN round(tt / qty, 0) ELSE 0 END AS qty1
		FROM (
			SELECT - 1 * sum(fc.qty) AS qty, - 1 * sum(fc.amtacctdr - fc.amtacctcr) AS "tt"
			FROM fact_acct fc
			WHERE ad_table_id = 318 AND fc.m_product_id = 1015086 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_client_id = 1000019
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '15'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '16' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN qty <> 0 THEN k.tt / qty ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT - 1 * sum(fc.qty) AS qty, - 1 * sum(fc.amtacctdr - fc.amtacctcr) AS "tt"
			FROM fact_acct fc
			WHERE ad_table_id = 318 AND fc.m_product_id = 1015088 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_client_id = 1000019 AND fc.amtacctdr = 0
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN qty <> 0 THEN k.tt / qty ELSE 0 END AS qty1
		FROM (
			SELECT - 1 * sum(fc.qty) AS qty, - 1 * sum(fc.amtacctdr - fc.amtacctcr) AS "tt"
			FROM fact_acct fc
			WHERE ad_table_id = 318 AND fc.m_product_id = 1015088 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_client_id = 1000019 AND fc.amtacctdr = 0
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '16'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '17' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN qty <> 0 THEN k.tt / qty ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT - 1 * sum(fc.qty) AS qty, - 1 * sum(fc.amtacctdr - fc.amtacctcr) AS "tt"
			FROM fact_acct fc
			WHERE ad_table_id = 318 AND fc.m_product_id = 1016903 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_client_id = 1000019 AND fc.amtacctdr = 0
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN qty <> 0 THEN k.tt / qty ELSE 0 END AS qty1
		FROM (
			SELECT - 1 * sum(fc.qty) AS qty, - 1 * sum(fc.amtacctdr - fc.amtacctcr) AS "tt"
			FROM fact_acct fc
			WHERE ad_table_id = 318 AND fc.m_product_id = 1016903 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_client_id = 1000019 AND fc.amtacctdr = 0
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '17'

UNION ALL
SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '18' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN qty <> 0 THEN tt / qty ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT sum(qty) AS qty, sum(tt) AS tt
			FROM (
				SELECT sum(qtyinvoiced) AS qty, 0 AS tt
				FROM c_invoice ci
				JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND ci.issotrx = 'Y'
				JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086 AND ci.C_Activity_ID = 1000272
				WHERE ci.ad_client_id = 1000019 AND ci.docstatus IN ('CO', 'CL') AND ci.dateacct >= '07-01-2019' AND ci.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT 0 AS qty, sum(t.amtacctdr - t.amtacctcr) AS tt
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					WHERE fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id <> 224 AND fc.C_Activity_ID = 1000272
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id = 224 AND fc.C_Activity_ID = 1000272
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_table_id = 224 AND fc.AD_Client_ID = 1000019 AND fc.C_Activity_ID = 1000272
					) AS t
				INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000019 AND LEFT(tk.value, 3) IN ('641')
				) AS k
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN qty <> 0 THEN tt / qty ELSE 0 END AS qty1
		FROM (
			SELECT sum(qty) AS qty, sum(tt) AS tt
			FROM (
				SELECT sum(qtyinvoiced) AS qty, 0 AS tt
				FROM c_invoice ci
				JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND ci.issotrx = 'Y'
				JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000086 AND ci.C_Activity_ID = 1000272
				WHERE ci.ad_client_id = 1000019 AND ci.docstatus IN ('CO', 'CL') AND ci.dateacct >= '01-01-2019' AND ci.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT 0 AS qty, sum(t.amtacctdr - t.amtacctcr) AS tt
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					WHERE fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id <> 224 AND fc.C_Activity_ID = 1000272
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id = 224 AND fc.C_Activity_ID = 1000272
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_table_id = 224 AND fc.AD_Client_ID = 1000019 AND fc.C_Activity_ID = 1000272
					) AS t
				INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000019 AND LEFT(tk.value, 3) IN ('641')
				) AS k
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '18'


UNION ALL
SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '19' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN k.qty <> 0 THEN k.tt / k.qty ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT sum(qty) AS qty, sum(tt) AS tt
			FROM (
				SELECT sum(qtyinvoiced) AS qty, 0 AS tt
				FROM c_invoice ci
				JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND civ.m_product_id = 1015088 AND ci.issotrx = 'Y'
				WHERE ci.docstatus IN ('CO', 'CL') AND ci.dateacct >= '07-01-2019' AND ci.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT 0 AS qty, sum(t.amtacctdr - t.amtacctcr) AS tt
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					WHERE fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id <> 224 AND fc.C_Activity_ID = 1000273
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id = 224 AND fc.C_Activity_ID = 1000273
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_table_id = 224 AND fc.AD_Client_ID = 1000019 AND fc.C_Activity_ID = 1000273
					) AS t
				INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000019 AND LEFT(tk.value, 3) IN ('641')
				) AS k
			) AS k
			UNION ALL
			SELECT 0 AS qty,CASE WHEN k.qty <> 0 THEN k.tt / k.qty ELSE 0 END AS qty1
		FROM (
			SELECT sum(qty) AS qty, sum(tt) AS tt
			FROM (
				SELECT sum(qtyinvoiced) AS qty, 0 AS tt
				FROM c_invoice ci
				JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND civ.m_product_id = 1015088 AND ci.issotrx = 'Y'
				WHERE ci.docstatus IN ('CO', 'CL') AND ci.dateacct >= '01-01-2019' AND ci.dateacct <= '07-31-2019'
				
				UNION ALL
				
				SELECT 0 AS qty, sum(t.amtacctdr - t.amtacctcr) AS tt
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					WHERE fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id <> 224 AND fc.C_Activity_ID = 1000273
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.AD_Client_ID = 1000019 AND fc.ad_table_id = 224 AND fc.C_Activity_ID = 1000273
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM Fact_Acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019' AND fc.ad_table_id = 224 AND fc.AD_Client_ID = 1000019 AND fc.C_Activity_ID = 1000273
					) AS t
				INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000019 AND LEFT(tk.value, 3) IN ('641')
				) AS k
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '19'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '20' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN (sum(qty3) + sum(qty4)) <> 0 THEN sum(qty2) / (sum(qty3) + sum(qty4)) ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT sum(fc.qty) AS qty2, 0 AS qty3, 0 AS qty4
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1016237 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty2, sum(fc.qty) AS qty3, 0 AS qty4
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID = 1000062 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty2, 0 AS qty3, sum(fc.qty) AS qty4
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID = 1000062 AND ad_table_id = 325 AND M_Product_ID = 1016903 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN (sum(qty3) + sum(qty4)) <> 0 THEN sum(qty2) / (sum(qty3) + sum(qty4)) ELSE 0 END AS qty1
		FROM (
			SELECT sum(fc.qty) AS qty2, 0 AS qty3, 0 AS qty4
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1016237 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty2, sum(fc.qty) AS qty3, 0 AS qty4
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID = 1000062 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty2, 0 AS qty3, sum(fc.qty) AS qty4
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID = 1000062 AND ad_table_id = 325 AND M_Product_ID = 1016903 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '20'

UNION ALL

SELECT '21' AS id, hm.description AS stt, NAME, NULL::int4 AS hsv_dinhmuc, NULL::int4 AS a1, NULL::int4 AS a2
FROM hsv_chiso hm
WHERE VALUE = '21' AND ad_client_id = 1000019

UNION ALL
SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
SELECT '22' AS id,  sum(qty) AS qty, sum(qty1) AS qty1
FROM(
SELECT CASE WHEN sum(qty)<> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty, 0 AS qty1
FROM (
	SELECT 0 AS qty, sum(t.amtacctdr - t.amtacctcr) AS tt
	FROM (
		SELECT  fc.amtacctdr, fc.amtacctcr, fc.account_id
		FROM Fact_Acct fc
		WHERE fc.dateacct <= '07-31-2019' AND fc.dateacct >= '07-01-2019' AND fc.AD_Client_ID IN ('1000003') AND fc.ad_table_id <> 224 AND fc.ad_org_id = 1000049
		
		UNION ALL
		
		SELECT  fc.amtacctdr, fc.amtacctcr, fc.account_id
		FROM Fact_Acct fc
		JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
		JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
		WHERE fc.dateacct <= '07-31-2019' AND fc.dateacct >= '07-01-2019' AND fc.AD_Client_ID IN ('1000003') AND fc.ad_table_id = 224 AND fc.ad_org_id = 1000049
		
		UNION ALL
		
		SELECT  fc.amtacctdr, fc.amtacctcr, fc.account_id
		FROM Fact_Acct fc
		JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
		WHERE fc.dateacct <= '07-31-2019' AND fc.dateacct >= '07-01-2019' AND fc.ad_table_id = 224 AND fc.AD_Client_ID IN ('1000003') AND fc.ad_org_id = 1000049 AND fc.line_id IS NULL
		) AS t
	INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID IN ('1000003') AND (LEFT(tk.value, 3) IN ('622', '627', '642', '641') OR LEFT(tk.value, 4) IN ('6211'))
	
	UNION ALL
	
	SELECT sum(civ.productionqty) AS qty, 0 AS tt
	FROM m_production ci
	JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_ID = 1000017
	WHERE ci.docstatus IN ('CO', 'CL') AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019' AND ci.ad_client_id = 1000003 AND ci.ad_org_id = 1000049
	) AS k
UNION ALL
SELECT 0 AS qty,CASE WHEN sum(qty)<> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty1
FROM (
	SELECT 0 AS qty, sum(t.amtacctdr - t.amtacctcr) AS tt
	FROM (
		SELECT  fc.amtacctdr, fc.amtacctcr, fc.account_id
		FROM Fact_Acct fc
		WHERE fc.dateacct <= '07-31-2019' AND fc.dateacct >= '01-01-2019' AND fc.AD_Client_ID IN ('1000003') AND fc.ad_table_id <> 224 AND fc.ad_org_id = 1000049
		
		UNION ALL
		
		SELECT  fc.amtacctdr, fc.amtacctcr, fc.account_id
		FROM Fact_Acct fc
		JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
		JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
		WHERE fc.dateacct <= '07-31-2019' AND fc.dateacct >= '01-01-2019' AND fc.AD_Client_ID IN ('1000003') AND fc.ad_table_id = 224 AND fc.ad_org_id = 1000049
		
		UNION ALL
		
		SELECT  fc.amtacctdr, fc.amtacctcr, fc.account_id
		FROM Fact_Acct fc
		JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
		WHERE fc.dateacct <= '07-31-2019' AND fc.dateacct >= '01-01-2019' AND fc.ad_table_id = 224 AND fc.AD_Client_ID IN ('1000003') AND fc.ad_org_id = 1000049 AND fc.line_id IS NULL
		) AS t
	INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID IN ('1000003') AND (LEFT(tk.value, 3) IN ('622', '627', '642', '641') OR LEFT(tk.value, 4) IN ('6211'))
	
	UNION ALL
	
	SELECT sum(civ.productionqty) AS qty, 0 AS tt
	FROM m_production ci
	JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_ID = 1000017
	WHERE ci.docstatus IN ('CO', 'CL') AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019' AND ci.ad_client_id = 1000003 AND ci.ad_org_id = 1000049
	) AS k
) AS k
) AS k 
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '22'


UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '23' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN sum(qtyinvoiced) <> 0 THEN sum(linetotalamt) / sum(qtyinvoiced) ELSE 0 END AS qty, 0 AS qty1
		FROM c_invoiceline civ
		JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL') AND ci.issotrx = 'N' AND civ.m_product_id = 1000017
		WHERE ci.ad_client_id = 1000003 AND ci.dateacct >= '07-01-2019' AND ci.dateacct <= '07-31-2019'
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN sum(qtyinvoiced) <> 0 THEN sum(linetotalamt) / sum(qtyinvoiced) ELSE 0 END AS qty1
		FROM c_invoiceline civ
		JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL') AND ci.issotrx = 'N' AND civ.m_product_id = 1000017
		WHERE ci.ad_client_id = 1000003 AND ci.dateacct >= '01-01-2019' AND ci.dateacct <= '07-31-2019'
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '23'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '24' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN qty1 <> 0 THEN qty / qty1 ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT sum(qty) AS qty, sum(qty1) AS qty1
			FROM (
				SELECT sum(qtyinternaluse) AS qty, 0 AS qty1
				FROM m_inventoryline civ
				JOIN m_inventory ci ON ci.m_inventory_id = civ.m_inventory_id
				WHERE ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019' AND ci.c_campaign_id = 1000007
				
				UNION ALL
				
				SELECT 0 AS qty, sum(civ.productionqty) AS qty1
				FROM m_productionplan civ
				JOIN m_production ci ON civ.m_production_id = ci.m_production_id
				JOIN m_product hh ON hh.m_product_id = civ.m_product_id AND m_product_category_id = 1000017
				WHERE ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019' AND ci.c_campaign_id = 1000007
				) AS k
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN qty1 <> 0 THEN qty / qty1 ELSE 0 END AS qty1
		FROM (
			SELECT sum(qty) AS qty, sum(qty1) AS qty1
			FROM (
				SELECT sum(qtyinternaluse) AS qty, 0 AS qty1
				FROM m_inventoryline civ
				JOIN m_inventory ci ON ci.m_inventory_id = civ.m_inventory_id
				WHERE ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019' AND ci.c_campaign_id = 1000007
				
				UNION ALL
				
				SELECT 0 AS qty, sum(civ.productionqty) AS qty1
				FROM m_productionplan civ
				JOIN m_production ci ON civ.m_production_id = ci.m_production_id
				JOIN m_product hh ON hh.m_product_id = civ.m_product_id AND m_product_category_id = 1000017
				WHERE ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019' AND ci.c_campaign_id = 1000007
				) AS k
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '24'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '25' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN qty1 <> 0 THEN qty / qty1 ELSE 0 END AS qty,0 AS qty1
		FROM (
			SELECT sum(qty) AS qty, sum(qty1) AS qty1
			FROM (
				SELECT sum(qtyinternaluse) AS qty, 0 AS qty1
				FROM m_inventoryline civ
				JOIN m_inventory ci ON ci.m_inventory_id = civ.m_inventory_id
				WHERE ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019' AND ci.c_campaign_id = 1000018
				
				UNION ALL
				
				SELECT 0 AS qty, sum(civ.productionqty) AS qty1
				FROM m_productionplan civ
				JOIN m_production ci ON civ.m_production_id = ci.m_production_id
				JOIN m_product hh ON hh.m_product_id = civ.m_product_id AND m_product_category_id = 1000017
				WHERE ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019' AND ci.c_campaign_id = 1000018
				) AS k
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN qty1 <> 0 THEN qty / qty1 ELSE 0 END AS qty1
		FROM (
			SELECT sum(qty) AS qty, sum(qty1) AS qty1
			FROM (
				SELECT sum(qtyinternaluse) AS qty, 0 AS qty1
				FROM m_inventoryline civ
				JOIN m_inventory ci ON ci.m_inventory_id = civ.m_inventory_id
				WHERE ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019' AND ci.c_campaign_id = 1000018
				
				UNION ALL
				
				SELECT 0 AS qty, sum(civ.productionqty) AS qty1
				FROM m_productionplan civ
				JOIN m_production ci ON civ.m_production_id = ci.m_production_id
				JOIN m_product hh ON hh.m_product_id = civ.m_product_id AND m_product_category_id = 1000017
				WHERE ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019' AND ci.c_campaign_id = 1000018
				) AS k
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '25'
UNION ALL
SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, 1.15 * k.qty AS a1, 1.15 * k.qty1 AS a2
FROM (
	SELECT '26' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN qty <> 0 THEN tt / qty ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT sum(civ.qtyinvoiced) AS qty, sum(civ.linenetamt) AS tt
			FROM c_invoice ci
			JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND ci.issotrx = 'N' AND civ.m_product_id = 1000017 AND ci.docstatus IN ('CL', 'CO')
			WHERE dateacct >= '07-01-2019' AND dateacct <= '07-31-2019'
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN qty <> 0 THEN tt / qty ELSE 0 END AS qty1
		FROM (
			SELECT sum(civ.qtyinvoiced) AS qty, sum(civ.linenetamt) AS tt
			FROM c_invoice ci
			JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND ci.issotrx = 'N' AND civ.m_product_id = 1000017 AND ci.docstatus IN ('CL', 'CO')
			WHERE dateacct >= '01-01-2019' AND dateacct <= '07-31-2019'
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '26'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '27' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT  CASE WHEN qty <> 0 THEN tt / qty ELSE 0 END AS  qty, 0 AS qty1
		FROM (
			SELECT sum(tt) AS tt, sum(qty) AS qty
			FROM (
				SELECT sum(- amtacctcr + amtacctdr) AS "tt", 0 AS qty
				FROM(
                    SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
                    FROM fact_acct fc
                    JOIN gl_journalline gl ON  fc.record_id=gl.gl_journal_id AND fc.line_id=gl.gl_journalline_id AND fc.Account_ID=gl.Account_ID
                                       AND gl.IsGenerated='N'
                    JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
                    WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND ad_table_id =224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
                    UNION ALL 
                    SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
                    FROM fact_acct fc
                    JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
                    WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND ad_table_id =224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
                    
                    UNION ALL
                    SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
                    FROM fact_acct fc
                    WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND ad_table_id <>224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
	 
			
				) AS t
				INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000003 AND LEFT(tk.value, 3) IN ('622', '627')
				
				UNION ALL
				SELECT 0 AS tt, sum(ci.productionqty) AS qty
				FROM m_productionplan ci
				JOIN m_production civ ON ci.m_production_id = civ.m_production_id
				JOIN m_attributesetinstance tt ON ci.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000000
				WHERE ci.ad_client_id = 1000003 AND civ.movementdate >= '07-01-2019' AND civ.movementdate <= '07-31-2019'
				) AS k
			) AS k
		
		UNION ALL
		SELECT  0 AS qty,CASE WHEN qty <> 0 THEN tt / qty ELSE 0 END AS  qty1
		FROM (
			SELECT sum(tt) AS tt, sum(qty) AS qty
			FROM (
				SELECT sum(- amtacctcr + amtacctdr) AS "tt", 0 AS qty
				FROM(
                    SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
                    FROM fact_acct fc
                    JOIN gl_journalline gl ON  fc.record_id=gl.gl_journal_id AND fc.line_id=gl.gl_journalline_id AND fc.Account_ID=gl.Account_ID
                                       AND gl.IsGenerated='N'
                    JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
                    WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND ad_table_id =224 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
                    UNION ALL 
                    SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
                    FROM fact_acct fc
                    JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
                    WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND ad_table_id =224 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
                    
                    UNION ALL
                    SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
                    FROM fact_acct fc
                    WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND ad_table_id <>224 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
	 
			
				) AS t
				INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000003 AND LEFT(tk.value, 3) IN ('622', '627')
				
				UNION ALL
				SELECT 0 AS tt, sum(ci.productionqty) AS qty
				FROM m_productionplan ci
				JOIN m_production civ ON ci.m_production_id = civ.m_production_id
				JOIN m_attributesetinstance tt ON ci.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000000
				WHERE ci.ad_client_id = 1000003 AND civ.movementdate >= '01-01-2019' AND civ.movementdate <= '07-31-2019'
				) AS k
			) AS k
		
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '27'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '28' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN qty <> 0 THEN tt / qty ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT sum(tt) AS tt, sum(qty) AS qty
			FROM (
				SELECT sum(- amtacctcr + amtacctdr) AS "tt", 0 AS qty
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND fc.ad_client_id <> 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
					) AS t
				INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000003 AND LEFT(tk.value, 3) IN ('642')
				
				UNION ALL
				
				SELECT 0 AS tt, sum(ci.productionqty) AS qty
				FROM m_productionplan ci
				JOIN m_production civ ON ci.m_production_id = civ.m_production_id AND civ.docstatus IN ('CO', 'CL')
				JOIN m_attributesetinstance tt ON ci.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000000
				WHERE ci.ad_client_id = 1000003 AND civ.C_Activity_ID = 1000053 AND civ.movementdate >= '07-01-2019' AND civ.movementdate <= '07-31-2019'
				) AS k
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN qty <> 0 THEN tt / qty ELSE 0 END AS qty1
		FROM (
			SELECT sum(tt) AS tt, sum(qty) AS qty
			FROM (
				SELECT sum(- amtacctcr + amtacctdr) AS "tt", 0 AS qty
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND fc.ad_client_id = 224 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND fc.ad_client_id = 224 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND fc.ad_client_id <> 224 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
					) AS t
				INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000003 AND LEFT(tk.value, 3) IN ('642')
				
				UNION ALL
				
				SELECT 0 AS tt, sum(ci.productionqty) AS qty
				FROM m_productionplan ci
				JOIN m_production civ ON ci.m_production_id = civ.m_production_id AND civ.docstatus IN ('CO', 'CL')
				JOIN m_attributesetinstance tt ON ci.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000000
				WHERE ci.ad_client_id = 1000003 AND civ.C_Activity_ID = 1000053 AND civ.movementdate >= '01-01-2019' AND civ.movementdate <= '07-31-2019'
				) AS k
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '28'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '29' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN qty <> 0 THEN tt / qty ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT sum(tt) AS tt, sum(qty) AS qty
			FROM (
				SELECT sum(- amtacctcr + amtacctdr) AS "tt", 0 AS qty
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND fc.ad_client_id <> 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
					) AS t
				INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000003 AND LEFT(tk.value, 3) IN ('641')
				
				UNION ALL
				
				SELECT 0 AS tt, sum(qtyentered)
				FROM m_inout ci
				JOIN m_inoutline civ ON ci.m_inout_id = civ.m_inout_id AND ci.issotrx = 'Y' AND ci.docstatus IN ('CL', 'CO')
				JOIN m_attributesetinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000000
				WHERE ci.dateacct >= '07-01-2019' AND ci.dateacct <= '07-31-2019'
				) AS k
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN qty <> 0 THEN tt / qty ELSE 0 END AS qty1
		FROM (
			SELECT sum(tt) AS tt, sum(qty) AS qty
			FROM (
				SELECT sum(- amtacctcr + amtacctdr) AS "tt", 0 AS qty
				FROM (
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND fc.ad_client_id = 224 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
					WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND fc.ad_client_id = 224 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
					
					UNION ALL
					
					SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
					FROM fact_acct fc
					WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND fc.ad_client_id <> 224 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
					) AS t
				INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000003 AND LEFT(tk.value, 3) IN ('641')
				
				UNION ALL
				
				SELECT 0 AS tt, sum(qtyentered)
				FROM m_inout ci
				JOIN m_inoutline civ ON ci.m_inout_id = civ.m_inout_id AND ci.issotrx = 'Y' AND ci.docstatus IN ('CL', 'CO')
				JOIN m_attributesetinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000000
				WHERE ci.dateacct >= '01-01-2019' AND ci.dateacct <= '07-31-2019'
				) AS k
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '29'

UNION ALL


SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '30' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN qty <> 0 THEN tt / qty ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT sum(tt) AS tt, sum(qty) AS qty
			FROM (
				SELECT sum(- amtacctcr + amtacctdr) AS "tt", 0 AS qty
                FROM(
                SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON  fc.record_id=gl.gl_journal_id AND fc.line_id=gl.gl_journalline_id AND fc.Account_ID=gl.Account_ID
                                   AND gl.IsGenerated='N'
                 JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND fc.ad_client_id = 224 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				 JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND fc.ad_client_id = 224 AND  fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND fc.ad_client_id <> 224 AND  fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
				) AS t
				INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000003 AND LEFT(tk.value, 3) IN ('641')
				
				UNION ALL
				
				SELECT 0 AS tt, sum(qtyentered)
				FROM m_inout ci
				JOIN m_inoutline civ ON ci.m_inout_id = civ.m_inout_id AND ci.issotrx = 'Y' AND ci.docstatus IN ('CL', 'CO')
				JOIN m_attributesetinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000000
				WHERE ci.dateacct >= '07-01-2019' AND ci.dateacct <= '07-31-2019'
				) AS k
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty,CASE WHEN qty <> 0 THEN tt / qty ELSE 0 END AS qty1
		FROM (
			SELECT sum(tt) AS tt, sum(qty) AS qty
			FROM (
				SELECT sum(- amtacctcr + amtacctdr) AS "tt", 0 AS qty
                FROM(
                SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				JOIN gl_journalline gl ON  fc.record_id=gl.gl_journal_id AND fc.line_id=gl.gl_journalline_id AND fc.Account_ID=gl.Account_ID
                                   AND gl.IsGenerated='N'
                 JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND fc.ad_client_id = 224 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				 JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
				WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND fc.ad_client_id = 224 AND  fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
				
				UNION ALL
				SELECT fc.amtacctdr, fc.amtacctcr, fc.account_id
				FROM fact_acct fc
				WHERE fc.ad_client_id = 1000003 AND fc.C_Activity_ID = 1000053 AND fc.ad_client_id <> 224 AND  fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
				) AS t
				INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID = 1000003 AND LEFT(tk.value, 3) IN ('641')
				
				UNION ALL
				
				SELECT 0 AS tt, sum(qtyentered)
				FROM m_inout ci
				JOIN m_inoutline civ ON ci.m_inout_id = civ.m_inout_id AND ci.issotrx = 'Y' AND ci.docstatus IN ('CL', 'CO')
				JOIN m_attributesetinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000000
				WHERE ci.dateacct >= '01-01-2019' AND ci.dateacct <= '07-31-2019'
				) AS k
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '30'

UNION ALL
SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
SELECT  '31' AS id,sum(qty) AS qty, sum(qty1) AS qty1
FROM (
	SELECT CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty, 0 AS qty1
	FROM (
		SELECT sum(qtyinvoiced) AS qty, 0 AS tt
		FROM c_invoice ci
		JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CL', 'CO') AND issotrx = 'Y' AND ci.ad_client_id = 1000003
		JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000000
		WHERE ci.dateacct >= '07-01-2019' AND ci.dateacct <= '07-31-2019'
		
		UNION ALL
		
		SELECT 0 AS qty, (COALESCE(sum(fc.amtacctcr), 0) - COALESCE(sum(fc.amtacctdr), 0)) AS tt
		FROM fact_acct fc
		JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000000
		JOIN c_invoice ci ON fc.record_id = ci.c_invoice_id AND ci.issotrx = 'Y'
		JOIN c_invoiceline civ ON fc.line_id = civ.c_invoiceline_id
		WHERE ad_table_id = 318 AND fc.ad_client_id = 1000003 AND ci.dateacct >= '07-01-2019' AND ci.dateacct <= '07-31-2019'
		) AS k
	
	UNION ALL
	
	SELECT 0 AS qty, CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty1
	FROM (
		SELECT sum(qtyinvoiced) AS qty, 0 AS tt
		FROM c_invoice ci
		JOIN c_invoiceline civ ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CL', 'CO') AND issotrx = 'Y' AND ci.ad_client_id = 1000003
		JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000000
		WHERE ci.dateacct >= '01-01-2019' AND ci.dateacct <= '07-31-2019'
		
		UNION ALL
		
		SELECT 0 AS qty, (COALESCE(sum(fc.amtacctcr), 0) - COALESCE(sum(fc.amtacctdr), 0)) AS tt
		FROM fact_acct fc
		JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000000
		JOIN c_invoice ci ON fc.record_id = ci.c_invoice_id AND ci.issotrx = 'Y'
		JOIN c_invoiceline civ ON fc.line_id = civ.c_invoiceline_id
		WHERE ad_table_id = 318 AND fc.ad_client_id = 1000003 AND ci.dateacct >= '01-01-2019' AND ci.dateacct <= '07-31-2019'
		) AS k
	) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '31'
UNION ALL

SELECT '33' AS id, hm.description AS stt, NAME, NULL::int4 AS hsv_dinhmuc, NULL::int4 AS a1, NULL::int4 AS a2
FROM hsv_chiso hm
WHERE VALUE = '33' AND ad_client_id = 1000019

UNION ALL

SELECT '34' AS id, hm.description AS stt, NAME, NULL::int4 AS hsv_dinhmuc, NULL::int4 AS a1, NULL::int4 AS a2
FROM hsv_chiso hm
WHERE VALUE = '34' AND ad_client_id = 1000019

UNION ALL

SELECT '35' AS id, hm.description AS stt, NAME, NULL::int4 AS hsv_dinhmuc, NULL::int4 AS a1, NULL::int4 AS a2
FROM hsv_chiso hm
WHERE VALUE = '35' AND ad_client_id = 1000019

UNION ALL

SELECT '36' AS id, hm.description AS stt, NAME, NULL::int4 AS hsv_dinhmuc, NULL::int4 AS a1, NULL::int4 AS a2
FROM hsv_chiso hm
WHERE VALUE = '36' AND ad_client_id = 1000019

UNION ALL

SELECT '37' AS id, hm.description AS stt, NAME, NULL::int4 AS hsv_dinhmuc, NULL::int4 AS a1, NULL::int4 AS a2
FROM hsv_chiso hm
WHERE VALUE = '37' AND ad_client_id = 1000019

UNION ALL

SELECT '38' AS id, hm.description AS stt, NAME, NULL::int4 AS hsv_dinhmuc, NULL::int4 AS a1, NULL::int4 AS a2
FROM hsv_chiso hm
WHERE VALUE = '38' AND ad_client_id = 1000019

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '39' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT sum(- fc.amtacctcr + fc.amtacctdr) AS "tt", 0 AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 3) IN ('622', '627')
			JOIN gl_journalline gl ON  fc.record_id=gl.gl_journal_id AND fc.line_id=gl.gl_journalline_id AND fc.Account_ID=gl.Account_ID
                                   AND gl.IsGenerated='N'
			WHERE fc.ad_client_id = 1000006 AND fc.C_Activity_ID = 1000072 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			SELECT sum(- fc.amtacctcr + fc.amtacctdr) AS "tt", 0 AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 3) IN ('622', '627')
			WHERE fc.ad_client_id = 1000006 AND fc.C_Activity_ID = 1000072 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS tt, sum(a1) - sum(a2) AS qty
			FROM (
				SELECT sum(ci.productionqty) AS a1, 0 AS a2
				FROM m_productionplan ci
				JOIN m_production civ ON ci.m_production_id = civ.m_production_id
				JOIN m_attributesetinstance tt ON ci.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000064
				WHERE ci.ad_client_id = 1000006 AND civ.movementdate >= '07-01-2019' AND civ.movementdate <= '07-31-2019'
				
				UNION ALL
				
				SELECT 0 AS a1, sum(ci.qtyinternaluse) AS a2
				FROM m_inventoryline ci
				JOIN m_inventory civ ON ci.m_inventory_id = civ.m_inventory_id
				JOIN m_attributesetinstance tt ON ci.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000064
				WHERE ci.ad_client_id = 1000006 AND civ.movementdate >= '07-01-2019' AND civ.movementdate <= '07-31-2019'
				) AS k
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty1
		FROM (
			SELECT sum(- fc.amtacctcr + fc.amtacctdr) AS "tt", 0 AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 3) IN ('622', '627')
			JOIN gl_journalline gl ON  fc.record_id=gl.gl_journal_id AND fc.line_id=gl.gl_journalline_id AND fc.Account_ID=gl.Account_ID
                                   AND gl.IsGenerated='N'
			WHERE fc.ad_client_id = 1000006 AND fc.C_Activity_ID = 1000072 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			SELECT sum(- fc.amtacctcr + fc.amtacctdr) AS "tt", 0 AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 3) IN ('622', '627')
			WHERE fc.ad_client_id = 1000006 AND fc.C_Activity_ID = 1000072 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS tt, sum(a1) - sum(a2) AS qty
			FROM (
				SELECT sum(ci.productionqty) AS a1, 0 AS a2
				FROM m_productionplan ci
				JOIN m_production civ ON ci.m_production_id = civ.m_production_id
				JOIN m_attributesetinstance tt ON ci.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000064
				WHERE ci.ad_client_id = 1000006 AND civ.movementdate >= '01-01-2019' AND civ.movementdate <= '07-31-2019'
				
				UNION ALL
				
				SELECT 0 AS a1, sum(ci.qtyinternaluse) AS a2
				FROM m_inventoryline ci
				JOIN m_inventory civ ON ci.m_inventory_id = civ.m_inventory_id
				JOIN m_attributesetinstance tt ON ci.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000064
				WHERE ci.ad_client_id = 1000006 AND civ.movementdate >= '01-01-2019' AND civ.movementdate <= '07-31-2019'
				) AS k
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '39'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '40' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT sum(- fc.amtacctcr + fc.amtacctdr) AS "tt", 0 AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 3) IN ('642')
			
			JOIN gl_journalline gl ON  fc.record_id=gl.gl_journal_id AND fc.line_id=gl.gl_journalline_id AND fc.Account_ID=gl.Account_ID
                                   AND gl.IsGenerated='N'
			WHERE fc.ad_client_id = 1000006 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			SELECT sum(- fc.amtacctcr + fc.amtacctdr) AS "tt", 0 AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 3) IN ('642')
			
			WHERE fc.ad_client_id = 1000006 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS tt, sum(a1) - sum(a2) AS qty
			FROM (
				SELECT sum(ci.productionqty) AS a1, 0 AS a2
				FROM m_productionplan ci
				JOIN m_production civ ON ci.m_production_id = civ.m_production_id
				JOIN m_attributesetinstance tt ON ci.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000064
				WHERE ci.ad_client_id = 1000006 AND civ.movementdate >= '07-01-2019' AND civ.movementdate <= '07-31-2019'
				
				UNION ALL
				
				SELECT 0 AS a1, sum(ci.qtyinternaluse) AS a2
				FROM m_inventoryline ci
				JOIN m_inventory civ ON ci.m_inventory_id = civ.m_inventory_id
				JOIN m_attributesetinstance tt ON ci.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000064
				WHERE ci.ad_client_id = 1000006 AND civ.movementdate >= '07-01-2019' AND civ.movementdate <= '07-31-2019'
				) AS k
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty1
		FROM (
			SELECT sum(- fc.amtacctcr + fc.amtacctdr) AS "tt", 0 AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 3) IN ('642')
			JOIN gl_journalline gl ON  fc.record_id=gl.gl_journal_id AND fc.line_id=gl.gl_journalline_id AND fc.Account_ID=gl.Account_ID
                                   AND gl.IsGenerated='N'
			WHERE fc.ad_client_id = 1000006 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			SELECT sum(- fc.amtacctcr + fc.amtacctdr) AS "tt", 0 AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 3) IN ('642')
			WHERE fc.ad_client_id = 1000006 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS tt, sum(a1) - sum(a2) AS qty
			FROM (
				SELECT sum(ci.productionqty) AS a1, 0 AS a2
				FROM m_productionplan ci
				JOIN m_production civ ON ci.m_production_id = civ.m_production_id
				JOIN m_attributesetinstance tt ON ci.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000064
				WHERE ci.ad_client_id = 1000006 AND civ.movementdate >= '01-01-2019' AND civ.movementdate <= '07-31-2019'
				
				UNION ALL
				
				SELECT 0 AS a1, sum(ci.qtyinternaluse) AS a2
				FROM m_inventoryline ci
				JOIN m_inventory civ ON ci.m_inventory_id = civ.m_inventory_id
				JOIN m_attributesetinstance tt ON ci.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000064
				WHERE ci.ad_client_id = 1000006 AND civ.movementdate >= '01-01-2019' AND civ.movementdate <= '07-31-2019'
				) AS k
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '40'

UNION ALL

SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '41' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT sum(- fc.amtacctcr + fc.amtacctdr) AS "tt", 0 AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 3) IN ('641')
			JOIN gl_journalline gl ON  fc.record_id=gl.gl_journal_id AND fc.line_id=gl.gl_journalline_id AND fc.Account_ID=gl.Account_ID
                                   AND gl.IsGenerated='N'
			WHERE fc.ad_client_id = 1000006 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			SELECT sum(- fc.amtacctcr + fc.amtacctdr) AS "tt", 0 AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 3) IN ('641')
			WHERE fc.ad_client_id = 1000006 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS tt, sum(qtyentered) AS qty
			FROM m_inout ci
			JOIN m_inoutline civ ON ci.m_inout_id = civ.m_inout_id AND ci.issotrx = 'Y' AND ci.docstatus IN ('CO', 'CL')
			JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000064
			WHERE ci.ad_client_id = 1000006 AND ci.dateacct >= '07-01-2019' AND ci.dateacct <= '07-31-2019'
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty1
		FROM (
			SELECT sum(- fc.amtacctcr + fc.amtacctdr) AS "tt", 0 AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 3) IN ('641')
			JOIN gl_journalline gl ON  fc.record_id=gl.gl_journal_id AND fc.line_id=gl.gl_journalline_id AND fc.Account_ID=gl.Account_ID
                                   AND gl.IsGenerated='N'
			WHERE fc.ad_client_id = 1000006 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			SELECT sum(- fc.amtacctcr + fc.amtacctdr) AS "tt", 0 AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 3) IN ('641')
			WHERE fc.ad_client_id = 1000006 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
			
			UNION ALL
			
			
			SELECT 0 AS tt, sum(qtyentered) AS qty
			FROM m_inout ci
			JOIN m_inoutline civ ON ci.m_inout_id = civ.m_inout_id AND ci.issotrx = 'Y' AND ci.docstatus IN ('CO', 'CL')
			JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000064
			WHERE ci.ad_client_id = 1000006 AND ci.dateacct >= '01-01-2019' AND ci.dateacct <= '07-31-2019'
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '41'