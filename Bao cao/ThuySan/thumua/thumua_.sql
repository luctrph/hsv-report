SELECT '1.Thu mua gỗ tròn' AS a1,'kg' AS a2,sum(a3) AS a3,sum(a4) AS a4,id 
FROM (
    SELECT '1' AS id,sum(cil.qtyentered) AS a3 ,0 AS a4
    FROM c_invoiceline cil
        JOIN c_invoice ci ON ci.c_invoice_id=cil.c_invoice_id AND ci.docstatus IN ('CO','CL')
        JOIN m_product hh ON hh.m_product_id=cil.m_product_id AND hh.m_product_category_id  IN (1000450) AND hh.M_AttributeSet_ID=1000067
    WHERE cil.ad_client_id = 1000017 AND ci.dateacct>=$P{StartDate} AND ci.dateacct<=$P{EndDate}  AND ci.issotrx ='N'
    UNION ALL
    
    SELECT '1' AS id,0 AS a3, sum(cil.qtyentered) AS a4 
    FROM c_invoiceline cil
        JOIN c_invoice ci ON ci.c_invoice_id=cil.c_invoice_id AND ci.docstatus IN ('CO','CL')
        JOIN m_product hh ON hh.m_product_id=cil.m_product_id AND hh.m_product_category_id  IN (1000450) AND hh.M_AttributeSet_ID=1000067
    WHERE cil.ad_client_id = 1000017 AND ci.dateacct>=$P{DateFrom} AND ci.dateacct<=$P{EndDate}  AND ci.issotrx ='N'
)  AS t GROUP BY t.id
    
UNION ALL
    
SELECT '2.Gỗ tròn các lô đã bóc xong' AS a1,'kg' AS a2, sum(a3) AS a3, sum(a4) AS a4, id
FROM(
    SELECT '2' AS id,sum(k.sl)AS a3, 0 AS a4  
    FROM (
        SELECT hh.m_product_id,att.m_attributesetinstance_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
        FROM c_invoiceline civ 
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL')
            JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_Category_ID=1000450
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id AND att.M_AttributeSet_ID=1000067
        WHERE civ.ad_client_id=1000017 AND ci.issotrx ='N'
        GROUP BY att.m_attributesetinstance_id, hh.m_product_id
    ) AS k
    JOIN  m_lot lo ON lo.name=k.lot AND  lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate} AND lo.m_lot_id IS NOT NULL           
    
    UNION ALL
    
    SELECT '2' AS id,0 AS a3,sum(k.sl) AS a4  
    FROM (
        SELECT hh.m_product_id,att.m_attributesetinstance_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
        FROM c_invoiceline civ 
            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL')
            JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_Category_ID=1000450
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id  AND att.M_AttributeSet_ID=1000067
        WHERE civ.ad_client_id=1000017 AND ci.issotrx ='N'
        GROUP BY att.m_attributesetinstance_id,att.lot, hh.m_product_id
    ) AS k
    JOIN  m_lot lo ON lo.name=k.lot AND  lo.dateto>=$P{DateFrom} AND lo.dateto<=$P{EndDate}  AND lo.m_lot_id IS NOT NULL 
)AS t GROUP BY t.id
UNION ALL

SELECT '3.Sô lượng ván bóc hết lô thu được' AS a1,'m3' AS a2,sum (a3) AS a3, sum (a4) AS a4,id  
FROM (
    SELECT '3' AS id, sum(civ.productionqty) AS a3,0 AS a4
    FROM m_productionplan civ
        JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
        JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_Category_ID=1000449
        JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID=1000067
        JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}AND lo.m_lot_id IS NOT NULL
    WHERE civ.ad_client_id=1000017            
    
    UNION ALL
            
    SELECT '3' AS id, 0 AS a3,sum(civ.productionqty) AS a4
    FROM m_productionplan civ
        JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
        JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_Category_ID=1000449
        JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID=1000067
        JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{DateFrom} AND lo.dateto<=$P{EndDate}AND lo.m_lot_id IS NOT NULL
    WHERE civ.ad_client_id=1000017
)AS t GROUP BY t.id

UNION ALL

