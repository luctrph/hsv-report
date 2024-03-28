SELECT '1' AS a1, 'I' AS a2, 'Cá Đổng' AS a3, NULL::int4 AS a4, NULL::int4 AS a5, NULL::int4 AS a6, NULL::int4 AS a7

UNION ALL

SELECT a1, a2, a3, a4, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS a5, a6, NULL::int4 AS a7
FROM (
	SELECT '2' AS a1, '1' AS a2, 'N.L Mua loại 1' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
	FROM c_invoiceline civ
	INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
	INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
	INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
	INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
	INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
	) AS k

UNION ALL

SELECT '3' AS a1, '' AS a2, 'T.Phẩm size 300 UP' AS a3, a4, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS a5, a6, CASE WHEN a7 <> 0 THEN 100 * a4 / a7 ELSE 0 END AS a7
FROM (
	SELECT sum(a4) AS a4, sum(a6) AS a6, sum(a7) AS a7
	FROM (
		SELECT sum(qtyentered) AS a4, sum(linenetamt) AS a6, 0 AS a7
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		
		UNION ALL
		
		SELECT 0 AS a4, 0 AS a6, a4 AS a7
		FROM (
			SELECT '2' AS a1, '1' AS a2, 'N.L Mua loại 1' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
			FROM c_invoiceline civ
			INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
			INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
			INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
			) AS k
		) AS k
	) AS k

UNION ALL

SELECT '4' AS a1, '' AS a2, 'TP. NL loại 2 tăng size' AS a3, a4, a5, a4 * a5 AS a6, CASE WHEN a7 <> 0 THEN 100 * a4 / a7 ELSE 0 END AS a7
FROM (
	SELECT CASE WHEN sum(sl3) - sum(sl2) > 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl3) <> 0 THEN sum(tt3) / sum(sl3) ELSE 0 END AS a5, sum(a7) AS a7
	FROM (
		SELECT sum(qtyentered) AS sl2, sum(linenetamt) AS tt2, 0 AS sl3, 0 AS tt3, 0 AS a7
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		
		UNION ALL
		
		SELECT 0 AS sl2, 0 AS tt3, sum(qtyentered) AS sl3, sum(linenetamt) AS tt3, 0 AS a7
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		
		UNION ALL
		
		SELECT 0 AS sl2, 0 AS tt3, 0 AS sl3, 0 AS tt3, sum(qtyentered) AS a7
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		) AS k
	) AS k

UNION ALL

SELECT '5' AS a1, '' AS a2, 'Rớt size (250/300)' AS a3, a4, a5, a4 * a5 AS a6, CASE WHEN a7 <> 0 THEN 100 * a4 / a7 ELSE 0 END AS a7
FROM (
	SELECT CASE WHEN sum(sl3) - sum(sl2) < 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl8) <> 0 THEN sum(tt8) / sum(sl8) ELSE 0 END AS a5, sum(a7) AS a7
	FROM (
		SELECT sum(qtyentered) AS sl2, 0 AS sl3, 0 AS sl8, 0 AS tt8, 0 AS a7
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		
		UNION ALL
		
		SELECT 0 AS sl2, sum(qtyentered) AS sl3, 0 AS sl8, 0 AS tt8, 0 AS a7
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		
		UNION ALL
		
		SELECT 0 AS sl2, 0 AS sl3, sum(qtyentered) AS sl8, sum(linenetamt) AS tt8, 0 AS a7
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		
		UNION ALL
		
		SELECT 0 AS sl2, 0 AS sl3, 0 AS sl8, 0 AS tt8, sum(qtyentered) AS a7
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		) AS k
	) AS k

UNION ALL

SELECT a1, '' AS a2, 'KQ THU MUA LOẠI 1' AS a3, sum(a4) AS a4, CASE WHEN sum(a4) <> 0 THEN sum(a6) / sum(a4) ELSE 0 END AS a5, sum(a6) AS a6, NULL::int4 AS a7
FROM (
	SELECT '6' AS a1, sum(qtyentered) AS a4, 0 AS a6
	FROM c_invoiceline civ
	INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
	INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
	INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
	INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
	INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
	
	UNION ALL
	
	SELECT '6' AS a1, 0 AS a4, (sum(a3) + sum(a5) - sum(a4) - sum(a2)) AS a6
	FROM (
		SELECT '6' AS a1, sum(linenetamt) AS a3, 0 AS a5, 0 AS a4, 0 AS a2
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		
		UNION ALL
		
		SELECT '6' AS a1, 0 AS a3, a5 AS a5, 0 AS a4, 0 AS a2
		FROM (
			SELECT a1, '6' AS a2, a4 * a5 AS a5
			FROM (
				SELECT id AS a1, CASE WHEN sum(sl3) - sum(sl2) < 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl8) <> 0 THEN sum(tt8) / sum(sl8) ELSE 0 END AS a5
				FROM (
					SELECT '6' AS id, sum(qtyentered) AS sl2, 0 AS sl3, 0 AS sl8, 0 AS tt8
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					
					UNION ALL
					
					SELECT '6' AS id, 0 AS sl2, sum(qtyentered) AS sl3, 0 AS sl8, 0 AS tt8
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					
					UNION ALL
					
					SELECT '6' AS id, 0 AS sl2, 0 AS sl3, sum(qtyentered) AS sl8, sum(linenetamt) AS tt8
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					) AS k
				GROUP BY id
				) AS k
			) AS k
		
		UNION ALL
		
		SELECT '6' AS a1, 0 AS a3, 0 AS a5, a6 AS a4, 0 AS a2
		FROM (
			SELECT a1, a2, a3, a4, a5, a4 * a5 AS a6
			FROM (
				SELECT id AS a1, '' AS a2, 'TP. NL loại 2 tăng size' AS a3, CASE WHEN sum(sl3) - sum(sl2) > 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl3) <> 0 THEN sum(tt3) / sum(sl3) ELSE 0 END AS a5
				FROM (
					SELECT '4' AS id, sum(qtyentered) AS sl2, sum(linenetamt) AS tt2, 0 AS sl3, 0 AS tt3
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					
					UNION ALL
					
					SELECT '4' AS id, 0 AS sl2, 0 AS tt3, sum(qtyentered) AS sl3, sum(linenetamt) AS tt3
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					) AS k
				GROUP BY id
				) AS k
			) AS k
		
		UNION ALL
		
		SELECT '6' AS a1, 0 AS a3, 0 AS a5, 0 AS a4, a6 AS a2
		FROM (
			SELECT a1, a2, a3, a4, a6 / a4 AS a5, a6
			FROM (
				SELECT '2' AS a1, '1' AS a2, 'N.L Mua loại 1' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				) AS k
			) AS k
		) AS k
	) AS k
GROUP BY k.a1

UNION ALL

SELECT a1, a2, a3, a4, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS a5, a6, NULL::int4 AS a7
FROM (
	SELECT '7' AS a1, '2' AS a2, 'N.L Mua loại 2' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
	FROM c_invoiceline civ
	INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
	INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
	INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
	INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
	INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
	) AS k

UNION ALL

