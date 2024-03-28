--1--
SELECT '1.Thu mua gỗ tròn' AS a1, 'kg' AS a2, sum(a3) AS a3, sum(a4) AS a4, id
FROM (
	SELECT '1' AS id, sum(civ.qtyentered) AS a3, 0 AS a4
	FROM c_invoiceline civ
	JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
	JOIN m_product hh ON hh.m_product_id = civ.m_product_id AND hh.m_product_category_id IN (1000450) AND hh.M_AttributeSet_ID = 1000067
	WHERE civ.ad_client_id = 1000017 AND ci.dateacct >= '10-01-2018' AND ci.dateacct <= '12-31-2018' AND ci.issotrx = 'N'
	
	UNION ALL
	
	SELECT '1' AS id, 0 AS a3, sum(civ.qtyentered) AS a4
	FROM c_invoiceline civ
	JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
	JOIN m_product hh ON hh.m_product_id = civ.m_product_id AND hh.m_product_category_id IN (1000450) AND hh.M_AttributeSet_ID = 1000067
	WHERE civ.ad_client_id = 1000017 AND ci.dateacct >= '01-01-2018' AND ci.dateacct <= '12-31-2018' AND ci.issotrx = 'N'
	) AS t
GROUP BY t.id

UNION ALL

--2---    
SELECT '2.Gỗ tròn các lô đã bóc xong' AS a1, 'kg' AS a2, sum(a3) AS a3, sum(a4) AS a4, id
FROM (
	SELECT '2' AS id, sum(k.sl) AS a3, 0 AS a4
	FROM (
		SELECT hh.m_product_id, att.m_attributesetinstance_id, att.lot, sum(civ.qtyinvoiced) AS sl, sum(civ.linetotalamt) AS tt
		FROM c_invoiceline civ
		JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000450 AND hh.M_Product_ID <> 1013024
		JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.M_AttributeSet_ID = 1000067
		WHERE civ.ad_client_id = 1000017 AND ci.issotrx = 'N'
		GROUP BY att.m_attributesetinstance_id, hh.m_product_id
		) AS k
	JOIN m_lot lo ON lo.name = k.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
	
	
	
	
	UNION ALL
	
	SELECT '2' AS id, 0 AS a3, sum(k.sl) AS a4
	FROM (
		SELECT hh.m_product_id, att.m_attributesetinstance_id, att.lot, sum(civ.qtyinvoiced) AS sl, sum(civ.linetotalamt) AS tt
		FROM c_invoiceline civ
		JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000450  AND hh.M_Product_ID <> 1013024
		JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.M_AttributeSet_ID = 1000067
		WHERE civ.ad_client_id = 1000017 AND ci.issotrx = 'N'
		GROUP BY att.m_attributesetinstance_id, att.lot, hh.m_product_id
		) AS k
	JOIN m_lot lo ON lo.name = k.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
	) AS t
GROUP BY t.id

UNION ALL

--3---
SELECT '3.Sô lượng ván bóc hết lô thu được' AS a1, 'm3' AS a2, sum(a3) AS a3, sum(a4) AS a4, id
FROM (
	SELECT '3' AS id, sum(civ.productionqty) AS a3, 0 AS a4
	FROM m_productionplan civ
	JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000449 AND hh.M_Product_ID <> 1013024
	JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000067
	JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
	WHERE civ.ad_client_id = 1000017
	
	UNION ALL
	
	SELECT '3' AS id, 0 AS a3, sum(civ.productionqty) AS a4
	FROM m_productionplan civ
	JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000449 AND hh.M_Product_ID <> 1013024
	JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000067
	JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
	WHERE civ.ad_client_id = 1000017
	) AS t
GROUP BY t.id

UNION ALL

--3.1--
SELECT 'Trong đó : A  (2 850 000)' AS a1, '%' AS a2, sum(a3) AS a3, sum(a4) AS a4, id
FROM (
	SELECT '4' AS id, CASE WHEN sum(b2) <> 0 THEN round(sum(b1) / sum(b2) * 100, 2) ELSE 0 END AS a3, 0 AS a4
	FROM (
		SELECT sum(civ.productionqty) AS b1, 0 AS b2
		FROM m_productionplan civ
		JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL') AND civ.m_product_id = 1005237
		JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
		JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
		WHERE civ.ad_client_id = 1000017
		
		UNION ALL
		
		SELECT 0 AS b1, sum(civ.productionqty) AS b2
		FROM m_productionplan civ
		JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000449 AND hh.M_Product_ID <> 1013024
		JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000067
		JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
		WHERE civ.ad_client_id = 1000017
		) AS t
	
	UNION ALL
	
	SELECT '4' AS id, 0 AS a3, CASE WHEN sum(b2) <> 0 THEN round(sum(b1) / sum(b2) * 100, 2) ELSE 0 END AS a4
	FROM (
		SELECT sum(civ.qtyentered) AS b1, 0 AS b2
		FROM c_invoiceline civ
		JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL') AND 	civ.m_product_id = 1005237
		WHERE civ.ad_client_id = 1000017  AND ci.dateacct >= '01-01-2018' AND ci.dateacct <= '12-31-2018' AND ci.issotrx = 'N' 
		
		UNION ALL
		
		SELECT 0 AS b1, sum(civ.productionqty) AS a2
		FROM m_productionplan civ
		JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000449 AND hh.M_Product_ID <> 1013024
		JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000067
		JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
		WHERE civ.ad_client_id = 1000017
		) AS t
	) AS k
GROUP BY k.id

UNION ALL

--3.2---     
SELECT '                   B (2 050 000)' AS a1, '%' AS a2, sum(a3) AS a3, sum(a4) AS a4, id
FROM (
	SELECT '5' AS id, CASE WHEN sum(b2) <> 0 THEN round(sum(b1) / sum(b2) * 100, 2) ELSE 0 END AS a3, 0 AS a4
	FROM (
		SELECT sum(civ.productionqty) AS b1, 0 AS b2
		FROM m_productionplan civ
		JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')AND civ.m_product_id = 1008756
		JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
		JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
		WHERE civ.ad_client_id = 1000017
		
		UNION ALL
		
		SELECT 0 AS b1, sum(civ.productionqty) AS a2
		FROM m_productionplan civ
		JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000449 AND hh.M_Product_ID <> 1013024
		JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000067
		JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
		WHERE civ.ad_client_id = 1000017
		) AS t
	
	UNION ALL
	
	SELECT '5' AS id, 0 AS a3, CASE WHEN sum(b2) <> 0 THEN round(sum(b1) / sum(b2) * 100, 2) ELSE 0 END AS a4
	FROM (
		SELECT sum(civ.qtyentered) AS b1, 0 AS b2
		FROM c_invoiceline civ
		JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL') AND civ.M_Product_ID = 1008756
		WHERE civ.ad_client_id = 1000017 AND ci.dateacct >= '01-01-2018' AND ci.dateacct <= '12-31-2018' AND ci.issotrx = 'N'
		
		UNION ALL
		
		SELECT 0 AS b1, sum(civ.productionqty) AS a2
		FROM m_productionplan civ
		JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000449 AND hh.M_Product_ID <> 1013024
		JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000067
		JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
		WHERE civ.ad_client_id = 1000017
		) AS t
	) AS k