SELECT  'Trong đó : A  (2 850 000)' AS a1,'%' AS a2, sum(a3)  AS a3, sum (a4) AS a4,id
FROM(
    SELECT '4' AS id, CASE WHEN sum(b2)<>0 THEN  round(sum(b1)/sum(b2) * 100,2) ELSE 0 END  AS a3, 0 AS a4 --SL van A
    FROM( 
        SELECT  sum(civ.productionqty) AS b1,0 AS b2
        FROM m_productionplan civ
            JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
            JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.m_product_id=1005237
            JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id
            JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}  AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id=1000017
    UNION ALL    
    SELECT 0 AS b1, sum(civ.productionqty) AS b2
    FROM m_productionplan civ
        JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
        JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_Category_ID=1000449
        JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID=1000067
        JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}AND lo.m_lot_id IS NOT NULL
    WHERE civ.ad_client_id=1000017   
    )  AS t
    UNION ALL
    SELECT '4' AS id, 0 AS a3, CASE WHEN sum(b2) <> 0 THEN round(sum(b1)/sum(b2) * 100,2) ELSE 0 END  AS a4
    FROM( 
        SELECT sum(cil.qtyentered) AS b1, 0 AS b2  
        FROM c_invoiceline cil
            JOIN  c_invoice ci ON ci.c_invoice_id=cil.c_invoice_id AND ci.docstatus IN ('CO','CL')
            JOIN m_product hh ON hh.m_product_id=cil.m_product_id AND hh.m_product_id = 1005237 
        WHERE cil.ad_client_id = 1000017 AND ci.dateacct>=$P{DateFrom} AND ci.dateacct<=$P{EndDate} AND ci.issotrx ='N'
        UNION ALL    
        SELECT 0 AS b1, sum(civ.productionqty) AS a2
        FROM m_productionplan civ
            JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
            JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_Category_ID=1000449
            JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID=1000067
            JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{DateFrom} AND lo.dateto<=$P{EndDate}AND lo.m_lot_id IS NOT NULL
        WHERE civ.ad_client_id=1000017    
        ) AS t
    )AS k GROUP BY k.id
            
    UNION ALL
      
    SELECT  '                   B (2 050 000)' AS a1,'%' AS a2, sum(a3)  AS a3, sum (a4) AS a4,id
    FROM(
        SELECT '5' AS id, CASE WHEN sum(b2)<>0 THEN  round(sum(b1)/sum(b2) * 100,2) ELSE 0 END  AS a3, 0 AS a4
        FROM( 
            SELECT  sum(civ.productionqty) AS b1, 0 AS b2
            FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
                JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.m_product_id=1008756
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id
                JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}  AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id=1000017
            UNION ALL    
            SELECT 0 AS b1, sum(civ.productionqty) AS a2
            FROM m_productionplan civ
                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
                JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_Category_ID=1000449
                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID=1000067
                JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}AND lo.m_lot_id IS NOT NULL
            WHERE civ.ad_client_id=1000017    
        )  AS t
        UNION ALL
        SELECT '5' AS id, 0 AS a3, CASE WHEN sum(b2) <> 0 THEN round(sum(b1)/sum(b2) * 100,2) ELSE 0 END  AS a4
                FROM( 
                    SELECT sum(cil.qtyentered) AS b1, 0 AS b2  
                    FROM c_invoiceline cil
                        JOIN  c_invoice ci ON ci.c_invoice_id=cil.c_invoice_id AND ci.docstatus IN ('CO','CL')
                        JOIN m_product hh ON hh.m_product_id=cil.m_product_id AND hh.M_Product_ID=1008756
                    WHERE cil.ad_client_id = 1000017 AND ci.dateacct>=$P{DateFrom} AND ci.dateacct<=$P{EndDate} AND ci.issotrx ='N'
                UNION ALL    
                    SELECT 0 AS b1, sum(civ.productionqty) AS a2
                    FROM m_productionplan civ
                        JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
                        JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_Category_ID=1000449
                        JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID=1000067
                        JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{DateFrom} AND lo.dateto<=$P{EndDate}AND lo.m_lot_id IS NOT NULL
                    WHERE civ.ad_client_id=1000017    
                    ) AS t
                )AS k GROUP BY k.id
            UNION ALL

            SELECT  '                   C (800 000)' AS a1,'%' AS a2, sum(a3)  AS a3, sum (a4) AS a4,id
            FROM(
                SELECT '6' AS id, CASE WHEN sum(b2)<>0 THEN  round(sum(b1)/sum(b2) * 100,2) ELSE 0 END  AS a3, 0 AS a4
                FROM( 
                    SELECT  sum(civ.productionqty) AS b1, 0 AS b2
                    FROM m_productionplan civ
                    JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
                    JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.m_product_id=1008757
                    JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id
                    JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}  AND lo.m_lot_id IS NOT NULL
                    WHERE civ.ad_client_id=1000017
                UNION ALL    
                    SELECT 0 AS b1, sum(civ.productionqty) AS b2
                    FROM m_productionplan civ
                        JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
                        JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_Category_ID=1000449
                        JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID=1000067
                        JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}AND lo.m_lot_id IS NOT NULL
                    WHERE civ.ad_client_id=1000017    
                )  AS t
            UNION ALL
                SELECT '6' AS id, 0 AS a3, CASE WHEN sum(b2) <> 0 THEN round(sum(b1)/sum(b2) * 100,2) ELSE 0 END  AS a4
                FROM( 
                    SELECT sum(cil.qtyentered) AS b1, 0 AS b2  
                    FROM c_invoiceline cil
                        JOIN  c_invoice ci ON ci.c_invoice_id=cil.c_invoice_id AND ci.docstatus IN ('CO','CL')
                        JOIN m_product hh ON hh.m_product_id=cil.m_product_id AND hh.M_Product_ID=1008757
                    WHERE cil.ad_client_id = 1000017 AND ci.dateacct>=$P{DateFrom} AND ci.dateacct<=$P{EndDate} AND ci.issotrx ='N'
                UNION ALL    
                    SELECT 0 AS b1, sum(civ.productionqty) AS a2
                    FROM m_productionplan civ
                        JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
                        JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_Category_ID=1000449
                        JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID=1000067
                        JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{DateFrom} AND lo.dateto<=$P{EndDate}AND lo.m_lot_id IS NOT NULL
                    WHERE civ.ad_client_id=1000017    
                    ) AS t
                )AS k GROUP BY k.id