SELECT '8' AS a1, '' AS a2, 'TP 250/300' AS a3, a4, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS a5, a6, CASE WHEN a7 <> 0 THEN 100 * a4 / a7 ELSE 0 END AS a7
FROM (
	SELECT sum(a4) AS a4, sum(a6) AS a6, sum(a7) AS a7
	FROM (
		SELECT sum(qtyentered) AS a4, sum(linenetamt) AS a6, 0 AS a7
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		
		UNION ALL
		
		SELECT 0 AS a4, 0 AS a6, sum(qtyentered) AS a7
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		) AS k
	) AS k

UNION ALL

SELECT '9' AS a1, '' AS a2, 'TP 200/250' AS a3, a4, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS a5, a6, CASE WHEN a7 <> 0 THEN 100 * a4 / a7 ELSE 0 END AS a7
FROM (
	SELECT sum(a4) AS a4, sum(a6) AS a6, sum(a7) AS a7
	FROM (
		SELECT sum(qtyentered) AS a4, sum(linenetamt) AS a6, 0 AS a7
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000446
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		
		UNION ALL
		
		SELECT 0 AS a4, 0 AS a6, sum(qtyentered) AS a7
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		) AS k
	) AS k

UNION ALL

SELECT '10' AS a1, '' AS a2, 'TP 140/200' AS a3, a4, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS a5, a6, CASE WHEN a7 <> 0 THEN 100 * a4 / a7 ELSE 0 END AS a7
FROM (
	SELECT sum(a4) AS a4, sum(a6) AS a6, sum(a7) AS a7
	FROM (
		SELECT sum(qtyentered) AS a4, sum(linenetamt) AS a6, 0 AS a7
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000445
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		
		UNION ALL
		
		SELECT 0 AS a4, 0 AS a6, sum(qtyentered) AS a7
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)	
		) AS k
	) AS k

UNION ALL

SELECT '11' AS a1, '' AS a2, 'TP  loại 3 tăng size ' AS a3, sum(a4) AS a4, sum(a5) AS a5, sum(a4) * sum(a5) AS a6, NULL::int4 AS a7
FROM (
	SELECT CASE WHEN - 1 * (sl7 - (sl4 - sl5 + sl8 + sl9 + sl10)) < 0 THEN - 1 * (sl7 - (sl4 - sl5 + sl8 + sl9 + sl10)) ELSE 0 END AS a4, dg11 AS a5
	FROM (
		SELECT sum(qtyentered) AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		
		UNION ALL
		
		SELECT 0 AS sl7, a4 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11
		FROM (
			SELECT id AS a1, '' AS a2, 'TP. NL loại 2 tăng size' AS a3, CASE WHEN sum(sl3) - sum(sl2) > 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl3) <> 0 THEN sum(tt3) / sum(sl3) ELSE 0 END AS a5
			FROM (
				SELECT '4' AS id, sum(qtyentered) AS sl2, sum(linenetamt) AS tt2, 0 AS sl3, 0 AS tt3
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				
				UNION ALL
				
				SELECT '4' AS id, 0 AS sl2, 0 AS tt3, sum(qtyentered) AS sl3, sum(linenetamt) AS tt3
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				) AS k
			GROUP BY id
			) AS k
		
		UNION ALL
		
		SELECT 0 AS sl7, 0 AS sl4, a4 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg5
		FROM (
			SELECT id AS a1, '' AS a2, 'Rớt size (250/300)' AS a3, CASE WHEN sum(sl3) - sum(sl2) < 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl8) <> 0 THEN sum(tt8) / sum(sl8) ELSE 0 END AS a5
			FROM (
				SELECT '5' AS id, sum(qtyentered) AS sl2, 0 AS sl3, 0 AS sl8, 0 AS tt8
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				
				UNION ALL
				
				SELECT '5' AS id, 0 AS sl2, sum(qtyentered) AS sl3, 0 AS sl8, 0 AS tt8
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				
				UNION ALL
				
				SELECT '5' AS id, 0 AS sl2, 0 AS sl3, sum(qtyentered) AS sl8, sum(linenetamt) AS tt8
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				) AS k
			GROUP BY id
			) AS k
		
		UNION ALL
		
		SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, a4 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg5
		FROM (
			SELECT '8' AS a1, '' AS a2, 'TP 250/300' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
			FROM c_invoiceline civ
			INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
			INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
			INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
			) AS k
		
		UNION ALL
		
		SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, a4 AS sl9, 0 AS sl10, 0 AS dg5
		FROM (
			SELECT '9' AS a1, '' AS a2, 'TP 200/250' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
			FROM c_invoiceline civ
			INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000446
			INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
			INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
			) AS k
		
		UNION ALL
		
		SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, a4 AS sl10, 0 AS dg11
		FROM (
			SELECT '10' AS a1, '' AS a2, 'TP 140/200' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
			FROM c_invoiceline civ
			INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000445
			INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
			INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
			) AS k
		
		UNION ALL
		
		SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS dg5
		FROM (
			SELECT '10' AS a1, '' AS a2, 'TP 140/200' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
			FROM c_invoiceline civ
			INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000445
			INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
			INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
			) AS k
		) AS k
	) AS k

UNION ALL

----12----
SELECT '12' AS a1, '' AS a2, 'Loại 140 DN (size nhỏ loại 2)' AS a3, a4, a5, a4 * a5 AS a6, CASE WHEN a7 <> 0 THEN 100 * a4 / a7 ELSE 0 END AS a7
FROM (
	SELECT CASE WHEN - 1 * (sum(sl7) - (sum(sl4) - sum(sl5) + sum(sl8) + sum(sl9) + sum(sl10))) > 0 THEN - 1 * (sum(sl7) - (sum(sl4) - sum(sl5) + sum(sl8) + sum(sl9) + sum(sl10))) ELSE 0 END AS a4, sum(dg11) AS a5, sum(a7) AS a7
	FROM (
		SELECT sum(qtyentered) AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11, 0 AS a7
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		
		UNION ALL
		
		SELECT 0 AS sl7, a4 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11, 0 AS a7
		FROM (
			SELECT id AS a1, '' AS a2, 'TP. NL loại 2 tăng size' AS a3, CASE WHEN sum(sl3) - sum(sl2) > 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl3) <> 0 THEN sum(tt3) / sum(sl3) ELSE 0 END AS a5
			FROM (
				SELECT '4' AS id, sum(qtyentered) AS sl2, sum(linenetamt) AS tt2, 0 AS sl3, 0 AS tt3
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				
				UNION ALL
				
				SELECT '4' AS id, 0 AS sl2, 0 AS tt3, sum(qtyentered) AS sl3, sum(linenetamt) AS tt3
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				) AS k
			GROUP BY id
			) AS k
		
		UNION ALL
		
		SELECT 0 AS sl7, 0 AS sl4, a4 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11, 0 AS a7
		FROM (
			SELECT id AS a1, '' AS a2, 'Rớt size (250/300)' AS a3, CASE WHEN sum(sl3) - sum(sl2) < 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl8) <> 0 THEN sum(tt8) / sum(sl8) ELSE 0 END AS a5, 0 AS a7
			FROM (
				SELECT '5' AS id, sum(qtyentered) AS sl2, 0 AS sl3, 0 AS sl8, 0 AS tt8
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				
				UNION ALL
				
				SELECT '5' AS id, 0 AS sl2, sum(qtyentered) AS sl3, 0 AS sl8, 0 AS tt8
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				
				UNION ALL
				
				SELECT '5' AS id, 0 AS sl2, 0 AS sl3, sum(qtyentered) AS sl8, sum(linenetamt) AS tt8
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				) AS k
			GROUP BY id
			) AS k
		
		UNION ALL
		
		SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, a4 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11, 0 AS a7
		FROM (
			SELECT '8' AS a1, '' AS a2, 'TP 250/300' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
			FROM c_invoiceline civ
			INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
			INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
			INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
			) AS k
		
		UNION ALL
		
		SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, a4 AS sl9, 0 AS sl10, 0 AS dg11, 0 AS a7
		FROM (
			SELECT '9' AS a1, '' AS a2, 'TP 200/250' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
			FROM c_invoiceline civ
			INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000446
			INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
			INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
			) AS k
		
		UNION ALL
		
		SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, a4 AS sl10, 0 AS dg11, 0 AS a7
		FROM (
			SELECT '10' AS a1, '' AS a2, 'TP 140/200' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
			FROM c_invoiceline civ
			INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000445
			INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
			INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
			) AS k
		
		UNION ALL
		
		SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS dg11, 0 AS a7
		FROM (
			SELECT '15' AS a1, '' AS a2, 'TP 140 DN' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
			FROM c_invoiceline civ
			INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000448
			INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
			INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
			) AS k
		
		UNION ALL
		
		SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11, a4 AS a7
		FROM (
			SELECT sum(qtyentered) AS a4
			FROM c_invoiceline civ
			INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
			INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
			INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
			) AS k
		) AS k
	) AS k