GROUP BY k.id

UNION ALL

--3.3--
SELECT '                   C (800 000)' AS a1, '%' AS a2, sum(a3) AS a3, sum(a4) AS a4, id
FROM (
	SELECT '6' AS id, CASE WHEN sum(b2) <> 0 THEN round(sum(b1) / sum(b2) * 100, 2) ELSE 0 END AS a3, 0 AS a4
	FROM (
		SELECT sum(civ.productionqty) AS b1, 0 AS b2
		FROM m_productionplan civ
		JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL') AND civ.m_product_id = 1008757
		JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
		JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
		WHERE civ.ad_client_id = 1000017
		
		UNION ALL
		
		SELECT 0 AS b1, sum(civ.productionqty) AS b2
		FROM m_productionplan civ
		JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000449 AND hh.M_Product_ID <> 1013024
		JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000067
		JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
		WHERE civ.ad_client_id = 1000017
		) AS t
	
	UNION ALL
	
	SELECT '6' AS id, 0 AS a3, CASE WHEN sum(b2) <> 0 THEN round(sum(b1) / sum(b2) * 100, 2) ELSE 0 END AS a4
	FROM (
		SELECT sum(civ.qtyentered) AS b1, 0 AS b2
		FROM c_invoiceline civ
		JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL') AND civ.M_Product_ID = 1008757 
		WHERE civ.ad_client_id = 1000017 AND ci.dateacct >= '01-01-2018' AND ci.dateacct <= '12-31-2018' AND ci.issotrx = 'N'
		
		UNION ALL
		
		SELECT 0 AS b1, sum(civ.productionqty) AS a2
		FROM m_productionplan civ
		JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000449 AND hh.M_Product_ID <> 1013024
		JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000067
		JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
		WHERE civ.ad_client_id = 1000017
		) AS t
	) AS k
GROUP BY k.id

UNION ALL
--4---
SELECT '4.Tỷ lệ thu hôi bóc (đã trừ gỗ hỏng)' AS a1, 'kg/m3' AS a2, round(sum(a3), 2) AS a3, sum(a4) AS a4, id
FROM (
--2/3-- phat sinh
    SELECT id, CASE WHEN sum(b2) <> 0 THEN sum(b2)/sum(b3) ELSE 0 END AS a3,0 AS a4
    FROM(
    --2--
        SELECT '7' AS id, sum(k.sl) AS b2, 0 AS b3
        FROM (
            SELECT hh.m_product_id, att.m_attributesetinstance_id, att.lot, sum(civ.qtyinvoiced) AS sl, sum(civ.linetotalamt) AS tt
            FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000450 AND hh.M_Product_ID <> 1013024
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.M_AttributeSet_ID = 1000067
            JOIN m_lot lo ON lo.name = att.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id = 1000017 AND ci.issotrx = 'N'
            GROUP BY att.m_attributesetinstance_id, hh.m_product_id
		) AS k
        --3---
        UNION ALL
        SELECT '7' AS id, 0 AS b2, sum(civ.productionqty) AS b3
        FROM m_productionplan civ
        JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
        JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000449 AND hh.M_Product_ID <> 1013024
        JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000067
        JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
        WHERE civ.ad_client_id = 1000017
    
    ) AS t GROUP BY t.id
    UNION ALL
    --2/3-- luy ke dau nam
    SELECT id, 0 AS a3, CASE WHEN sum(b2) <> 0 THEN sum(b2)/sum(b3) ELSE 0 END AS a4
    FROM(
    --2--
        SELECT '7' AS id, sum(k.sl) AS b2, 0 AS b3
        FROM (
            SELECT hh.m_product_id, att.m_attributesetinstance_id, att.lot, sum(civ.qtyinvoiced) AS sl, sum(civ.linetotalamt) AS tt
            FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000450  AND hh.M_Product_ID <> 1013024
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.M_AttributeSet_ID = 1000067
            JOIN m_lot lo ON lo.name = att.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id = 1000017 AND ci.issotrx = 'N'
            GROUP BY att.m_attributesetinstance_id, hh.m_product_id
		) AS k
        --3---
        UNION ALL
        SELECT '7' AS id, 0 AS b2, sum(civ.productionqty) AS b3
        FROM m_productionplan civ
        JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
        JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000449 AND hh.M_Product_ID <> 1013024
        JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000067
        JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
        WHERE civ.ad_client_id = 1000017
    
    ) AS t GROUP BY t.id
) AS k  GROUP BY k.id  