UNION ALL
  
                SELECT '4.Tỷ lệ thu hôi bóc (đã trừ gỗ hỏng)' AS a1, 'kg/m3' AS a2, round(sum(a3),2) AS a3, sum(a4) AS a4, id
                FROM(
                    SELECT id,CASE WHEN sum(b2)<>0 THEN sum(b1)/sum(b2) ELSE 0 END AS a3, 0 AS a4   
                    FROM(
                        SELECT '7' AS id,sum(k.sl)AS b1, 0 AS b2
                        FROM (
                            SELECT hh.m_product_id,att.m_attributesetinstance_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
                            FROM c_invoiceline civ 
                                JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL')
                                JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_Category_ID=1000450
                                JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id AND att.M_AttributeSet_ID=1000067
                            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='N'
                            GROUP BY att.m_attributesetinstance_id,att.lot, hh.m_product_id
                        ) AS k
                        JOIN  m_lot lo ON lo.name=k.lot AND  lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate} AND lo.m_lot_id IS NOT NULL
                    
                    UNION ALL
                        SELECT '7' AS id,0 AS b1, sum(civ.productionqty) AS b2 
                        FROM m_productionplan civ
                            JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
                            JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_Category_ID=1000449
                            JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID=1000067
                            JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}AND lo.m_lot_id IS NOT NULL
                        WHERE civ.ad_client_id=1000017
                    )AS k GROUP BY k.id
   
                    UNION ALL                     
                        SELECT id,0 AS a3, CASE WHEN sum(b2)<>0 THEN sum(b1)/sum(b2) ELSE 0 END AS a4   
                        FROM(
                            SELECT '7' AS id,sum(k.sl)AS b1, 0 AS b2  
                            FROM (
                                SELECT hh.m_product_id,att.m_attributesetinstance_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
                                FROM c_invoiceline civ 
                                JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL')
                                JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_Category_ID=1000450
                                JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id AND att.M_AttributeSet_ID=1000067
                                WHERE civ.ad_client_id=1000017 AND ci.issotrx ='N'
                                GROUP BY att.m_attributesetinstance_id,att.lot, hh.m_product_id
                                ) AS k
                           JOIN  m_lot lo ON lo.name=k.lot AND  lo.dateto>=$P{DateFrom} AND lo.dateto<=$P{EndDate} AND lo.m_lot_id IS NOT NULL
                    
                    UNION ALL
                        SELECT '7' AS id,0 AS b1, sum(civ.productionqty) AS b2
                        FROM m_productionplan civ
                            JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
                            JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_Category_ID=1000449
                            JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id AND tt.M_AttributeSet_ID=1000067
                            JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{DateFrom} AND lo.dateto<=$P{EndDate}AND lo.m_lot_id IS NOT NULL
                        WHERE civ.ad_client_id=1000017
                        )AS k GROUP BY k.id
                    )AS t GROUP BY t.id
                    
