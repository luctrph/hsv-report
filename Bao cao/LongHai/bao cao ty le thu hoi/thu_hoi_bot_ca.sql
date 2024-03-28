--- thu hoi bot ca---

SELECT description,"name", hsv_dinhmuc1,id,qty AS qty, round(tt,0) AS tt,round(dg,2) AS dg
FROM(
SELECT tp.description, tp.name, NULL::int4 AS hsv_dinhmuc1, tp.value AS id, NULL::int4 AS qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM hsv_thanhpham tp
WHERE "value" = '1' AND ad_client_id = 1000019

UNION ALL

SELECT tp.description, tp.name, NULL::int4 AS hsv_dinhmuc1, tp.value, k.qty, k.tt, CASE WHEN k.qty <> 0 THEN round(k.tt / k.qty, 2) ELSE 0 END AS dg
FROM (
	SELECT '2' AS id, - 1 * sum(fc.qty) AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND M_Product_ID = 1015083 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '04-30-2019' AND fc.C_Campaign_ID = 1000060
	GROUP BY id
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '2'

UNION ALL

SELECT tp.description, tp.name, NULL::int4 AS hsv_dinhmuc1, tp.value, k.qty, k.tt, CASE WHEN k.qty <> 0 THEN round(k.tt / k.qty, 2) ELSE 0 END AS dg
FROM (
	SELECT '3' AS id, - 1 * sum(fc.qty) AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493) AND fc.C_Campaign_ID = 1000060 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '04-30-2019'
	WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND ad_table_id = 321
	GROUP BY id
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '3'

UNION ALL

SELECT k.value, k.name, k.dinhmuc1, k.id, k.qty, k.tt, CASE WHEN k.qty <> 0 THEN round(k.tt / k.qty, 2) ELSE 0 END AS dg
FROM (
	SELECT CONCAT ('2.', CAST(ROW_NUMBER() OVER () AS VARCHAR)) AS "value", hh.name, 0 AS dinhmuc1, '100' AS id, - 1 * sum(fc.qty) AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493) AND fc.C_Campaign_ID = 1000060 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '04-30-2019'
	WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND fc.ad_client_id = 1000019
	GROUP BY hh.name
	) AS k

UNION ALL

SELECT tp.description, tp.name, NULL::int4 AS hsv_dinhmuc1, "value" AS id, NULL::int4 AS qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM hsv_thanhpham tp
WHERE "value" = '4' AND ad_client_id = 1000019

UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, "value" AS id, NULL::int4 AS qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM hsv_thanhpham tp
WHERE "value" = '5' AND ad_client_id = 1000019

UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, qty AS qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM (
	SELECT '6' AS id, sum(qty) AS qty
	FROM (
		SELECT sum(civ.productionqty) AS qty
		FROM m_production ci
		JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
		WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015086 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
		
		UNION ALL
		
		SELECT sum(civ.productionqty) AS qty
		FROM m_production ci
		JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
		WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
		) AS k
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '6'

UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, qty AS qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM (
	SELECT '7' AS id, sum(qty) - sum(qty1) AS qty
	FROM (
		SELECT sum(civ.productionqty) AS qty, 0 AS qty1
		FROM m_production ci
		JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
		WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
		
		UNION ALL
		
		SELECT 0 AS qty, sum(civ.productionqty) AS qty1
		FROM m_production ci
		JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
		WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
		) AS k
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '7'

UNION ALL

SELECT tp.description, tp.name, NULL::int4 AS hsv_dinhmuc1, tp.value AS id, NULL::int4 AS qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM hsv_thanhpham tp
WHERE "value" = '8' AND ad_client_id = 1000019

UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, qty AS qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM (
	SELECT '9' AS id,CASE WHEN sum(qty2)<>0 THEN sum(qty1) / sum(qty2) ELSE 0 END AS qty
	FROM (
		SELECT sum(qty) AS qty1, 0 AS qty2
		FROM (
			SELECT '2' AS id, - 1 * sum(fc.qty) AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND M_Product_ID = 1015083 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '04-30-2019' AND fc.C_Campaign_ID = 1000060
			GROUP BY id
			
			UNION ALL
			
			SELECT '3' AS id, - 1 * sum(fc.qty) AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493) AND fc.C_Campaign_ID = 1000060 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '04-30-2019'
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND ad_table_id = 321
			GROUP BY id
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty1, sum(qty) AS qty2
		FROM (
			SELECT '6' AS id, sum(qty) AS qty
			FROM (
				SELECT sum(civ.productionqty) AS qty
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
				WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015086 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
				
				UNION ALL
				
				SELECT sum(civ.productionqty) AS qty
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
				WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
				) AS k
			
			UNION ALL
			
			SELECT '7' AS id, sum(qty) - sum(qty1) AS qty
			FROM (
				SELECT sum(civ.productionqty) AS qty, 0 AS qty1
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
				WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
				
				UNION ALL
				
				SELECT 0 AS qty, sum(civ.productionqty) AS qty1
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
				WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
				) AS k
			) AS k
		) AS k
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '9'

UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, qty AS qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM (
	SELECT '10' AS id, CASE WHEN sum(qty2) <> 0 THEN sum(qty1) / sum(qty2) ELSE 0 END AS qty
	FROM (
		SELECT - 1 * sum(fc.qty) AS qty1, 0 AS qty2
		FROM fact_acct fc
		JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
		JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493) AND fc.C_Campaign_ID = 1000060 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '04-30-2019'
		WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND ad_table_id = 321
		
		UNION ALL
		
		SELECT 0 AS qty1, sum(qty) - sum(qty1) AS qty2
		FROM (
			SELECT sum(civ.productionqty) AS qty, 0 AS qty1
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
			
			UNION ALL
			
			SELECT 0 AS qty, sum(civ.productionqty) AS qty1
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
			) AS k
		) AS k
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '10'

UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, qty AS qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM (
	SELECT '11' AS id, CASE WHEN sum(qty2)<>0 THEN sum(qty1) / sum(qty2) ELSE 0 END AS qty
	FROM (
		SELECT - 1 * sum(fc.qty) AS qty1, 0 AS qty2
		FROM fact_acct fc
		JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
		WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND M_Product_ID = 1015083 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '04-30-2019' AND fc.C_Campaign_ID = 1000060
		
		UNION ALL
		
		SELECT 0 AS qty1, sum(qty) AS qty2
		FROM (
			SELECT sum(civ.productionqty) AS qty
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015086 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
			
			UNION ALL
			
			SELECT sum(civ.productionqty) AS qty
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
			) AS k
		) AS k
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '11'

UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, NULL::int4 AS qty, NULL::int4 AS tt, dg AS dg
FROM (
	SELECT '12' AS id, CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS dg
	FROM (
		SELECT sum(tt) AS tt, 0 AS qty
		FROM (
			SELECT '2' AS id, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND M_Product_ID = 1015083 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '04-30-2019' AND fc.C_Campaign_ID = 1000060
			
			UNION ALL
			
			SELECT '3' AS id, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493) AND fc.C_Campaign_ID = 1000060 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '04-30-2019'
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND ad_table_id = 321
			) AS k
		
		UNION ALL
		
		SELECT 0 AS tt, sum(qty) AS qty
		FROM (
			SELECT '6' AS id, sum(qty) AS qty
			FROM (
				SELECT sum(civ.productionqty) AS qty
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
				WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015086 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
				
				UNION ALL
				
				SELECT sum(civ.productionqty) AS qty
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
				WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
				) AS k
			
			UNION ALL
			
			SELECT '7' AS id, sum(qty) - sum(qty1) AS qty
			FROM (
				SELECT sum(civ.productionqty) AS qty, 0 AS qty1
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
				WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
				
				UNION ALL
				
				SELECT 0 AS qty, sum(civ.productionqty) AS qty1
				FROM m_production ci
				JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
				WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
				) AS k
			) AS k
		) AS k
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '12'

UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, NULL::int4 AS qty, NULL::int4 AS tt, dg AS dg
FROM (
	SELECT '13' AS id,CASE WHEN sum(qty)<>0 THEN  sum(tt) / sum(qty) ELSE 0 END AS dg
	FROM (
		SELECT sum(fc.amtacctcr - fc.amtacctdr) AS tt, 0 AS qty
		FROM fact_acct fc
		JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
		JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492, 1000493) AND fc.C_Campaign_ID = 1000060 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '04-30-2019'
		WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000272 AND ad_table_id = 321
		
		UNION ALL
		
		SELECT 0 AS tt, sum(qty) - sum(qty1) AS qty
		FROM (
			SELECT sum(civ.productionqty) AS qty, 0 AS qty1
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
			
			UNION ALL
			
			SELECT 0 AS qty, sum(civ.productionqty) AS qty1
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
			) AS k
		) AS k
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '13'

UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, NULL::int4 AS qty, NULL::int4 AS tt, dg AS dg
FROM (
	SELECT '14' AS id, CASE WHEN sum(qty)<> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS dg
	FROM (
		SELECT sum(fc.amtacctcr - fc.amtacctdr) AS "tt", 0 AS qty
		FROM fact_acct fc
		JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
		WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND M_Product_ID = 1015083 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '04-30-2019' AND fc.C_Campaign_ID = 1000060
		
		UNION ALL
		
		SELECT 0 AS "tt", sum(qty) AS qty
		FROM (
			SELECT sum(civ.productionqty) AS qty
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015086 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
			
			UNION ALL
			
			SELECT sum(civ.productionqty) AS qty
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id AND docstatus IN ('CO', 'CL')
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000333
			WHERE ci.ad_client_id = 1000019 AND civ.M_Product_ID = 1015087 AND ci.C_Campaign_ID = 1000060 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '04-30-2019'
			) AS k
		) AS k
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '14'
) AS k