UNION ALL
--5--
SELECT '5.Giá mua NL BQ (trừ gỗ loại)' AS a1, 'đ/kg' AS a2 , sum(a3) AS a3, sum(a4) AS a4, id
FROM(

--tt/sl phat sinh-- 
    SELECT id,CASE WHEN sum(b3)<>0 THEN  sum(b4)/sum(b3) ELSE 0 END AS a3, 0 AS a4
    FROM(
-- sl--
        SELECT '8' AS id, sum(k.sl) AS b3, 0 AS b4
        FROM (
            SELECT hh.m_product_id, att.m_attributesetinstance_id, att.lot, sum(civ.qtyinvoiced) AS sl, sum(civ.linetotalamt) AS tt
            FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000450 AND hh.M_Product_ID <> 1013024
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.M_AttributeSet_ID = 1000067
            WHERE civ.ad_client_id = 1000017 AND ci.issotrx = 'N'
            GROUP BY att.m_attributesetinstance_id, hh.m_product_id
            ) AS k
        JOIN m_lot lo ON lo.name = k.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
	UNION ALL
--tt--
	SELECT '8' AS id,0 AS b3, sum(k.tt) AS b4
	FROM (
		SELECT hh.m_product_id, att.m_attributesetinstance_id, att.lot, sum(civ.qtyinvoiced) AS sl, sum(civ.linetotalamt) AS tt
		FROM c_invoiceline civ
		JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000450 AND hh.M_Product_ID <> 1013024
		JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.M_AttributeSet_ID = 1000067
		WHERE civ.ad_client_id = 1000017 AND ci.issotrx = 'N'
		GROUP BY att.m_attributesetinstance_id, hh.m_product_id
		) AS k
	JOIN m_lot lo ON lo.name = k.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
	) AS k GROUP BY k.id
	UNION ALL
--tt/sl luy ke tu dau-- 
    SELECT id,0 AS a3,CASE WHEN sum(b3)<>0 THEN  sum(b4)/sum(b3) ELSE 0 END AS a4
    FROM(
-- sl--
        SELECT '8' AS id, sum(k.sl) AS b3, 0 AS b4
        FROM (
            SELECT hh.m_product_id, att.m_attributesetinstance_id, att.lot, sum(civ.qtyinvoiced) AS sl, sum(civ.linetotalamt) AS tt
            FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000450 AND hh.M_Product_ID <> 1013024
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.M_AttributeSet_ID = 1000067
            WHERE civ.ad_client_id = 1000017 AND ci.issotrx = 'N'
            GROUP BY att.m_attributesetinstance_id, hh.m_product_id
            ) AS k
        JOIN m_lot lo ON lo.name = k.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
	UNION ALL
--tt--
	SELECT '8' AS id,0 AS b3, sum(k.tt) AS b4
	FROM (
		SELECT hh.m_product_id, att.m_attributesetinstance_id, att.lot, sum(civ.qtyinvoiced) AS sl, sum(civ.linetotalamt) AS tt
		FROM c_invoiceline civ
		JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
		JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000450 AND hh.M_Product_ID <> 1013024
		JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.M_AttributeSet_ID = 1000067
		WHERE civ.ad_client_id = 1000017 AND ci.issotrx = 'N'
		GROUP BY att.m_attributesetinstance_id, hh.m_product_id
		) AS k
	JOIN m_lot lo ON lo.name = k.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
	) AS k GROUP BY k.id
)AS t GROUP BY t.id
UNION ALL
--6--
SELECT '6.Thu từ khâu bóc (trừ gỗ loại), C L giá' AS a1, 'đ' AS a2 , sum(a3) AS a3, sum(a4)AS a4, id
FROM(

--6--(so lượng ván A  2 850 000 + sl ván B  2 050 000 +  Sl ván C * 800 000) – tt2-- phat sinh
    SELECT  id, (sum(b1)+sum(b2)+ sum(b3))- sum(b4)  AS a3, 0 AS a4
    FROM(
        -- so luong van A * 2.850.000--
        SELECT '9' AS id, sum(c1)*2850000 AS b1, 0 AS b2, 0 AS b3,0 AS b4
        FROM(
            SELECT sum(civ.productionqty) AS c1
            FROM m_productionplan civ
            JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1005237
            JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
            JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id = 1000017
        ) AS k
        UNION ALL
        -- so luong van B * 2.050.000--
        SELECT '9' AS id, 0 AS b1, sum(c2)*2050000 AS b2, 0 AS b3,0 AS b4
        FROM(
            SELECT sum(civ.productionqty) AS c2
            FROM m_productionplan civ
            JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1008756
            JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
            JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id = 1000017
        )AS k
        
        UNION ALL
        -- so luong van C * 800.000---
        SELECT '9' AS id, 0 AS b1, 0 AS b2, sum(c3)*800000 AS b3, 0 AS b4
        FROM(
            SELECT sum(civ.productionqty) AS c3
            FROM m_productionplan civ
            JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1008757
            JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
            JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id = 1000017
        ) AS k
        --tt2 --
        UNION ALL
        SELECT '9' AS id, 0 AS b1,0 AS b2,0 AS b3, sum(tt) AS b4
        FROM (
            SELECT hh.m_product_id, att.m_attributesetinstance_id, att.lot, sum(civ.qtyinvoiced) AS sl, sum(civ.linetotalamt) AS tt
            FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000450 AND hh.M_Product_ID <> 1013024
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.M_AttributeSet_ID = 1000067
            WHERE civ.ad_client_id = 1000017 AND ci.issotrx = 'N'
            GROUP BY att.m_attributesetinstance_id, hh.m_product_id
            ) AS k
        JOIN m_lot lo ON lo.name = k.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
        
    )AS k GROUP BY k.id    
    -- 
    UNION ALL
--9--(so lượng ván A  2 850 000 + sl ván B  2 050 000 +  Sl ván C * 800 000) – tt2-- luy ke tu dau
    
    SELECT  id, 0 AS a3, (sum(b1)+sum(b2)+ sum(b3))- sum(b4)  AS a4
    FROM(
        -- so luong van A * 2.850.000--
        SELECT '9' AS id, sum(c1)*2850000 AS b1, 0 AS b2, 0 AS b3,0 AS b4
        FROM(
            SELECT sum(civ.productionqty) AS c1
            FROM m_productionplan civ
            JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1005237
            JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
            JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id = 1000017
        ) AS k
        UNION ALL
        -- so luong van B * 2.050.000--
        SELECT '9' AS id, 0 AS b1, sum(c2)*2050000 AS b2, 0 AS b3,0 AS b4
        FROM(
            SELECT sum(civ.productionqty) AS c2
            FROM m_productionplan civ
            JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1008756
            JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
            JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id = 1000017
        )AS k
        
        UNION ALL
        -- so luong van C * 800.000---
        SELECT '9' AS id, 0 AS b1, 0 AS b2, sum(c3)*800000 AS b3, 0 AS b4
        FROM(
            SELECT sum(civ.productionqty) AS c3
            FROM m_productionplan civ
            JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1008757
            JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
            JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id = 1000017
        ) AS k
        --tt2 --
        UNION ALL
        SELECT '9' AS id, 0 AS b1,0 AS b2,0 AS b3, sum(tt) AS b4
        FROM (
            SELECT hh.m_product_id, att.m_attributesetinstance_id, att.lot, sum(civ.qtyinvoiced) AS sl, sum(civ.linetotalamt) AS tt
            FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000450 AND hh.M_Product_ID <> 1013024
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.M_AttributeSet_ID = 1000067
            WHERE civ.ad_client_id = 1000017 AND ci.issotrx = 'N'
            GROUP BY att.m_attributesetinstance_id, hh.m_product_id
            ) AS k
        JOIN m_lot lo ON lo.name = k.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
    )AS k GROUP BY k.id   
)AS t GROUP BY t.id
--7--
UNION ALL
SELECT '7.Thu lõi và gỗ hỏng không bóc' AS a1, 'đ' AS a2, sum(a3) AS a3,sum(a4) AS a4,id
FROM(
    SELECT '10' AS id, sum(civ.linenetamt) AS a3, 0 AS a4
    FROM c_invoiceline civ 
    JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL') AND  civ.M_Product_ID=1012371
    WHERE civ.ad_client_id = 1000017 AND ci.dateacct >= '10-01-2018' AND ci.dateacct <= '12-31-2018' AND ci.issotrx = 'Y'
        
    UNION ALL
        
    SELECT '10' AS id,0 AS a3, sum(civ.linenetamt) AS a4
    FROM c_invoiceline civ 
    JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL') AND  civ.M_Product_ID=1012371
    WHERE civ.ad_client_id = 1000017 AND ci.dateacct >= '01-01-2018' AND ci.dateacct <= '12-31-2018' AND ci.issotrx = 'Y'
)  AS t GROUP BY t.id
UNION ALL
--7.1--
SELECT '7.1 Trong đó  gổ hỏng khi mua trong lô mua' AS a1,'đ' AS a2, sum(a3) AS a3, sum(a4) AS a4,id
FROM (
    SELECT '11' AS id, sum(t.tt) AS a3,0 AS a4
    FROM(   
        SELECT civ.m_product_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
        FROM c_invoiceline civ 
        JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.m_product_id=1013024 
        JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id 
        JOIN m_lot lo ON lo.name = att.lot AND lo.dateto>='10-01-2018' AND lo.dateto<='12-31-2018'  AND lo.m_lot_id IS NOT NULL
        WHERE civ.ad_client_id=1000017 AND ci.issotrx ='N'
        GROUP BY  civ.m_product_id,att.lot
    ) AS t 
    UNION ALL
    
    SELECT '11' AS id, 0 AS a3, sum(t.tt) AS a4
    FROM(   
        SELECT civ.m_product_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
        FROM c_invoiceline civ 
        JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.m_product_id=1013024 
        JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id 
        JOIN m_lot lo ON lo.name = att.lot AND lo.dateto>='01-01-2018' AND lo.dateto<='12-31-2018'  AND lo.m_lot_id IS NOT NULL
        WHERE civ.ad_client_id=1000017 AND ci.issotrx ='N'
        GROUP BY  civ.m_product_id,att.lot
    ) AS t                 
) AS t GROUP BY t.id