UNION ALL
          
                    SELECT '5.Giá mua NL BQ (trừ gỗ loại)' AS a1, 'đ/kg' AS a2 , sum(a3) AS a3, sum(a4) AS a4, id
                    FROM (  
                        SELECT '8' AS id,CASE WHEN sum(k.sl) <> 0 THEN sum(k.tt)/sum(k.sl) ELSE 0 END AS a3, 0 AS a4 
                        FROM (
                            SELECT hh.m_product_id,att.m_attributesetinstance_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
                            FROM c_invoiceline civ 
                                JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL')
                                JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_Category_ID=1000450
                                JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id AND att.M_AttributeSet_ID=1000067
                            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='N'
                            GROUP BY att.m_attributesetinstance_id, hh.m_product_id
                        ) AS k
                        JOIN  m_lot lo ON lo.name=k.lot AND  lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate} AND lo.m_lot_id IS NOT NULL
                        UNION ALL
                        
                        SELECT '8' AS id,0 AS a3, CASE WHEN sum(k.sl) <> 0 THEN sum(k.tt)/sum(k.sl) ELSE 0 END AS a4
                        FROM (
                            SELECT hh.m_product_id,att.m_attributesetinstance_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
                            FROM c_invoiceline civ 
                                JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL')
                                JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_Category_ID=1000450
                                JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id AND att.M_AttributeSet_ID=1000067
                            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='N'
                            GROUP BY att.m_attributesetinstance_id, hh.m_product_id
                        ) AS k
                        JOIN  m_lot lo ON lo.name=k.lot AND  lo.dateto>=$P{DateFrom} AND lo.dateto<=$P{EndDate} AND lo.m_lot_id IS NOT NULL
           
                ) AS t GROUP BY t.id