UNION ALL

---13----
SELECT '13' AS a1, '' AS a2, 'KQ THU MUA LOẠI 2' AS a3, sum(a4) AS a4, sum(a5) / sum(a4) AS a5, sum(a5) AS a6, NULL::int4 AS a7
FROM (
	SELECT sum(qtyentered) AS a4, 0 AS a5
	FROM c_invoiceline civ
	INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
	INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
	INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
	INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
	INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
	
	UNION ALL
	
	---13---
	SELECT 0 AS a4, (sum(a4) - sum(a5) + sum(a8) + sum(a9) + sum(a10) - sum(a11) + sum(a12) - sum(a7)) AS a5
	FROM (
		SELECT a4 * a5 AS a4, 0 AS a5, 0 AS a8, 0 AS a9, 0 AS a10, 0 AS a11, 0 AS a12, 0 AS a7
		FROM (
			SELECT id AS a1, '' AS a2, 'TP. NL loại 2 tăng size' AS a3, CASE WHEN sum(sl3) - sum(sl2) > 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl3) <> 0 THEN sum(tt3) / sum(sl3) ELSE 0 END AS a5
			FROM (
				SELECT '4' AS id, sum(qtyentered) AS sl2, sum(linenetamt) AS tt2, 0 AS sl3, 0 AS tt3
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				
				UNION ALL
				
				SELECT '4' AS id, 0 AS sl2, 0 AS tt3, sum(qtyentered) AS sl3, sum(linenetamt) AS tt3
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				) AS k
			GROUP BY id
			) AS k
		
		UNION ALL
		
		SELECT 0 AS a4, a4 * a5 AS a5, 0 AS a8, 0 AS a9, 0 AS a10, 0 AS a11, 0 AS a12, 0 AS a7
		FROM (
			SELECT id AS a1, '' AS a2, 'Rớt size (250/300)' AS a3, CASE WHEN sum(sl3) - sum(sl2) < 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl8) <> 0 THEN sum(tt8) / sum(sl8) ELSE 0 END AS a5
			FROM (
				SELECT '5' AS id, sum(qtyentered) AS sl2, 0 AS sl3, 0 AS sl8, 0 AS tt8
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				
				UNION ALL
				
				SELECT '5' AS id, 0 AS sl2, sum(qtyentered) AS sl3, 0 AS sl8, 0 AS tt8
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				
				UNION ALL
				
				SELECT '5' AS id, 0 AS sl2, 0 AS sl3, sum(qtyentered) AS sl8, sum(linenetamt) AS tt8
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				) AS k
			GROUP BY id
			) AS k
		
		UNION ALL
		
		SELECT 0 AS a4, 0 AS a5, a6 AS a8, 0 AS a9, 0 AS a10, 0 AS a11, 0 AS a12, 0 AS a7
		FROM (
			SELECT '8' AS a1, '' AS a2, 'TP 250/300' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
			FROM c_invoiceline civ
			INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
			INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
			INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
			) AS k
		
		UNION ALL
		
		---9---
		SELECT 0 AS a4, 0 AS a5, 0 AS a8, a6 AS a9, 0 AS a10, 0 AS a11, 0 AS a12, 0 AS a7
		FROM (
			SELECT '9' AS a1, '' AS a2, 'TP 200/250' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
			FROM c_invoiceline civ
			INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000446
			INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
			INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
			) AS k
		
		UNION ALL
		
		-----10-----
		SELECT 0 AS a4, 0 AS a5, 0 AS a8, 0 AS a9, a6 AS a10, 0 AS a11, 0 AS a12, 0 AS a7
		FROM (
			SELECT '10' AS a1, '' AS a2, 'TP 140/200' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
			FROM c_invoiceline civ
			INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000445
			INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
			INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
			) AS k
		
		UNION ALL
		
		---11----     
		SELECT 0 AS a4, 0 AS a5, 0 AS a8, 0 AS a9, 0 AS a10, sum(a4) * sum(a5) AS a11, 0 AS a12, 0 AS a7
		FROM (
			SELECT CASE WHEN - 1 * (sl7 - (sl4 - sl5 + sl8 + sl9 + sl10)) < 0 THEN - 1 * (sl7 - (sl4 - sl5 + sl8 + sl9 + sl10)) ELSE 0 END AS a4, dg11 AS a5
			FROM (
				SELECT sum(qtyentered) AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				
				UNION ALL
				
				SELECT 0 AS sl7, a4 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11
				FROM (
					SELECT id AS a1, '' AS a2, 'TP. NL loại 2 tăng size' AS a3, CASE WHEN sum(sl3) - sum(sl2) > 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl3) <> 0 THEN sum(tt3) / sum(sl3) ELSE 0 END AS a5
					FROM (
						SELECT '4' AS id, sum(qtyentered) AS sl2, sum(linenetamt) AS tt2, 0 AS sl3, 0 AS tt3
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						
						UNION ALL
						
						SELECT '4' AS id, 0 AS sl2, 0 AS tt3, sum(qtyentered) AS sl3, sum(linenetamt) AS tt3
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						) AS k
					GROUP BY id
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, a4 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg5
				FROM (
					SELECT id AS a1, '' AS a2, 'Rớt size (250/300)' AS a3, CASE WHEN sum(sl3) - sum(sl2) < 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl8) <> 0 THEN sum(tt8) / sum(sl8) ELSE 0 END AS a5
					FROM (
						SELECT '5' AS id, sum(qtyentered) AS sl2, 0 AS sl3, 0 AS sl8, 0 AS tt8
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						
						UNION ALL
						
						SELECT '5' AS id, 0 AS sl2, sum(qtyentered) AS sl3, 0 AS sl8, 0 AS tt8
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						
						UNION ALL
						
						SELECT '5' AS id, 0 AS sl2, 0 AS sl3, sum(qtyentered) AS sl8, sum(linenetamt) AS tt8
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						) AS k
					GROUP BY id
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, a4 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg5
				FROM (
					SELECT '8' AS a1, '' AS a2, 'TP 250/300' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, a4 AS sl9, 0 AS sl10, 0 AS dg5
				FROM (
					SELECT '9' AS a1, '' AS a2, 'TP 200/250' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000446
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, a4 AS sl10, 0 AS dg11
				FROM (
					SELECT '10' AS a1, '' AS a2, 'TP 140/200' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000445
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS dg5
				FROM (
					SELECT '10' AS a1, '' AS a2, 'TP 140/200' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000445
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					) AS k
				) AS k
			) AS k
		
		UNION ALL
		
		---12---
		SELECT 0 AS a4, 0 AS a5, 0 AS a8, 0 AS a9, 0 AS a10, 0 AS a11, sum(a4) * sum(a5) AS a12, 0 AS a7
		FROM (
			SELECT CASE WHEN - 1 * (sl7 - (sl4 - sl5 + sl8 + sl9 + sl10)) > 0 THEN - 1 * (sl7 - (sl4 - sl5 + sl8 + sl9 + sl10)) ELSE 0 END AS a4, dg11 AS a5
			FROM (
				SELECT sum(qtyentered) AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				
				UNION ALL
				
				SELECT 0 AS sl7, a4 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11
				FROM (
					SELECT id AS a1, '' AS a2, 'TP. NL loại 2 tăng size' AS a3, CASE WHEN sum(sl3) - sum(sl2) > 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl3) <> 0 THEN sum(tt3) / sum(sl3) ELSE 0 END AS a5
					FROM (
						SELECT '4' AS id, sum(qtyentered) AS sl2, sum(linenetamt) AS tt2, 0 AS sl3, 0 AS tt3
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						
						UNION ALL
						
						SELECT '4' AS id, 0 AS sl2, 0 AS tt3, sum(qtyentered) AS sl3, sum(linenetamt) AS tt3
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						) AS k
					GROUP BY id
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, a4 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg5
				FROM (
					SELECT id AS a1, '' AS a2, 'Rớt size (250/300)' AS a3, CASE WHEN sum(sl3) - sum(sl2) < 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl8) <> 0 THEN sum(tt8) / sum(sl8) ELSE 0 END AS a5
					FROM (
						SELECT '5' AS id, sum(qtyentered) AS sl2, 0 AS sl3, 0 AS sl8, 0 AS tt8
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						
						UNION ALL
						
						SELECT '5' AS id, 0 AS sl2, sum(qtyentered) AS sl3, 0 AS sl8, 0 AS tt8
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						
						UNION ALL
						
						SELECT '5' AS id, 0 AS sl2, 0 AS sl3, sum(qtyentered) AS sl8, sum(linenetamt) AS tt8
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						) AS k
					GROUP BY id
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, a4 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg5
				FROM (
					SELECT '8' AS a1, '' AS a2, 'TP 250/300' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, a4 AS sl9, 0 AS sl10, 0 AS dg5
				FROM (
					SELECT '9' AS a1, '' AS a2, 'TP 200/250' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000446
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, a4 AS sl10, 0 AS dg11
				FROM (
					SELECT '10' AS a1, '' AS a2, 'TP 140/200' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000445
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS dg5
				FROM (
					SELECT '15' AS a1, '' AS a2, 'TP 140 DN' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000448
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					) AS k
				) AS k
			) AS k
		
		UNION ALL
		
		SELECT 0 AS a4, 0 AS a5, 0 AS a8, 0 AS a9, 0 AS a10, 0 AS a11, 0 AS a12, a6 AS a7
		FROM (
			SELECT '7' AS a1, '2' AS a2, 'N.L Mua loại 2' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
			FROM c_invoiceline civ
			INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
			INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
			INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
			) AS k
		) AS k
	) AS k

UNION ALL

SELECT a1, a2, a3, a4, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS a5, a6, NULL::int4 AS a7
FROM (
	SELECT '14' AS a1, '3' AS a2, 'N.L Mua loại 3' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
	FROM c_invoiceline civ
	INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
	INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
	INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000442
	INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
	INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
	) AS k

UNION ALL

SELECT '15' AS a1, '' AS a2, 'TP 140 DN' AS a3, a4, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS a5, a6, CASE WHEN a7 <> 0 THEN 100 * a4 / a7 ELSE 0 END AS a7
FROM (
	SELECT sum(a4) AS a4, sum(a6) AS a6, sum(a7) AS a7
	FROM (
		SELECT sum(qtyentered) AS a4, sum(linenetamt) AS a6, 0 AS a7
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000448
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		
		UNION ALL
		
		SELECT 0 AS a4, 0 AS a6, sum(qtyentered) AS a7
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000442
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		) AS k
	) AS k

UNION ALL

SELECT '16' AS a1, '' AS a2, 'KQ thu mua loại 3' AS a3, sum(a4) AS a4, CASE WHEN sum(a4) <> 0 THEN sum(a6) / sum(a4) ELSE 0 END AS a5, sum(a6) AS a6, NULL::int4 AS a7
FROM (
	SELECT sum(qtyentered) AS a4, 0 AS a6
	FROM c_invoiceline civ
	INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
	INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
	INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000442
	INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
	INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
	
	UNION ALL
	
	SELECT 0 AS a4, sum(a15) + sum(a11) - sum(a12) - sum(a14) AS a6
	FROM (
		SELECT '15' AS a1, sum(linenetamt) AS a15, 0 AS a12, 0 AS a11, 0 AS a14
		FROM c_invoiceline civ
		INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
		INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000448
		INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
		INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
		
		UNION ALL
		
		--------------------------
		SELECT '15' AS a1, 0 AS a15, sum(a4) * sum(a5) AS a12, 0 AS a11, 0 AS a14
		FROM (
			SELECT CASE WHEN - 1 * (sl7 - (sl4 - sl5 + sl8 + sl9 + sl10)) > 0 THEN - 1 * (sl7 - (sl4 - sl5 + sl8 + sl9 + sl10)) ELSE 0 END AS a4, dg11 AS a5
			FROM (
				SELECT sum(qtyentered) AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				
				UNION ALL
				
				SELECT 0 AS sl7, a4 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11
				FROM (
					SELECT id AS a1, '' AS a2, 'TP. NL loại 2 tăng size' AS a3, CASE WHEN sum(sl3) - sum(sl2) > 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl3) <> 0 THEN sum(tt3) / sum(sl3) ELSE 0 END AS a5
					FROM (
						SELECT '4' AS id, sum(qtyentered) AS sl2, sum(linenetamt) AS tt2, 0 AS sl3, 0 AS tt3
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						
						UNION ALL
						
						SELECT '4' AS id, 0 AS sl2, 0 AS tt3, sum(qtyentered) AS sl3, sum(linenetamt) AS tt3
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						) AS k
					GROUP BY id
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, a4 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg5
				FROM (
					SELECT id AS a1, '' AS a2, 'Rớt size (250/300)' AS a3, CASE WHEN sum(sl3) - sum(sl2) < 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl8) <> 0 THEN sum(tt8) / sum(sl8) ELSE 0 END AS a5
					FROM (
						SELECT '5' AS id, sum(qtyentered) AS sl2, 0 AS sl3, 0 AS sl8, 0 AS tt8
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						
						UNION ALL
						
						SELECT '5' AS id, 0 AS sl2, sum(qtyentered) AS sl3, 0 AS sl8, 0 AS tt8
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						
						UNION ALL
						
						SELECT '5' AS id, 0 AS sl2, 0 AS sl3, sum(qtyentered) AS sl8, sum(linenetamt) AS tt8
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						) AS k
					GROUP BY id
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, a4 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg5
				FROM (
					SELECT '8' AS a1, '' AS a2, 'TP 250/300' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, a4 AS sl9, 0 AS sl10, 0 AS dg5
				FROM (
					SELECT '9' AS a1, '' AS a2, 'TP 200/250' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000446
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, a4 AS sl10, 0 AS dg11
				FROM (
					SELECT '10' AS a1, '' AS a2, 'TP 140/200' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000445
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS dg5
				FROM (
					SELECT '15' AS a1, '' AS a2, 'TP 140 DN' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000448
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					) AS k
				) AS k
			) AS k
		GROUP BY a1
		
		UNION ALL
		
		SELECT '15' AS a1, 0 AS a15, 0 AS a12, sum(a4) * sum(a5) AS a11, 0 AS a14
		FROM (
			SELECT CASE WHEN - 1 * (sl7 - (sl4 - sl5 + sl8 + sl9 + sl10)) < 0 THEN - 1 * (sl7 - (sl4 - sl5 + sl8 + sl9 + sl10)) ELSE 0 END AS a4, dg11 AS a5
			FROM (
				SELECT sum(qtyentered) AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				
				UNION ALL
				
				SELECT 0 AS sl7, a4 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11
				FROM (
					SELECT id AS a1, '' AS a2, 'TP. NL loại 2 tăng size' AS a3, CASE WHEN sum(sl3) - sum(sl2) > 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl3) <> 0 THEN sum(tt3) / sum(sl3) ELSE 0 END AS a5
					FROM (
						SELECT '4' AS id, sum(qtyentered) AS sl2, sum(linenetamt) AS tt2, 0 AS sl3, 0 AS tt3
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						
						UNION ALL
						
						SELECT '4' AS id, 0 AS sl2, 0 AS tt3, sum(qtyentered) AS sl3, sum(linenetamt) AS tt3
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						) AS k
					GROUP BY id
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, a4 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg5
				FROM (
					SELECT id AS a1, '' AS a2, 'Rớt size (250/300)' AS a3, CASE WHEN sum(sl3) - sum(sl2) < 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl8) <> 0 THEN sum(tt8) / sum(sl8) ELSE 0 END AS a5
					FROM (
						SELECT '5' AS id, sum(qtyentered) AS sl2, 0 AS sl3, 0 AS sl8, 0 AS tt8
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						
						UNION ALL
						
						SELECT '5' AS id, 0 AS sl2, sum(qtyentered) AS sl3, 0 AS sl8, 0 AS tt8
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						
						UNION ALL
						
						SELECT '5' AS id, 0 AS sl2, 0 AS sl3, sum(qtyentered) AS sl8, sum(linenetamt) AS tt8
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						) AS k
					GROUP BY id
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, a4 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg5
				FROM (
					SELECT '8' AS a1, '' AS a2, 'TP 250/300' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, a4 AS sl9, 0 AS sl10, 0 AS dg5
				FROM (
					SELECT '9' AS a1, '' AS a2, 'TP 200/250' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000446
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, a4 AS sl10, 0 AS dg11
				FROM (
					SELECT '10' AS a1, '' AS a2, 'TP 140/200' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000445
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					) AS k
				
				UNION ALL
				
				SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS dg5
				FROM (
					SELECT '10' AS a1, '' AS a2, 'TP 140/200' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000445
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					) AS k
				) AS k
			) AS k
		
		UNION ALL
		
		SELECT '15' AS a1, 0 AS a15, 0 AS a12, 0 AS a11, a6 AS a14
		FROM (
			SELECT '14' AS a1, '3' AS a2, 'N.L Mua loại 3' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
			FROM c_invoiceline civ
			INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
			INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
			INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000442
			INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
			INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
			) AS k
		) AS k
	) AS k

UNION ALL

SELECT '17' AS a1, '' AS a2, 'KQ thu mua cá đổng' AS a3, a4, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS a5, a6, NULL::int4 AS a7
FROM (
	SELECT sl6 + sl13 + sl16 AS a4, tt6 + tt13 + tt16 AS a6
	FROM (
		SELECT sum(sl6) AS sl6, sum(tt6) AS tt6, sum(sl13) AS sl13, sum(tt13) AS tt13, sum(sl16) AS sl16, sum(tt16) AS tt16
		FROM (
			----id 6----
			SELECT sum(a4) AS sl6, sum(a6) AS tt6, 0 AS sl13, 0 AS tt13, 0 AS sl16, 0 AS tt16
			FROM (
				SELECT '6' AS a1, sum(qtyentered) AS a4, 0 AS a6
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				
				UNION ALL
				
				SELECT '6' AS a1, 0 AS a4, (sum(a3) + sum(a5) - sum(a4) - sum(a2)) AS a6
				FROM (
					SELECT '6' AS a1, sum(linenetamt) AS a3, 0 AS a5, 0 AS a4, 0 AS a2
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					
					UNION ALL
					
					SELECT '6' AS a1, 0 AS a3, a5 AS a5, 0 AS a4, 0 AS a2
					FROM (
						SELECT a1, '6' AS a2, a4 * a5 AS a5
						FROM (
							SELECT id AS a1, CASE WHEN sum(sl3) - sum(sl2) < 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl8) <> 0 THEN sum(tt8) / sum(sl8) ELSE 0 END AS a5
							FROM (
								SELECT '6' AS id, sum(qtyentered) AS sl2, 0 AS sl3, 0 AS sl8, 0 AS tt8
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								
								UNION ALL
								
								SELECT '6' AS id, 0 AS sl2, sum(qtyentered) AS sl3, 0 AS sl8, 0 AS tt8
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								
								UNION ALL
								
								SELECT '6' AS id, 0 AS sl2, 0 AS sl3, sum(qtyentered) AS sl8, sum(linenetamt) AS tt8
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								) AS k
							GROUP BY id
							) AS k
						) AS k
					
					UNION ALL
					
					SELECT '6' AS a1, 0 AS a3, 0 AS a5, a6 AS a4, 0 AS a2
					FROM (
						SELECT a1, a2, a3, a4, a5, a4 * a5 AS a6
						FROM (
							SELECT id AS a1, '' AS a2, 'TP. NL loại 2 tăng size' AS a3, CASE WHEN sum(sl3) - sum(sl2) > 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl3) <> 0 THEN sum(tt3) / sum(sl3) ELSE 0 END AS a5
							FROM (
								SELECT '4' AS id, sum(qtyentered) AS sl2, sum(linenetamt) AS tt2, 0 AS sl3, 0 AS tt3
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								
								UNION ALL
								
								SELECT '4' AS id, 0 AS sl2, 0 AS tt3, sum(qtyentered) AS sl3, sum(linenetamt) AS tt3
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								) AS k
							GROUP BY id
							) AS k
						) AS k
					
					UNION ALL
					
					SELECT '6' AS a1, 0 AS a3, 0 AS a5, 0 AS a4, a6 AS a2
					FROM (
						SELECT a1, a2, a3, a4, a6 / a4 AS a5, a6
						FROM (
							SELECT '2' AS a1, '1' AS a2, 'N.L Mua loại 1' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
							FROM c_invoiceline civ
							INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
							INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
							INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
							INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
							INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
							) AS k
						) AS k
					) AS k
				) AS k
			
			UNION ALL
			
			-----id 13----
			SELECT 0 AS sl6, 0 AS tt6, sum(a4) AS sl13, sum(a5) AS tt13, 0 AS sl16, 0 AS tt16
			FROM (
				SELECT sum(qtyentered) AS a4, 0 AS a5
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				
				UNION ALL
				
				---13---
				SELECT 0 AS a4, (sum(a4) - sum(a5) + sum(a8) + sum(a9) + sum(a10) - sum(a11) + sum(a12) - sum(a7)) AS a5
				FROM (
					SELECT a4 * a5 AS a4, 0 AS a5, 0 AS a8, 0 AS a9, 0 AS a10, 0 AS a11, 0 AS a12, 0 AS a7
					FROM (
						SELECT id AS a1, '' AS a2, 'TP. NL loại 2 tăng size' AS a3, CASE WHEN sum(sl3) - sum(sl2) > 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl3) <> 0 THEN sum(tt3) / sum(sl3) ELSE 0 END AS a5
						FROM (
							SELECT '4' AS id, sum(qtyentered) AS sl2, sum(linenetamt) AS tt2, 0 AS sl3, 0 AS tt3
							FROM c_invoiceline civ
							INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
							INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
							INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
							INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
							INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
							
							UNION ALL
							
							SELECT '4' AS id, 0 AS sl2, 0 AS tt3, sum(qtyentered) AS sl3, sum(linenetamt) AS tt3
							FROM c_invoiceline civ
							INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
							INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
							INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
							INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
							INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
							) AS k
						GROUP BY id
						) AS k
					
					UNION ALL
					
					SELECT 0 AS a4, a4 * a5 AS a5, 0 AS a8, 0 AS a9, 0 AS a10, 0 AS a11, 0 AS a12, 0 AS a7
					FROM (
						SELECT id AS a1, '' AS a2, 'Rớt size (250/300)' AS a3, CASE WHEN sum(sl3) - sum(sl2) < 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl8) <> 0 THEN sum(tt8) / sum(sl8) ELSE 0 END AS a5
						FROM (
							SELECT '5' AS id, sum(qtyentered) AS sl2, 0 AS sl3, 0 AS sl8, 0 AS tt8
							FROM c_invoiceline civ
							INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
							INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
							INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
							INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
							INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
							
							UNION ALL
							
							SELECT '5' AS id, 0 AS sl2, sum(qtyentered) AS sl3, 0 AS sl8, 0 AS tt8
							FROM c_invoiceline civ
							INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
							INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
							INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
							INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
							INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
							
							UNION ALL
							
							SELECT '5' AS id, 0 AS sl2, 0 AS sl3, sum(qtyentered) AS sl8, sum(linenetamt) AS tt8
							FROM c_invoiceline civ
							INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
							INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
							INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
							INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
							INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
							) AS k
						GROUP BY id
						) AS k
					
					UNION ALL
					
					SELECT 0 AS a4, 0 AS a5, a6 AS a8, 0 AS a9, 0 AS a10, 0 AS a11, 0 AS a12, 0 AS a7
					FROM (
						SELECT '8' AS a1, '' AS a2, 'TP 250/300' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						) AS k
					
					UNION ALL
					
					---9---
					SELECT 0 AS a4, 0 AS a5, 0 AS a8, a6 AS a9, 0 AS a10, 0 AS a11, 0 AS a12, 0 AS a7
					FROM (
						SELECT '9' AS a1, '' AS a2, 'TP 200/250' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000446
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						) AS k
					
					UNION ALL
					
					-----10-----
					SELECT 0 AS a4, 0 AS a5, 0 AS a8, 0 AS a9, a6 AS a10, 0 AS a11, 0 AS a12, 0 AS a7
					FROM (
						SELECT '10' AS a1, '' AS a2, 'TP 140/200' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000445
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						) AS k
					
					UNION ALL
					
					---11----     
					SELECT 0 AS a4, 0 AS a5, 0 AS a8, 0 AS a9, 0 AS a10, sum(a4) * sum(a5) AS a11, 0 AS a12, 0 AS a7
					FROM (
						SELECT CASE WHEN - 1 * (sl7 - (sl4 - sl5 + sl8 + sl9 + sl10)) < 0 THEN - 1 * (sl7 - (sl4 - sl5 + sl8 + sl9 + sl10)) ELSE 0 END AS a4, dg11 AS a5
						FROM (
							SELECT sum(qtyentered) AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11
							FROM c_invoiceline civ
							INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
							INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
							INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
							INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
							INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
							
							UNION ALL
							
							SELECT 0 AS sl7, a4 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11
							FROM (
								SELECT id AS a1, '' AS a2, 'TP. NL loại 2 tăng size' AS a3, CASE WHEN sum(sl3) - sum(sl2) > 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl3) <> 0 THEN sum(tt3) / sum(sl3) ELSE 0 END AS a5
								FROM (
									SELECT '4' AS id, sum(qtyentered) AS sl2, sum(linenetamt) AS tt2, 0 AS sl3, 0 AS tt3
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									
									UNION ALL
									
									SELECT '4' AS id, 0 AS sl2, 0 AS tt3, sum(qtyentered) AS sl3, sum(linenetamt) AS tt3
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									) AS k
								GROUP BY id
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, a4 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg5
							FROM (
								SELECT id AS a1, '' AS a2, 'Rớt size (250/300)' AS a3, CASE WHEN sum(sl3) - sum(sl2) < 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl8) <> 0 THEN sum(tt8) / sum(sl8) ELSE 0 END AS a5
								FROM (
									SELECT '5' AS id, sum(qtyentered) AS sl2, 0 AS sl3, 0 AS sl8, 0 AS tt8
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									
									UNION ALL
									
									SELECT '5' AS id, 0 AS sl2, sum(qtyentered) AS sl3, 0 AS sl8, 0 AS tt8
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									
									UNION ALL
									
									SELECT '5' AS id, 0 AS sl2, 0 AS sl3, sum(qtyentered) AS sl8, sum(linenetamt) AS tt8
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									) AS k
								GROUP BY id
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, a4 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg5
							FROM (
								SELECT '8' AS a1, '' AS a2, 'TP 250/300' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, a4 AS sl9, 0 AS sl10, 0 AS dg5
							FROM (
								SELECT '9' AS a1, '' AS a2, 'TP 200/250' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000446
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, a4 AS sl10, 0 AS dg11
							FROM (
								SELECT '10' AS a1, '' AS a2, 'TP 140/200' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000445
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS dg5
							FROM (
								SELECT '10' AS a1, '' AS a2, 'TP 140/200' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000445
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								) AS k
							) AS k
						) AS k
					
					UNION ALL
					
					---12---
					SELECT 0 AS a4, 0 AS a5, 0 AS a8, 0 AS a9, 0 AS a10, 0 AS a11, sum(a4) * sum(a5) AS a12, 0 AS a7
					FROM (
						SELECT CASE WHEN - 1 * (sl7 - (sl4 - sl5 + sl8 + sl9 + sl10)) > 0 THEN - 1 * (sl7 - (sl4 - sl5 + sl8 + sl9 + sl10)) ELSE 0 END AS a4, dg11 AS a5
						FROM (
							SELECT sum(qtyentered) AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11
							FROM c_invoiceline civ
							INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
							INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
							INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
							INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
							INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
							
							UNION ALL
							
							SELECT 0 AS sl7, a4 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11
							FROM (
								SELECT id AS a1, '' AS a2, 'TP. NL loại 2 tăng size' AS a3, CASE WHEN sum(sl3) - sum(sl2) > 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl3) <> 0 THEN sum(tt3) / sum(sl3) ELSE 0 END AS a5
								FROM (
									SELECT '4' AS id, sum(qtyentered) AS sl2, sum(linenetamt) AS tt2, 0 AS sl3, 0 AS tt3
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									
									UNION ALL
									
									SELECT '4' AS id, 0 AS sl2, 0 AS tt3, sum(qtyentered) AS sl3, sum(linenetamt) AS tt3
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									) AS k
								GROUP BY id
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, a4 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg5
							FROM (
								SELECT id AS a1, '' AS a2, 'Rớt size (250/300)' AS a3, CASE WHEN sum(sl3) - sum(sl2) < 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl8) <> 0 THEN sum(tt8) / sum(sl8) ELSE 0 END AS a5
								FROM (
									SELECT '5' AS id, sum(qtyentered) AS sl2, 0 AS sl3, 0 AS sl8, 0 AS tt8
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									
									UNION ALL
									
									SELECT '5' AS id, 0 AS sl2, sum(qtyentered) AS sl3, 0 AS sl8, 0 AS tt8
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									
									UNION ALL
									
									SELECT '5' AS id, 0 AS sl2, 0 AS sl3, sum(qtyentered) AS sl8, sum(linenetamt) AS tt8
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									) AS k
								GROUP BY id
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, a4 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg5
							FROM (
								SELECT '8' AS a1, '' AS a2, 'TP 250/300' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, a4 AS sl9, 0 AS sl10, 0 AS dg5
							FROM (
								SELECT '9' AS a1, '' AS a2, 'TP 200/250' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000446
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, a4 AS sl10, 0 AS dg11
							FROM (
								SELECT '10' AS a1, '' AS a2, 'TP 140/200' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000445
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS dg5
							FROM (
								SELECT '15' AS a1, '' AS a2, 'TP 140 DN' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000448
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								) AS k
							) AS k
						) AS k
					
					UNION ALL
					
					SELECT 0 AS a4, 0 AS a5, 0 AS a8, 0 AS a9, 0 AS a10, 0 AS a11, 0 AS a12, a6 AS a7
					FROM (
						SELECT '7' AS a1, '2' AS a2, 'N.L Mua loại 2' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						) AS k
					) AS k
				) AS k
			
			UNION ALL
			
			SELECT 0 AS sl6, 0 AS tt6, 0 AS sl13, 0 AS tt13, sum(a4) AS sl16, sum(a6) AS tt16
			FROM (
				SELECT sum(qtyentered) AS a4, 0 AS a6
				FROM c_invoiceline civ
				INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
				INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
				INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000442
				INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
				INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
				
				UNION ALL
				
				SELECT 0 AS a4, sum(a15) + sum(a11) - sum(a12) - sum(a14) AS a6
				FROM (
					SELECT '15' AS a1, sum(linenetamt) AS a15, 0 AS a12, 0 AS a11, 0 AS a14
					FROM c_invoiceline civ
					INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
					INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
					INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000448
					INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
					INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
					
					UNION ALL
					
					--------------------------
					SELECT '15' AS a1, 0 AS a15, sum(a4) * sum(a5) AS a12, 0 AS a11, 0 AS a14
					FROM (
						SELECT CASE WHEN - 1 * (sl7 - (sl4 - sl5 + sl8 + sl9 + sl10)) > 0 THEN - 1 * (sl7 - (sl4 - sl5 + sl8 + sl9 + sl10)) ELSE 0 END AS a4, dg11 AS a5
						FROM (
							SELECT sum(qtyentered) AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11
							FROM c_invoiceline civ
							INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
							INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
							INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
							INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
							INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
							
							UNION ALL
							
							SELECT 0 AS sl7, a4 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11
							FROM (
								SELECT id AS a1, '' AS a2, 'TP. NL loại 2 tăng size' AS a3, CASE WHEN sum(sl3) - sum(sl2) > 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl3) <> 0 THEN sum(tt3) / sum(sl3) ELSE 0 END AS a5
								FROM (
									SELECT '4' AS id, sum(qtyentered) AS sl2, sum(linenetamt) AS tt2, 0 AS sl3, 0 AS tt3
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									
									UNION ALL
									
									SELECT '4' AS id, 0 AS sl2, 0 AS tt3, sum(qtyentered) AS sl3, sum(linenetamt) AS tt3
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									) AS k
								GROUP BY id
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, a4 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg5
							FROM (
								SELECT id AS a1, '' AS a2, 'Rớt size (250/300)' AS a3, CASE WHEN sum(sl3) - sum(sl2) < 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl8) <> 0 THEN sum(tt8) / sum(sl8) ELSE 0 END AS a5
								FROM (
									SELECT '5' AS id, sum(qtyentered) AS sl2, 0 AS sl3, 0 AS sl8, 0 AS tt8
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									
									UNION ALL
									
									SELECT '5' AS id, 0 AS sl2, sum(qtyentered) AS sl3, 0 AS sl8, 0 AS tt8
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									
									UNION ALL
									
									SELECT '5' AS id, 0 AS sl2, 0 AS sl3, sum(qtyentered) AS sl8, sum(linenetamt) AS tt8
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									) AS k
								GROUP BY id
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, a4 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg5
							FROM (
								SELECT '8' AS a1, '' AS a2, 'TP 250/300' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, a4 AS sl9, 0 AS sl10, 0 AS dg5
							FROM (
								SELECT '9' AS a1, '' AS a2, 'TP 200/250' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000446
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, a4 AS sl10, 0 AS dg11
							FROM (
								SELECT '10' AS a1, '' AS a2, 'TP 140/200' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000445
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS dg5
							FROM (
								SELECT '15' AS a1, '' AS a2, 'TP 140 DN' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000448
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								) AS k
							) AS k
						) AS k
					GROUP BY a1
					
					UNION ALL
					
					SELECT '15' AS a1, 0 AS a15, 0 AS a12, sum(a4) * sum(a5) AS a11, 0 AS a14
					FROM (
						SELECT CASE WHEN - 1 * (sl7 - (sl4 - sl5 + sl8 + sl9 + sl10)) < 0 THEN - 1 * (sl7 - (sl4 - sl5 + sl8 + sl9 + sl10)) ELSE 0 END AS a4, dg11 AS a5
						FROM (
							SELECT sum(qtyentered) AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11
							FROM c_invoiceline civ
							INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
							INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
							INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000441
							INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
							INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
							
							UNION ALL
							
							SELECT 0 AS sl7, a4 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg11
							FROM (
								SELECT id AS a1, '' AS a2, 'TP. NL loại 2 tăng size' AS a3, CASE WHEN sum(sl3) - sum(sl2) > 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl3) <> 0 THEN sum(tt3) / sum(sl3) ELSE 0 END AS a5
								FROM (
									SELECT '4' AS id, sum(qtyentered) AS sl2, sum(linenetamt) AS tt2, 0 AS sl3, 0 AS tt3
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									
									UNION ALL
									
									SELECT '4' AS id, 0 AS sl2, 0 AS tt3, sum(qtyentered) AS sl3, sum(linenetamt) AS tt3
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									) AS k
								GROUP BY id
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, a4 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg5
							FROM (
								SELECT id AS a1, '' AS a2, 'Rớt size (250/300)' AS a3, CASE WHEN sum(sl3) - sum(sl2) < 0 THEN sum(sl3) - sum(sl2) ELSE 0 END AS a4, CASE WHEN sum(sl8) <> 0 THEN sum(tt8) / sum(sl8) ELSE 0 END AS a5
								FROM (
									SELECT '5' AS id, sum(qtyentered) AS sl2, 0 AS sl3, 0 AS sl8, 0 AS tt8
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000440
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									
									UNION ALL
									
									SELECT '5' AS id, 0 AS sl2, sum(qtyentered) AS sl3, 0 AS sl8, 0 AS tt8
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000449
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									
									UNION ALL
									
									SELECT '5' AS id, 0 AS sl2, 0 AS sl3, sum(qtyentered) AS sl8, sum(linenetamt) AS tt8
									FROM c_invoiceline civ
									INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
									INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
									INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
									INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
									INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
									) AS k
								GROUP BY id
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, a4 AS sl8, 0 AS sl9, 0 AS sl10, 0 AS dg5
							FROM (
								SELECT '8' AS a1, '' AS a2, 'TP 250/300' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000447
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, a4 AS sl9, 0 AS sl10, 0 AS dg5
							FROM (
								SELECT '9' AS a1, '' AS a2, 'TP 200/250' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000446
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, a4 AS sl10, 0 AS dg11
							FROM (
								SELECT '10' AS a1, '' AS a2, 'TP 140/200' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000445
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								) AS k
							
							UNION ALL
							
							SELECT 0 AS sl7, 0 AS sl4, 0 AS sl5, 0 AS sl8, 0 AS sl9, 0 AS sl10, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS dg5
							FROM (
								SELECT '10' AS a1, '' AS a2, 'TP 140/200' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
								FROM c_invoiceline civ
								INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
								INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
								INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000445
								INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
								INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
								) AS k
							) AS k
						) AS k
					
					UNION ALL
					
					SELECT '15' AS a1, 0 AS a15, 0 AS a12, 0 AS a11, a6 AS a14
					FROM (
						SELECT '14' AS a1, '3' AS a2, 'N.L Mua loại 3' AS a3, sum(qtyentered) AS a4, sum(linenetamt) AS a6
						FROM c_invoiceline civ
						INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id = 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
						INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
						INNER JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id AND attv.M_AttributeValue_ID = 1000442
						INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
						INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
						) AS k
					) AS k
				) AS k
			) AS k
		) AS k
	) AS k

UNION ALL

SELECT '18' AS a1, 'II' AS a2, 'CÁ KHÁC' AS a3, NULL::int4 AS a4, NULL::int4 AS a5, NULL::int4 AS a6, NULL::int4 AS a7

UNION ALL

SELECT '19' AS a1, '1' AS a2, 'Nguyen lieu' AS a3, a4, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS a5, a6, NULL::int4 AS a7
FROM (
	SELECT sum(qtyentered) AS a4, sum(linenetamt) AS a6
	FROM c_invoiceline civ
	INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id <> 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
	INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
	INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
	INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
	) AS k

UNION ALL

SELECT '20' AS a1, '2' AS a2, 'Thanh Pham' AS a3, a4, CASE WHEN a4 <> 0 THEN a6 / a4 ELSE 0 END AS a5, a6, NULL::int4 AS a7
FROM (
	SELECT sum(qtyentered) AS a4, sum(linenetamt) AS a6
	FROM c_invoiceline civ
	INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id <> 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
	INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
	INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
	INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
	) AS k
	UNION ALL
	
SELECT '21' AS a1, '' AS a2, 'KET QUA CA KHAC' AS a3, sl19 AS a4, CASE WHEN sl19 <> 0 THEN (tt20-tt19) / sl19 ELSE 0 END AS a5, (tt20-tt19) AS a6, NULL::int4 AS a7
FROM (
SELECT sum(sl19) AS sl19,sum(tt19) AS tt19, sum(sl20) AS sl20, sum(tt20) AS tt20 
FROM(
	SELECT sum(qtyentered) AS sl19, sum(linenetamt) AS tt19,0 AS sl20,0 AS tt20
	FROM c_invoiceline civ
	INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id <> 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'N'
	INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
	INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
	INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)

UNION ALL
SELECT 0 AS sl19,0 AS tt19,sum(qtyentered) AS sl20, sum(linenetamt) AS tt20
FROM c_invoiceline civ
	INNER JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND civ.m_product_id <> 1016614 AND ci.ad_client_id = 1000023 AND ci.docstatus IN ('CL', 'CO') AND ci.issotrx = 'Y'
	INNER JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
	INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
	INNER JOIN m_lot lo ON tts.lot = lo.name AND tts.lot IS NOT NULL AND lo.dateto >= '01-01-2019' AND lo.dateto <= '05-31-2019' -----+ AND (lo.M_Lot_ID= $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
) AS k
) AS k