SELECT k.c1, sum(c2) AS c2, sum(c3) AS c3, sum(c4) AS c4, sum(c5) AS c5, CASE WHEN sum(c5) <> 0 THEN sum(c6) / sum(c5) * 100 ELSE 0 END AS c6, CASE WHEN sum(c5) <> 0 THEN sum(c7) / sum(c5) * 100 ELSE 0 END AS c7, CASE WHEN sum(c5) <> 0 THEN sum(c8) / sum(c5) * 100 ELSE 0 END AS c8, CASE WHEN sum(c5) <> 0 THEN sum(c2) / sum(c5) ELSE 0 END AS c9, sum(k.c10) - sum(k.c3) AS c10
FROM (
	SELECT k.lot AS c1, k.sl AS c2, k.tt AS c3, k.tt / k.sl AS c4, 0 AS c5, 0 AS c6, 0 AS c7, 0 AS c8, 0 AS c9, 0 AS c10
	FROM (
		SELECT t.lot, sum(t.sl) AS sl, sum(t.tt) AS tt
		FROM (
			SELECT att.lot, civ.qtyinvoiced AS sl, civ.priceactual * civ.qtyinvoiced AS tt
			FROM c_invoiceline civ
			JOIN c_invoice ci ON civ.c_invoice_id = ci.c_invoice_id AND ci.issotrx = 'N' AND ci.docstatus IN ('CO', 'CL')
			JOIN m_product hh ON hh.m_product_id = civ.m_product_id AND hh.m_product_category_id = 1000084 AND  hh.M_Product_ID NOT IN (1013024)
			JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.lot IS NOT NULL
			WHERE civ.ad_client_id = 1000006
			) AS t
		JOIN m_lot lo ON lo.name = t.lot AND lo.dateto >= '9-1-2018' AND lo.dateto <= '10-30-2018'
		GROUP BY t.lot
		) AS k
	
	UNION ALL
	
	--- Tổng SL SX C5
	SELECT k.lot AS c1, 0 c2, 0 AS c3, 0 AS c4, k.sl AS c5, 0 AS c6, 0 AS c7, 0 AS c8, 0 AS c9, 0 AS c10
	FROM (
		SELECT att.m_attributesetinstance_id, att.lot, civ.productionqty AS sl
		FROM m_productionplan civ
		JOIN m_production pro ON civ.m_production_id = pro.m_production_id AND pro.docstatus IN ('CO', 'CL')
		JOIN m_product hh ON hh.m_product_id = civ.m_product_id AND hh.M_Product_Category_ID = 1000085 AND  hh.M_Product_ID NOT IN (1013026)
		JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.lot IS NOT NULL AND att.M_AttributeSet_ID = 1000065
		WHERE civ.ad_client_id = 1000006
		) AS k
	JOIN m_lot lo ON lo.name = k.lot AND lo.dateto >= '9-1-2018' AND lo.dateto <= '10-30-2018'
	
	UNION ALL
	
	--số lượng ván A ,column C6
	SELECT t.lot AS c1, 0 c2, 0 AS c3, 0 AS c4, 0 AS c5, sum(t.sl) AS c6, 0 AS c7, 0 AS c8, 0 AS c9, 0 AS c10
	FROM (
		SELECT tt.lot, civ.productionqty AS sl
		FROM m_productionplan civ
		JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1004077 AND  hh.M_Product_ID NOT IN (1013026)
		JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
		WHERE civ.ad_client_id = 1000006
		) AS t
	JOIN m_lot lo ON lo.name = t.lot
	WHERE lo.m_lot_id IS NOT NULL AND lo.dateto >= '9-1-2018' AND lo.dateto <= '10-30-2018'
	GROUP BY t.lot
	--số lượng van B(C7)
	
	UNION ALL
	
	SELECT t.lot AS c1, 0 c2, 0 AS c3, 0 AS c4, 0 AS c5, 0 AS c6, sum(t.sl) AS c7, 0 AS c8, 0 AS c9, 0 AS c10
	FROM (
		SELECT tt.lot, civ.productionqty AS sl
		FROM m_productionplan civ
		JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1004076 AND  hh.M_Product_ID NOT IN (1013026)
		JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
		WHERE civ.ad_client_id = 1000006
		) AS t
	JOIN m_lot lo ON lo.name = t.lot
	WHERE lo.m_lot_id IS NOT NULL AND lo.dateto >= '9-1-2018' AND lo.dateto <= '10-30-2018'
	GROUP BY t.lot
	-- số lượng van C(c8)
	
	UNION ALL
	
	SELECT t.lot AS c1, 0 c2, 0 AS c3, 0 AS c4, 0 AS c5, 0 AS c6, 0 AS c7, sum(t.sl) AS c8, 0 AS c9, 0 AS c10
	FROM (
		SELECT tt.lot, civ.productionqty AS sl
		FROM m_productionplan civ
		JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1004079 AND  hh.M_Product_ID NOT IN (1013026)
		JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
		WHERE civ.ad_client_id = 1000006
		) AS t
	JOIN m_lot lo ON lo.name = t.lot
	WHERE lo.m_lot_id IS NOT NULL AND lo.dateto >= '9-1-2018' AND lo.dateto <= '10-30-2018'
	GROUP BY t.lot
	--------Hiệu quả thu mua--------------------------
	
	UNION ALL
	
	SELECT t.lot AS c1, 0 c2, 0 AS c3, 0 AS c4, 0 AS c5, 0 AS c6, 0 AS c7, 0 AS c8, 0 AS c9, sum(c10) AS c10
	FROM (
		--- kết quả van loại A
		SELECT t.lot, sum(t.hq) AS c10
		FROM (
			SELECT tt.lot, civ.productionqty * hsv.hsv_dinhmuc AS hq
			FROM hsv_kqthumua hsv, m_productionplan civ
			JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1004077 AND  hh.M_Product_ID NOT IN (1013026)
			JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
			WHERE civ.ad_client_id = 1000006 AND hsv.hsv_kqthumua_ID = 1000014
			) AS t
		JOIN m_lot lo ON lo.name = t.lot
		WHERE lo.m_lot_id IS NOT NULL AND lo.dateto >= '9-1-2018' AND lo.dateto <= '10-30-2018'
		GROUP BY t.lot
		-- van B
		
		UNION ALL
		
		SELECT t.lot, sum(t.hq) AS c10
		FROM (
			SELECT tt.lot, civ.productionqty * hsv.hsv_dinhmuc AS hq
			FROM hsv_kqthumua hsv, m_productionplan civ
			JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1004076 AND  hh.M_Product_ID NOT IN (1013026)
			JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
			WHERE civ.ad_client_id = 1000006 AND hsv.hsv_kqthumua_ID = 1000015
			) AS t
		JOIN m_lot lo ON lo.name = t.lot
		WHERE lo.m_lot_id IS NOT NULL AND lo.dateto >= '9-1-2018' AND lo.dateto <= '10-30-2018'
		GROUP BY t.lot
		--van C
		
		UNION ALL
		
		SELECT t.lot, sum(t.hq) AS c10
		FROM (
			SELECT tt.lot, civ.productionqty * hsv.hsv_dinhmuc AS hq
			FROM hsv_kqthumua hsv, m_productionplan civ
			JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1004079 AND  hh.M_Product_ID NOT IN (1013026)
			JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
			WHERE civ.ad_client_id = 1000006 AND hsv.hsv_kqthumua_ID = 1000016
			) AS t
		JOIN m_lot lo ON lo.name = t.lot
		WHERE lo.m_lot_id IS NOT NULL AND lo.dateto >= '9-1-2018' AND lo.dateto <= '10-30-2018'
		GROUP BY t.lot
		) AS t
	GROUP BY t.lot
	) AS k
GROUP BY k.c1