UNION ALL
          
                SELECT '6.Thu từ khâu bóc (trừ gỗ loại), C L giá' AS a1, 'đ' AS a2 , sum(a3) AS a3, sum(a4)AS a4, id
                FROM (
                    SELECT '9' AS id, (sum(k.b1)+ sum(k.b2)+ sum(k.b3))  - sum(b4) AS a3, 0 AS a4
                    FROM (
                        SELECT '9' AS id, sum(c1)*2850000 AS b1, 0 AS b2, 0 AS b3, 0 AS b4 
                        FROM (
                            SELECT  sum(civ.productionqty) AS c1
                            FROM m_productionplan civ
                                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
                                JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.m_product_id=1005237
                                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id
                                JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}  AND lo.m_lot_id IS NOT NULL
                            WHERE civ.ad_client_id=1000017
                        )AS k
                        UNION ALL
                        SELECT '9' AS id, 0 AS b1,sum(c2)*2050000AS b2, 0 AS b3 ,0 AS b4
                        FROM (
                            SELECT  sum(civ.productionqty) AS c2
                            FROM m_productionplan civ
                                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
                                JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.m_product_id=1008756
                                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id
                                JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}  AND lo.m_lot_id IS NOT NULL
                            WHERE civ.ad_client_id=1000017
                        )AS k
                        UNION ALL
                        
                        SELECT '9' AS id, 0 AS b1,0 AS b2,sum(c3)*800000 AS b3, 0 AS b4
                        FROM(
                            SELECT  sum(civ.productionqty) AS c3
                            FROM m_productionplan civ
                                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
                                JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.m_product_id=1008757
                                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id
                                JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}  AND lo.m_lot_id IS NOT NULL
                            WHERE civ.ad_client_id=1000017
                        )AS k
                        
                        UNION ALL
                        
                        SELECT '9' AS id, 0 AS b1,0 AS b2,0 AS b3, sum(k.tt) AS b4
                        FROM (
                            SELECT hh.m_product_id,att.m_attributesetinstance_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
                            FROM c_invoiceline civ 
                                JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL')
                                JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_Category_ID=1000450
                                JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id AND att.M_AttributeSet_ID=1000067
                            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='N'
                            GROUP BY att.m_attributesetinstance_id, hh.m_product_id
                        ) AS k
                        JOIN  m_lot lo ON lo.name=k.lot AND  lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate} AND lo.m_lot_id IS NOT NULL
                    ) AS k GROUP BY k.id
                    
                    UNION ALL 
                    
                    SELECT '9' AS id,0 AS a3, (sum(k.b1)+ sum(k.b2)+ sum(k.b3))  - sum(b4) AS a4
                    FROM (
                        SELECT '9' AS id, sum(c1)*2850000AS b1,0 AS b2,0 AS b3, 0 AS b4 
                        FROM (
                            SELECT  sum(civ.productionqty) AS c1
                            FROM m_productionplan civ
                                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
                                JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.m_product_id=1005237
                                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id
                                JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{DateFrom} AND lo.dateto<=$P{EndDate}  AND lo.m_lot_id IS NOT NULL
                            WHERE civ.ad_client_id=1000017
                        )AS k
                        UNION ALL
                        SELECT '9' AS id, 0 AS b1,sum(c2)*2050000AS b2,0 AS b3 ,0 AS b4
                        FROM (
                            SELECT  sum(civ.productionqty) AS c2
                            FROM m_productionplan civ
                                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
                                JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.m_product_id=1008756
                                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id
                                JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{DateFrom} AND lo.dateto<=$P{EndDate}  AND lo.m_lot_id IS NOT NULL
                            WHERE civ.ad_client_id=1000017
                        )AS k
                        UNION ALL
                        
                        SELECT '9' AS id, 0 AS b1,0 AS b2,sum(c3)*800000 AS b3, 0 AS b4
                        FROM(
                            SELECT  sum(civ.productionqty) AS c3
                            FROM m_productionplan civ
                                JOIN m_production ci ON civ.m_production_id = ci.m_production_id AND ci.docstatus IN ('CO','CL') 
                                JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.m_product_id=1008757
                                JOIN m_attributesetinstance tt ON civ.m_attributesetinstance_id=tt.m_attributesetinstance_id
                                JOIN m_lot lo ON lo.name=tt.lot AND lo.dateto>=$P{DateFrom} AND lo.dateto<=$P{EndDate}  AND lo.m_lot_id IS NOT NULL
                            WHERE civ.ad_client_id=1000017
                        )AS k
                        
                        UNION ALL
                        
                        SELECT '9' AS id, 0 AS b1,0 AS b2,0 AS b3, sum(k.tt) AS b4
                        FROM (
                            SELECT hh.m_product_id,att.m_attributesetinstance_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
                            FROM c_invoiceline civ 
                                JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL')
                                JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_Category_ID=1000450
                                JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id AND att.M_AttributeSet_ID=1000067
                            WHERE civ.ad_client_id=1000017 AND ci.issotrx ='N'
                            GROUP BY att.m_attributesetinstance_id, hh.m_product_id
                        ) AS k
                        JOIN  m_lot lo ON lo.name=k.lot AND  lo.dateto>=$P{DateFrom} AND lo.dateto<=$P{EndDate} AND lo.m_lot_id IS NOT NULL
                    ) AS k GROUP BY k.id
                    
                        
                ) AS t  GROUP BY t.id
            
UNION ALL
            SELECT '7.Thu lõi và gỗ hỏng không bóc' AS a1, 'đ' AS a2, sum(a3) AS a3,sum(a4) AS a4,id
            FROM(
                SELECT '10' AS id, sum(cil.qtyentered) AS a3, 0 AS a4  
                    FROM c_invoiceline cil
                        JOIN  c_invoice ci ON ci.c_invoice_id=cil.c_invoice_id AND ci.docstatus IN ('CO','CL')
                        JOIN m_product hh ON hh.m_product_id=cil.m_product_id AND hh.M_Product_ID=1012371
                    WHERE cil.ad_client_id = 1000017  AND ci.issotrx ='Y' AND  ci.dateacct>=$P{StartDate} AND ci.dateacct<=$P{EndDate}
                UNION ALL
                
                SELECT '10' AS id,0 AS a3, sum(cil.qtyentered) AS a4  
                    FROM c_invoiceline cil
                        JOIN  c_invoice ci ON ci.c_invoice_id=cil.c_invoice_id AND ci.docstatus IN ('CO','CL')
                        JOIN m_product hh ON hh.m_product_id=cil.m_product_id AND hh.M_Product_ID=1012371
                    WHERE cil.ad_client_id = 1000017  AND ci.issotrx ='Y' AND  ci.dateacct>=$P{DateFrom} AND ci.dateacct<=$P{EndDate}
                        ) AS t GROUP BY t.id
                              
 UNION ALL
                SELECT '7.1 Trong đó  gổ hỏng khi mua trong lô mua' AS a1,'đ' AS a2, sum(a3) AS a3, sum(a4) AS a4,id
                FROM (
                    SELECT '11' AS id, sum(t.tt) AS a3,0 AS a4
                      FROM(   
                        SELECT hh.m_product_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
                        FROM c_invoiceline civ 
                            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL')
                            JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.m_product_id=1013024
                            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id 
                        WHERE civ.ad_client_id=1000017 AND ci.issotrx ='N'
                        GROUP BY  hh.m_product_id,att.lot
                    ) AS t 
                    JOIN m_lot lo ON lo.name = t.lot AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}  AND lo.m_lot_id IS NOT NULL
                    GROUP BY  t.m_product_id
                    
                    UNION ALL
                    
                    SELECT '11' AS id,0 AS a3, sum(t.tt) AS a4
                      FROM(   
                        SELECT hh.m_product_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
                        FROM c_invoiceline civ 
                            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL')
                            JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.m_product_id=1013024
                            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id 
                        WHERE civ.ad_client_id=1000017 AND ci.issotrx ='N'
                        GROUP BY  hh.m_product_id,att.lot
                    ) AS t 
                    JOIN m_lot lo ON lo.name = t.lot AND lo.dateto>=$P{DateFrom} AND lo.dateto<=$P{EndDate}  AND lo.m_lot_id IS NOT NULL
                    GROUP BY  t.m_product_id
                 ) AS t  GROUP BY t.id
                