UNION ALL
--8--
SELECT '8.Thu rác gỗ' AS a1,'đ' AS a2, sum(a3) AS a3, sum(a4) AS a4,id
FROM (
    SELECT '12' AS id, sum(t.tt) AS a3,0 AS a4
    FROM(   
        SELECT sum(civ.qtyinvoiced) AS sl, sum(civ.linenetamt) AS tt 
        FROM c_invoiceline civ
        JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.M_Product_ID=1012372  AND ci.issotrx ='Y'
        WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y' AND   ci.dateacct>='10-01-2018' AND ci.dateacct<='12-31-2018'
        GROUP BY civ.m_product_id 
    ) AS t    
    UNION ALL
    SELECT '12' AS id,0 AS a3, sum(t.tt) AS a4
    FROM(   
        SELECT sum(civ.qtyinvoiced) AS sl, sum(civ.linenetamt) AS tt 
        FROM c_invoiceline civ
        JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.M_Product_ID=1012372 AND ci.issotrx ='Y'
        WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y' AND   ci.dateacct>='01-01-2018' AND ci.dateacct<='12-31-2018'
        GROUP BY civ.m_product_id 
    ) AS t  
)AS t GROUP BY t.id
UNION ALL
--9--
SELECT '9.Thu bột chà' AS a1,'đ' AS a2, sum(a3) AS a3, sum(a4) AS a4,id
FROM (
    SELECT '13' AS id, sum(t.tt) AS a3,0 AS a4
    FROM(   
        SELECT sum(civ.qtyinvoiced) AS sl, sum(civ.linenetamt) AS tt 
        FROM c_invoiceline civ
        JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.M_Product_ID=1012373  AND ci.issotrx ='Y'
        WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y' AND   ci.dateacct>='10-01-2018' AND ci.dateacct<='12-31-2018'
        GROUP BY civ.m_product_id 
    ) AS t    
    UNION ALL
    SELECT '13' AS id,0 AS a3, sum(t.tt) AS a4
    FROM(   
        SELECT sum(civ.qtyinvoiced) AS sl, sum(civ.linenetamt) AS tt 
        FROM c_invoiceline civ
        JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.M_Product_ID=1012373 AND ci.issotrx ='Y'
        WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y' AND   ci.dateacct>='01-01-2018' AND ci.dateacct<='12-31-2018'
        GROUP BY civ.m_product_id 
    ) AS t  
)AS t GROUP BY t.id
UNION ALL
--10
SELECT '10.KQ thu từ bóc  (6+7-7.1+8+9)' AS  a1 ,'đ' AS a2, sum(a3) AS a3, sum(a4) AS a4, id
FROM(
SELECT id, sum(a6)+sum(a7)-sum("a7.1")+sum(a8)+sum(a9) AS a3,0 AS a4
FROM(
    SELECT '14' AS id, sum(a6) AS a6,0 AS a7, 0 AS "a7.1", 0  AS a8, 0 AS a9
    FROM(
        --6--(so lượng ván A  2 850 000 + sl ván B  2 050 000 +  Sl ván C * 800 000) – tt2-- phat sinh
        SELECT  id, (sum(b1)+sum(b2)+ sum(b3))- sum(b4)  AS a6, 0 AS a4
        FROM(
        -- so luong van A * 2.850.000--
            SELECT '6' AS id, sum(c1)*2850000 AS b1, 0 AS b2, 0 AS b3,0 AS b4
            FROM(
                SELECT sum(civ.productionqty) AS c1
                FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1005237
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
                WHERE civ.ad_client_id = 1000017
                ) AS k
            UNION ALL
        -- so luong van B * 2.050.000--
            SELECT '6' AS id, 0 AS b1, sum(c2)*2050000 AS b2, 0 AS b3,0 AS b4
            FROM(
                SELECT sum(civ.productionqty) AS c2
                FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1008756
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
                WHERE civ.ad_client_id = 1000017
            )AS k
        
            UNION ALL
        -- so luong van C * 800.000---
            SELECT '6' AS id, 0 AS b1, 0 AS b2, sum(c3)*800000 AS b3, 0 AS b4
            FROM(
                SELECT sum(civ.productionqty) AS c3
                FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1008757
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
                WHERE civ.ad_client_id = 1000017
            ) AS k
        --tt2 --
            UNION ALL
            SELECT '6' AS id, 0 AS b1,0 AS b2,0 AS b3, sum(tt) AS b4
            FROM (
                SELECT hh.m_product_id, att.m_attributesetinstance_id, att.lot, sum(civ.qtyinvoiced) AS sl, sum(civ.linetotalamt) AS tt
                FROM c_invoiceline civ
                JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000450 AND hh.M_Product_ID <> 1013024
                JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.M_AttributeSet_ID = 1000067
                WHERE civ.ad_client_id = 1000017 AND ci.issotrx = 'N'
                GROUP BY att.m_attributesetinstance_id, hh.m_product_id
                ) AS k
                JOIN m_lot lo ON lo.name = k.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
            )AS k GROUP BY k.id
        ) AS k 
        
        UNION ALL
        SELECT '14' AS id,0 AS a6,sum(a7) AS a7, 0 AS "a7.1", 0  AS a8, 0 AS a9
        FROM(
            SELECT '7' AS id, sum(civ.linenetamt) AS a7
            FROM c_invoiceline civ 
            JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL') AND  civ.M_Product_ID=1012371
            WHERE civ.ad_client_id = 1000017 AND ci.dateacct >= '10-01-2018' AND ci.dateacct <= '12-31-2018' AND ci.issotrx = 'Y'
        )AS k
        UNION ALL
        --7.1--
        SELECT '14' AS id,0 AS a6,0 AS a7, sum(tt) AS "a7.1", 0  AS a8, 0 AS a9  
        FROM(
            SELECT civ.m_product_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
            FROM c_invoiceline civ 
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.m_product_id=1013024 
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id 
            JOIN m_lot lo ON lo.name = att.lot AND lo.dateto>='10-01-2018' AND lo.dateto<='12-31-2018'  AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='N'
            GROUP BY  civ.m_product_id,att.lot
        )AS k
        UNION ALL
        SELECT '14' AS id,0 AS a6,0 AS a7, 0 AS "a7.1",sum(k.tt)  AS a8, 0 AS a9   
        FROM(   
            SELECT sum(civ.qtyinvoiced) AS sl, sum(civ.linenetamt) AS tt 
            FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.M_Product_ID=1012372  AND ci.issotrx ='Y'
            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y' AND   ci.dateacct>='10-01-2018' AND ci.dateacct<='12-31-2018'
            GROUP BY civ.m_product_id     
        )AS k
        UNION ALL
        
        SELECT '14' AS id,0 AS a6,0 AS a7, 0 AS "a7.1",0  AS a8, sum(k.tt) AS a9   
        FROM(   
            SELECT sum(civ.qtyinvoiced) AS sl, sum(civ.linenetamt) AS tt 
            FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.M_Product_ID=1012373  AND ci.issotrx ='Y'
            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y' AND   ci.dateacct>='10-01-2018' AND ci.dateacct<='12-31-2018'
            GROUP BY civ.m_product_id 
        ) AS k    
    ) AS t GROUP BY t.id
    UNION ALL
    
    
SELECT id,0 AS a3, sum(a6)+sum(a7)-sum("a7.1")+sum(a8)+sum(a9) AS a4
FROM(
    SELECT '14' AS id, sum(a6) AS a6,0 AS a7, 0 AS "a7.1", 0  AS a8, 0 AS a9
    FROM(
        --6--(so lượng ván A  2 850 000 + sl ván B  2 050 000 +  Sl ván C * 800 000) – tt2-- phat sinh
        SELECT  id, (sum(b1)+sum(b2)+ sum(b3))- sum(b4)  AS a6, 0 AS a4
        FROM(
        -- so luong van A * 2.850.000--
            SELECT '6' AS id, sum(c1)*2850000 AS b1, 0 AS b2, 0 AS b3,0 AS b4
            FROM(
                SELECT sum(civ.productionqty) AS c1
                FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1005237
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
                WHERE civ.ad_client_id = 1000017
                ) AS k
            UNION ALL
        -- so luong van B * 2.050.000--
            SELECT '6' AS id, 0 AS b1, sum(c2)*2050000 AS b2, 0 AS b3,0 AS b4
            FROM(
                SELECT sum(civ.productionqty) AS c2
                FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1008756
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
                WHERE civ.ad_client_id = 1000017
            )AS k
        
            UNION ALL
        -- so luong van C * 800.000---
            SELECT '6' AS id, 0 AS b1, 0 AS b2, sum(c3)*800000 AS b3, 0 AS b4
            FROM(
                SELECT sum(civ.productionqty) AS c3
                FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1008757
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
                WHERE civ.ad_client_id = 1000017
            ) AS k
        --tt2 --
            UNION ALL
            SELECT '6' AS id, 0 AS b1,0 AS b2,0 AS b3, sum(tt) AS b4
            FROM (
                SELECT hh.m_product_id, att.m_attributesetinstance_id, att.lot, sum(civ.qtyinvoiced) AS sl, sum(civ.linetotalamt) AS tt
                FROM c_invoiceline civ
                JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000450 AND hh.M_Product_ID <> 1013024
                JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.M_AttributeSet_ID = 1000067
                WHERE civ.ad_client_id = 1000017 AND ci.issotrx = 'N'
                GROUP BY att.m_attributesetinstance_id, hh.m_product_id
                ) AS k
                JOIN m_lot lo ON lo.name = k.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
            )AS k GROUP BY k.id
        ) AS k 
        
        UNION ALL
        SELECT '14' AS id,0 AS a6,sum(a7) AS a7, 0 AS "a7.1", 0  AS a8, 0 AS a9
        FROM(
            SELECT '7' AS id, sum(civ.linenetamt) AS a7
            FROM c_invoiceline civ 
            JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL') AND  civ.M_Product_ID=1012371
            WHERE civ.ad_client_id = 1000017 AND ci.dateacct >= '01-01-2018' AND ci.dateacct <= '12-31-2018' AND ci.issotrx = 'Y'
        )AS k
        UNION ALL
        --7.1--
        SELECT '14' AS id,0 AS a6,0 AS a7, sum(tt) AS "a7.1", 0  AS a8, 0 AS a9  
        FROM(
            SELECT civ.m_product_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
            FROM c_invoiceline civ 
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.m_product_id=1013024 
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id 
            JOIN m_lot lo ON lo.name = att.lot AND lo.dateto>='01-01-2018' AND lo.dateto<='12-31-2018'  AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='N'
            GROUP BY  civ.m_product_id,att.lot
        )AS k
        UNION ALL
        SELECT '14' AS id,0 AS a6,0 AS a7, 0 AS "a7.1",sum(k.tt)  AS a8, 0 AS a9   
        FROM(   
            SELECT sum(civ.qtyinvoiced) AS sl, sum(civ.linenetamt) AS tt 
            FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.M_Product_ID=1012372  AND ci.issotrx ='Y'
            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y' AND   ci.dateacct>='01-01-2018' AND ci.dateacct<='12-31-2018'
            GROUP BY civ.m_product_id     
        )AS k
        UNION ALL
        
        SELECT '14' AS id,0 AS a6,0 AS a7, 0 AS "a7.1",0  AS a8, sum(k.tt) AS a9   
        FROM(   
            SELECT sum(civ.qtyinvoiced) AS sl, sum(civ.linenetamt) AS tt 
            FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.M_Product_ID=1012373  AND ci.issotrx ='Y'
            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y' AND   ci.dateacct>='01-01-2018' AND ci.dateacct<='12-31-2018'
            GROUP BY civ.m_product_id 
        ) AS k    
    ) AS t GROUP BY t.id
)AS t GROUP BY t.id

