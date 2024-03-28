SELECT sum(sl1) AS sl1,sum(dg1) AS dg1, sum(tt1) AS tt1 ,sum(tt1) + sum(tt2) - sum(tt3) AS kq, sum(tienmua) AS tienmua, sum(tiendau) AS tiendau, sum(tienda) AS tienda
FROM (
	SELECT tt AS tt1,CASE WHEN sl<>0 THEN tt/sl ELSE 0 END AS dg1,sl AS sl1, 0 AS tt2, 0 AS tt3, 0 AS tienmua, 0 AS tiendau, 0 AS tienda
	FROM (
		SELECT sum(civ.qtyinvoiced) AS sl, sum(linenetamt) AS tt
		FROM c_invoiceline civ
		JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id
		JOIN m_product hh ON hh.m_product_id = civ.m_product_id
		JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.lot IS NOT NULL
		JOIN m_lot lo ON lo.name = att.lot AND ci.dateacct >= '01-01-2019' AND ci.dateacct <= '07-01-2019' AND (lo.M_Lot_ID = 1002387 OR 1002387 IS NULL)
		WHERE ci.ad_client_id = 1000023 AND ci.docstatus IN ('CO', 'CL') AND ci.issotrx = 'Y'
		) AS k
	
	UNION ALL
	
	SELECT 0 AS tt1,0 AS dg1, 0 AS tt1, sl * dg AS tt2, 0 AS tt3, 0 AS tienmua, 0 AS tiendau, 0 AS tienda
	FROM (
		SELECT lo.name AS lo, hh.name AS noidung, attv.name AS thuoctinh, sum(civ.productionqty) AS sl, attv.hsv_dinhmuc AS dg
		FROM m_productionplan civ
		JOIN m_production ci ON ci.m_production_id = civ.m_production_id AND ci.docstatus IN ('CO', 'CL')
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id
		JOIN m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		JOIN m_attributevalue attv ON tt.m_attribute_id = attv.m_attribute_id AND tt.m_attributevalue_id = attv.m_attributevalue_id
		JOIN m_lot lo ON lo.m_lot_id = civ.m_lot_id
		WHERE civ.ad_client_id = 1000023 AND (civ.M_Lot_ID = 1002387 OR 1002387 IS NULL) AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-01-2019'
		GROUP BY lo.name, hh.name, attv.name, attv.hsv_dinhmuc
		) AS k
	
	UNION ALL
	
	SELECT 0 AS tt1,0 AS dg1, 0 AS tt1, 0 AS tt2, tienmua + tiendau + tienda AS tt3, tienmua, tiendau, tienda
	FROM (
		SELECT sum(CASE WHEN ci.issotrx = 'N' THEN civ.linenetamt ELSE 0 END) AS tienmua, lo.hsv_dinhmuc AS tiendau, lo.hsv_dinhmuc1 AS tienda
		FROM c_invoiceline civ
		JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
		JOIN m_product hh ON hh.m_product_id = civ.m_product_id
		JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.lot IS NOT NULL
		JOIN m_lot lo ON lo.name = att.lot AND ci.dateacct >= '01-01-2019' AND ci.dateacct <= '07-01-2019' AND (lo.M_Lot_ID = 1002387 OR 1002387 IS NULL)
		WHERE civ.ad_client_id = 1000023
		GROUP BY hsv_dinhmuc,hsv_dinhmuc1
		) AS k
	) AS k