UNION ALL
            
                SELECT '8.Thu rác gỗ' AS a1,'đ' AS a2, sum(a3) AS a3, sum(a4) AS a4,id
                FROM (
                    SELECT '12' AS id, sum(t.tt) AS a3,0 AS a4
                      FROM(   
                        SELECT hh.m_product_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
                        FROM c_invoiceline civ 
                            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL')
                            JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_ID=1012372
                            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id 
                        WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y'
                        GROUP BY  hh.m_product_id,att.lot
                    ) AS t 
                    JOIN m_lot lo ON lo.name = t.lot AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate} AND lo.m_lot_id IS NOT NULL
                    GROUP BY  t.m_product_id
                    
                    UNION ALL
                    
                    SELECT '12' AS id,0 AS a3, sum(t.tt) AS a4
                      FROM(   
                        SELECT hh.m_product_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
                        FROM c_invoiceline civ 
                            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL')
                            JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_ID=1012372
                            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id 
                        WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y'
                        GROUP BY  hh.m_product_id,att.lot
                    ) AS t 
                    JOIN m_lot lo ON lo.name = t.lot AND lo.dateto>=$P{DateFrom} AND lo.dateto<=$P{EndDate}  AND lo.m_lot_id IS NOT NULL
                    GROUP BY  t.m_product_id
                 ) AS t  GROUP BY t.id
                
 UNION ALL
                
                SELECT '9.Thu bột chà' AS a1,'đ' AS a2, sum(a3) AS a3, sum(a4) AS a4,id
                FROM (
                    SELECT '13' AS id, sum(t.tt) AS a3,0 AS a4
                      FROM(   
                        SELECT hh.m_product_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
                        FROM c_invoiceline civ 
                            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL')
                            JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh. M_Product_ID=1012373
                            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id 
                        WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y'
                        GROUP BY  hh.m_product_id,att.lot
                    ) AS t 
                    JOIN m_lot lo ON lo.name = t.lot AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate} AND lo.m_lot_id IS NOT NULL
                    GROUP BY  t.m_product_id
                    
                    UNION ALL
                    
                    SELECT '13' AS id,0 AS a3, sum(t.tt) AS a4
                      FROM(   
                        SELECT hh.m_product_id,att.lot,sum(civ.qtyinvoiced) AS sl,sum(civ.linetotalamt) AS tt 
                        FROM c_invoiceline civ 
                            JOIN c_invoice ci ON ci.c_invoice_id=civ.c_invoice_id AND ci.docstatus IN ('CO','CL')
                            JOIN m_product hh ON civ.m_product_id=hh.m_product_id  AND hh.M_Product_ID=1012373
                            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id=att.m_attributesetinstance_id 
                        WHERE civ.ad_client_id=1000017 AND ci.issotrx ='Y'
                        GROUP BY  hh.m_product_id,att.lot
                    ) AS t 
                    JOIN m_lot lo ON lo.name = t.lot AND lo.dateto>=$P{DateFrom} AND lo.dateto<=$P{EndDate}  AND lo.m_lot_id IS NOT NULL
                    GROUP BY  t.m_product_id
                 ) AS t  GROUP BY t.id