UNION ALL

SELECT '11.Kết quả /m3 bóc' AS  a1 ,'đ/m3 ván bóc' AS a2, sum(a3) AS a3, sum(a4) AS a4, id
FROM(
SELECT id, case when sum(a10)<>0 then (sum(a6)+sum(a7)-sum("a7.1")+sum(a8)+sum(a9))/sum(a10) else 0 end AS a3,0 AS a4
FROM(
    SELECT '15' AS id, sum(a6) AS a6,0 AS a7, 0 AS "a7.1", 0  AS a8, 0 AS a9, 0 as a10
    FROM(
        --6--(so lượng ván A  2 850 000 + sl ván B  2 050 000 +  Sl ván C * 800 000) – tt2-- phat sinh
        SELECT  id, (sum(b1)+sum(b2)+ sum(b3))- sum(b4)  AS a6, 0 AS a4
        FROM(
        -- so luong van A * 2.850.000--
            SELECT '6' AS id, sum(c1)*2850000 AS b1, 0 AS b2, 0 AS b3,0 AS b4
            FROM(
                SELECT sum(civ.productionqty) AS c1
                FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1005237
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
                WHERE civ.ad_client_id = 1000017
                ) AS k
            UNION ALL
        -- so luong van B * 2.050.000--
            SELECT '6' AS id, 0 AS b1, sum(c2)*2050000 AS b2, 0 AS b3,0 AS b4
            FROM(
                SELECT sum(civ.productionqty) AS c2
                FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1008756
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
                WHERE civ.ad_client_id = 1000017
            )AS k
        
            UNION ALL
        -- so luong van C * 800.000---
            SELECT '6' AS id, 0 AS b1, 0 AS b2, sum(c3)*800000 AS b3, 0 AS b4
            FROM(
                SELECT sum(civ.productionqty) AS c3
                FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1008757
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
                WHERE civ.ad_client_id = 1000017
            ) AS k
        --tt2 --
            UNION ALL
            SELECT '6' AS id, 0 AS b1,0 AS b2,0 AS b3, sum(tt) AS b4
            FROM (
                SELECT hh.m_product_id, att.m_attributesetinstance_id, att.lot, sum(civ.qtyinvoiced) AS sl, sum(civ.linetotalamt) AS tt
                FROM c_invoiceline civ
                JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000450 AND hh.M_Product_ID <> 1013024
                JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.M_AttributeSet_ID = 1000067
                WHERE civ.ad_client_id = 1000017 AND ci.issotrx = 'N'
                GROUP BY att.m_attributesetinstance_id, hh.m_product_id
                ) AS k
                JOIN m_lot lo ON lo.name = k.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
            )AS k GROUP BY k.id
        ) AS k 
        
        UNION ALL
        SELECT '15' AS id,0 AS a6,sum(a7) AS a7, 0 AS "a7.1", 0  AS a8, 0 AS a9, 0 as a10
        FROM(
            SELECT '7' AS id, sum(civ.linenetamt) AS a7
            FROM c_invoiceline civ 
            JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL') AND  civ.M_Product_ID=1012371
            WHERE civ.ad_client_id = 1000017 AND ci.dateacct >= '10-01-2018' AND ci.dateacct <= '12-31-2018' AND ci.issotrx = 'Y'
        )AS k
        UNION ALL
        --7.1--
        SELECT '15' AS id,0 AS a6,0 AS a7, sum(tt) AS "a7.1", 0  AS a8, 0 AS a9, 0 as a10  
        FROM(
            SELECT civ.m_product_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
            FROM c_invoiceline civ 
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.m_product_id=1013024 
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id 
            JOIN m_lot lo ON lo.name = att.lot AND lo.dateto>='10-01-2018' AND lo.dateto<='12-31-2018'  AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='N'
            GROUP BY  civ.m_product_id,att.lot
        )AS k
        UNION ALL
        SELECT '15' AS id,0 AS a6,0 AS a7, 0 AS "a7.1",sum(k.tt)  AS a8, 0 AS a9, 0 as a10   
        FROM(   
            SELECT sum(civ.qtyinvoiced) AS sl, sum(civ.linenetamt) AS tt 
            FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.M_Product_ID=1012372  AND ci.issotrx ='Y'
            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y' AND   ci.dateacct>='10-01-2018' AND ci.dateacct<='12-31-2018'
            GROUP BY civ.m_product_id     
        )AS k
        UNION ALL
        
        SELECT '15' AS id,0 AS a6,0 AS a7, 0 AS "a7.1",0  AS a8, sum(k.tt) AS a9, 0 as a10   
        FROM(   
            SELECT sum(civ.qtyinvoiced) AS sl, sum(civ.linenetamt) AS tt 
            FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.M_Product_ID=1012373  AND ci.issotrx ='Y'
            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y' AND   ci.dateacct>='10-01-2018' AND ci.dateacct<='12-31-2018'
            GROUP BY civ.m_product_id 
        ) AS k   
        
        UNION ALL
        SELECT '15' AS id,0 AS a6,0 AS a7, 0 AS "a7.1",0  AS a8, 0 AS a9, sum(b3) as a10    
        FROM(
            SELECT sum(civ.productionqty) AS b3
            FROM m_productionplan civ
            JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000449 AND hh.M_Product_ID <> 1013024
            JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000067
            JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id = 1000017
        )as k     
    ) AS t GROUP BY t.id
    UNION ALL
    
SELECT id, 0 as a3, case when sum(a10)<>0 then (sum(a6)+sum(a7)-sum("a7.1")+sum(a8)+sum(a9))/sum(a10) else 0 end AS a4
FROM(
    SELECT '15' AS id, sum(a6) AS a6,0 AS a7, 0 AS "a7.1", 0  AS a8, 0 AS a9, 0 as a10
    FROM(
        --6--(so lượng ván A  2 850 000 + sl ván B  2 050 000 +  Sl ván C * 800 000) – tt2-- phat sinh
        SELECT  id, (sum(b1)+sum(b2)+ sum(b3))- sum(b4)  AS a6, 0 AS a4
        FROM(
        -- so luong van A * 2.850.000--
            SELECT '6' AS id, sum(c1)*2850000 AS b1, 0 AS b2, 0 AS b3,0 AS b4
            FROM(
                SELECT sum(civ.productionqty) AS c1
                FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1005237
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
                WHERE civ.ad_client_id = 1000017
                ) AS k
            UNION ALL
        -- so luong van B * 2.050.000--
            SELECT '6' AS id, 0 AS b1, sum(c2)*2050000 AS b2, 0 AS b3,0 AS b4
            FROM(
                SELECT sum(civ.productionqty) AS c2
                FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1008756
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
                WHERE civ.ad_client_id = 1000017
            )AS k
        
            UNION ALL
        -- so luong van C * 800.000---
            SELECT '6' AS id, 0 AS b1, 0 AS b2, sum(c3)*800000 AS b3, 0 AS b4
            FROM(
                SELECT sum(civ.productionqty) AS c3
                FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1008757
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
                WHERE civ.ad_client_id = 1000017
            ) AS k
        --tt2 --
            UNION ALL
            SELECT '6' AS id, 0 AS b1,0 AS b2,0 AS b3, sum(tt) AS b4
            FROM (
                SELECT hh.m_product_id, att.m_attributesetinstance_id, att.lot, sum(civ.qtyinvoiced) AS sl, sum(civ.linetotalamt) AS tt
                FROM c_invoiceline civ
                JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000450 AND hh.M_Product_ID <> 1013024
                JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.M_AttributeSet_ID = 1000067
                WHERE civ.ad_client_id = 1000017 AND ci.issotrx = 'N'
                GROUP BY att.m_attributesetinstance_id, hh.m_product_id
                ) AS k
                JOIN m_lot lo ON lo.name = k.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
            )AS k GROUP BY k.id
        ) AS k 
        
        UNION ALL
        SELECT '15' AS id,0 AS a6,sum(a7) AS a7, 0 AS "a7.1", 0  AS a8, 0 AS a9, 0 as a10
        FROM(
            SELECT '7' AS id, sum(civ.linenetamt) AS a7
            FROM c_invoiceline civ 
            JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL') AND  civ.M_Product_ID=1012371
            WHERE civ.ad_client_id = 1000017 AND ci.dateacct >= '01-01-2018' AND ci.dateacct <= '12-31-2018' AND ci.issotrx = 'Y'
        )AS k
        UNION ALL
        --7.1--
        SELECT '15' AS id,0 AS a6,0 AS a7, sum(tt) AS "a7.1", 0  AS a8, 0 AS a9, 0 as a10  
        FROM(
            SELECT civ.m_product_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
            FROM c_invoiceline civ 
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.m_product_id=1013024 
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id 
            JOIN m_lot lo ON lo.name = att.lot AND lo.dateto>='01-01-2018' AND lo.dateto<='12-31-2018'  AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='N'
            GROUP BY  civ.m_product_id,att.lot
        )AS k
        UNION ALL
        SELECT '15' AS id,0 AS a6,0 AS a7, 0 AS "a7.1",sum(k.tt)  AS a8, 0 AS a9, 0 as a10   
        FROM(   
            SELECT sum(civ.qtyinvoiced) AS sl, sum(civ.linenetamt) AS tt 
            FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.M_Product_ID=1012372  AND ci.issotrx ='Y'
            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y' AND   ci.dateacct>='01-01-2018' AND ci.dateacct<='12-31-2018'
            GROUP BY civ.m_product_id     
        )AS k
        UNION ALL
        
        SELECT '15' AS id,0 AS a6,0 AS a7, 0 AS "a7.1",0  AS a8, sum(k.tt) AS a9, 0 as a10   
        FROM(   
            SELECT sum(civ.qtyinvoiced) AS sl, sum(civ.linenetamt) AS tt 
            FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.M_Product_ID=1012373  AND ci.issotrx ='Y'
            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y' AND   ci.dateacct>='01-01-2018' AND ci.dateacct<='12-31-2018'
            GROUP BY civ.m_product_id 
        ) AS k   
        
        UNION ALL
        SELECT '15' AS id,0 AS a6,0 AS a7, 0 AS "a7.1",0  AS a8, 0 AS a9, sum(b3) as a10    
        FROM(
            SELECT sum(civ.productionqty) AS b3
            FROM m_productionplan civ
            JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000449 AND hh.M_Product_ID <> 1013024
            JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000067
            JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id = 1000017
        )as k     
    ) AS t GROUP BY t.id
)as t group by t.id
UNION ALL

SELECT '12. kết quả trên m3 vấn ép (hệ số 1,15)' AS  a1 ,'đ/ván ép' AS a2, sum(a3) AS a3, sum(a4) AS a4, id
FROM(
SELECT id, case when sum(a10)<>0 then (1.15*(sum(a6)+sum(a7)-sum("a7.1")+sum(a8)+sum(a9)))/sum(a10) else 0 end AS a3,0 AS a4
FROM(
    SELECT '16' AS id, sum(a6) AS a6,0 AS a7, 0 AS "a7.1", 0  AS a8, 0 AS a9, 0 as a10
    FROM(
        --6--(so lượng ván A  2 850 000 + sl ván B  2 050 000 +  Sl ván C * 800 000) – tt2-- phat sinh
        SELECT  id, (sum(b1)+sum(b2)+ sum(b3))- sum(b4)  AS a6, 0 AS a4
        FROM(
        -- so luong van A * 2.850.000--
            SELECT '6' AS id, sum(c1)*2850000 AS b1, 0 AS b2, 0 AS b3,0 AS b4
            FROM(
                SELECT sum(civ.productionqty) AS c1
                FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1005237
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
                WHERE civ.ad_client_id = 1000017
                ) AS k
            UNION ALL
        -- so luong van B * 2.050.000--
            SELECT '6' AS id, 0 AS b1, sum(c2)*2050000 AS b2, 0 AS b3,0 AS b4
            FROM(
                SELECT sum(civ.productionqty) AS c2
                FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1008756
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
                WHERE civ.ad_client_id = 1000017
            )AS k
        
            UNION ALL
        -- so luong van C * 800.000---
            SELECT '6' AS id, 0 AS b1, 0 AS b2, sum(c3)*800000 AS b3, 0 AS b4
            FROM(
                SELECT sum(civ.productionqty) AS c3
                FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1008757
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
                WHERE civ.ad_client_id = 1000017
            ) AS k
        --tt2 --
            UNION ALL
            SELECT '6' AS id, 0 AS b1,0 AS b2,0 AS b3, sum(tt) AS b4
            FROM (
                SELECT hh.m_product_id, att.m_attributesetinstance_id, att.lot, sum(civ.qtyinvoiced) AS sl, sum(civ.linetotalamt) AS tt
                FROM c_invoiceline civ
                JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000450 AND hh.M_Product_ID <> 1013024
                JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.M_AttributeSet_ID = 1000067
                WHERE civ.ad_client_id = 1000017 AND ci.issotrx = 'N'
                GROUP BY att.m_attributesetinstance_id, hh.m_product_id
                ) AS k
                JOIN m_lot lo ON lo.name = k.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
            )AS k GROUP BY k.id
        ) AS k 
        
        UNION ALL
        SELECT '16' AS id,0 AS a6,sum(a7) AS a7, 0 AS "a7.1", 0  AS a8, 0 AS a9, 0 as a10
        FROM(
            SELECT '7' AS id, sum(civ.linenetamt) AS a7
            FROM c_invoiceline civ 
            JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL') AND  civ.M_Product_ID=1012371
            WHERE civ.ad_client_id = 1000017 AND ci.dateacct >= '10-01-2018' AND ci.dateacct <= '12-31-2018' AND ci.issotrx = 'Y'
        )AS k
        UNION ALL
        --7.1--
        SELECT '16' AS id,0 AS a6,0 AS a7, sum(tt) AS "a7.1", 0  AS a8, 0 AS a9, 0 as a10  
        FROM(
            SELECT civ.m_product_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
            FROM c_invoiceline civ 
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.m_product_id=1013024 
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id 
            JOIN m_lot lo ON lo.name = att.lot AND lo.dateto>='10-01-2018' AND lo.dateto<='12-31-2018'  AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='N'
            GROUP BY  civ.m_product_id,att.lot
        )AS k
        UNION ALL
        SELECT '16' AS id,0 AS a6,0 AS a7, 0 AS "a7.1",sum(k.tt)  AS a8, 0 AS a9, 0 as a10   
        FROM(   
            SELECT sum(civ.qtyinvoiced) AS sl, sum(civ.linenetamt) AS tt 
            FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.M_Product_ID=1012372  AND ci.issotrx ='Y'
            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y' AND   ci.dateacct>='10-01-2018' AND ci.dateacct<='12-31-2018'
            GROUP BY civ.m_product_id     
        )AS k
        UNION ALL
        
        SELECT '16' AS id,0 AS a6,0 AS a7, 0 AS "a7.1",0  AS a8, sum(k.tt) AS a9, 0 as a10   
        FROM(   
            SELECT sum(civ.qtyinvoiced) AS sl, sum(civ.linenetamt) AS tt 
            FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.M_Product_ID=1012373  AND ci.issotrx ='Y'
            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y' AND   ci.dateacct>='10-01-2018' AND ci.dateacct<='12-31-2018'
            GROUP BY civ.m_product_id 
        ) AS k   
        
        UNION ALL
        SELECT '16' AS id,0 AS a6,0 AS a7, 0 AS "a7.1",0  AS a8, 0 AS a9, sum(b3) as a10    
        FROM(
            SELECT sum(civ.productionqty) AS b3
            FROM m_productionplan civ
            JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000449 AND hh.M_Product_ID <> 1013024
            JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000067
            JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '10-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id = 1000017
        )as k     
    ) AS t GROUP BY t.id
    UNION ALL
    
SELECT id, 0 as a3, case when sum(a10)<>0 then (1.15*(sum(a6)+sum(a7)-sum("a7.1")+sum(a8)+sum(a9)))/sum(a10) else 0 end AS a4
FROM(
    SELECT '16' AS id, sum(a6) AS a6,0 AS a7, 0 AS "a7.1", 0  AS a8, 0 AS a9, 0 as a10
    FROM(
        --6--(so lượng ván A  2 850 000 + sl ván B  2 050 000 +  Sl ván C * 800 000) – tt2-- phat sinh
        SELECT  id, (sum(b1)+sum(b2)+ sum(b3))- sum(b4)  AS a6, 0 AS a4
        FROM(
        -- so luong van A * 2.850.000--
            SELECT '6' AS id, sum(c1)*2850000 AS b1, 0 AS b2, 0 AS b3,0 AS b4
            FROM(
                SELECT sum(civ.productionqty) AS c1
                FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1005237
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
                WHERE civ.ad_client_id = 1000017
                ) AS k
            UNION ALL
        -- so luong van B * 2.050.000--
            SELECT '6' AS id, 0 AS b1, sum(c2)*2050000 AS b2, 0 AS b3,0 AS b4
            FROM(
                SELECT sum(civ.productionqty) AS c2
                FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1008756
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
                WHERE civ.ad_client_id = 1000017
            )AS k
        
            UNION ALL
        -- so luong van C * 800.000---
            SELECT '6' AS id, 0 AS b1, 0 AS b2, sum(c3)*800000 AS b3, 0 AS b4
            FROM(
                SELECT sum(civ.productionqty) AS c3
                FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.m_product_id = 1008757
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
                WHERE civ.ad_client_id = 1000017
            ) AS k
        --tt2 --
            UNION ALL
            SELECT '6' AS id, 0 AS b1,0 AS b2,0 AS b3, sum(tt) AS b4
            FROM (
                SELECT hh.m_product_id, att.m_attributesetinstance_id, att.lot, sum(civ.qtyinvoiced) AS sl, sum(civ.linetotalamt) AS tt
                FROM c_invoiceline civ
                JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL')
                JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000450 AND hh.M_Product_ID <> 1013024
                JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.M_AttributeSet_ID = 1000067
                WHERE civ.ad_client_id = 1000017 AND ci.issotrx = 'N'
                GROUP BY att.m_attributesetinstance_id, hh.m_product_id
                ) AS k
                JOIN m_lot lo ON lo.name = k.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
            )AS k GROUP BY k.id
        ) AS k 
        
        UNION ALL
        SELECT '16' AS id,0 AS a6,sum(a7) AS a7, 0 AS "a7.1", 0  AS a8, 0 AS a9, 0 as a10
        FROM(
            SELECT '7' AS id, sum(civ.linenetamt) AS a7
            FROM c_invoiceline civ 
            JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id AND ci.docstatus IN ('CO', 'CL') AND  civ.M_Product_ID=1012371
            WHERE civ.ad_client_id = 1000017 AND ci.dateacct >= '01-01-2018' AND ci.dateacct <= '12-31-2018' AND ci.issotrx = 'Y'
        )AS k
        UNION ALL
        --7.1--
        SELECT '16' AS id,0 AS a6,0 AS a7, sum(tt) AS "a7.1", 0  AS a8, 0 AS a9, 0 as a10  
        FROM(
            SELECT civ.m_product_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
            FROM c_invoiceline civ 
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.m_product_id=1013024 
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id 
            JOIN m_lot lo ON lo.name = att.lot AND lo.dateto>='01-01-2018' AND lo.dateto<='12-31-2018'  AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='N'
            GROUP BY  civ.m_product_id,att.lot
        )AS k
        UNION ALL
        SELECT '16' AS id,0 AS a6,0 AS a7, 0 AS "a7.1",sum(k.tt)  AS a8, 0 AS a9, 0 as a10   
        FROM(   
            SELECT sum(civ.qtyinvoiced) AS sl, sum(civ.linenetamt) AS tt 
            FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.M_Product_ID=1012372  AND ci.issotrx ='Y'
            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y' AND   ci.dateacct>='01-01-2018' AND ci.dateacct<='12-31-2018'
            GROUP BY civ.m_product_id     
        )AS k
        UNION ALL
        
        SELECT '16' AS id,0 AS a6,0 AS a7, 0 AS "a7.1",0  AS a8, sum(k.tt) AS a9, 0 as a10   
        FROM(   
            SELECT sum(civ.qtyinvoiced) AS sl, sum(civ.linenetamt) AS tt 
            FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL') AND civ.M_Product_ID=1012373  AND ci.issotrx ='Y'
            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y' AND   ci.dateacct>='01-01-2018' AND ci.dateacct<='12-31-2018'
            GROUP BY civ.m_product_id 
        ) AS k   
        
        UNION ALL
        SELECT '16' AS id,0 AS a6,0 AS a7, 0 AS "a7.1",0  AS a8, 0 AS a9, sum(b3) as a10    
        FROM(
            SELECT sum(civ.productionqty) AS b3
            FROM m_productionplan civ
            JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO', 'CL')
            JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID = 1000449 AND hh.M_Product_ID <> 1013024
            JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id = tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID = 1000067
            JOIN m_lot lo ON lo.name = tt.lot AND lo.dateto >= '01-01-2018' AND lo.dateto <= '12-31-2018' AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id = 1000017
        )as k     
    ) AS t GROUP BY t.id
)as t group by t.id

