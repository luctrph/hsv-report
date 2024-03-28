SELECT id ,tp.description AS a1,tp.name AS a2,CASE WHEN sum(a19) >0 THEN sum(a10) + sum(a21) - sum(a20) ELSE 0 END AS a22
FROM(
SELECT '22' AS id,CASE WHEN round(-sum(a4)+sum(a5),0)>0 THEN round(-sum(a4)+sum(a5),0)/2 ELSE 0 END AS a19,0 AS a10,0 AS a20,0 AS a21
    FROM(
        SELECT '19' AS id,round(sum(a5),2) AS a4,0 AS a5
        FROM( 
            SELECT id,tp.description AS a1,tp.name AS a2, a3,CASE WHEN a3 <> 0 THEN a5/a3 ELSE 0 END AS a4, a5 
            FROM(
                SELECT '2' AS id,sum(qtyentered)  AS a3, sum(linenetamt) AS a5   
                FROM c_invoiceline civ 
                    INNER JOIN c_invoice ci ON civ.c_invoice_id= ci.c_invoice_id AND civ.m_product_id = 1016614  AND ci.docstatus IN ('CL','CO') AND  ci.issotrx = 'N'
                    INNER JOIN  m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id  
                    INNER JOIN m_attributevalue attv ON tt.m_attribute_id=attv.m_attribute_id AND tt.m_attributevalue_id=attv.m_attributevalue_id AND attv.M_AttributeValue_ID=1000440
                    INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
                    INNER JOIN m_lot lo ON tts.lot = lo.name AND  tts.lot IS NOT NULL AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}  AND (lo.M_Lot_ID=$P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
  
                ) AS k
                RIGHT JOIN  hsv_kqthumua tp ON tp.value = k.id
                WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '2'
            
                UNION ALL
                SELECT id,tp.description AS a1,tp.name AS a2, a3,CASE WHEN a3 <> 0 THEN a5/a3 ELSE 0 END AS a4, a5 
                FROM(
                    SELECT '3' AS id,sum(qtyentered)  AS a3, sum(linenetamt) AS a5   
                    FROM c_invoiceline civ 
                        INNER JOIN c_invoice ci ON civ.c_invoice_id= ci.c_invoice_id AND civ.m_product_id = 1016614  AND ci.docstatus IN ('CL','CO') AND  ci.issotrx = 'N'
                        INNER JOIN  m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id  
                        INNER JOIN m_attributevalue attv ON tt.m_attribute_id=attv.m_attribute_id AND tt.m_attributevalue_id=attv.m_attributevalue_id AND attv.M_AttributeValue_ID=1000441
                        INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
                        INNER JOIN m_lot lo ON tts.lot = lo.name AND  tts.lot IS NOT NULL AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}   AND (lo.M_Lot_ID=$P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
                    ) AS k
                    RIGHT JOIN  hsv_kqthumua tp ON tp.value = k.id
                    WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '3'
                UNION ALL
                SELECT id,tp.description AS a1,tp.name AS a2, a3,CASE WHEN a3 <> 0 THEN a5/a3 ELSE 0 END AS a4, a5 
                FROM(
                    SELECT '4' AS id,sum(qtyentered)  AS a3, sum(linenetamt) AS a5   
                    FROM c_invoiceline civ 
                        INNER JOIN c_invoice ci ON civ.c_invoice_id= ci.c_invoice_id AND civ.m_product_id = 1016614  AND ci.docstatus IN ('CL','CO') AND  ci.issotrx = 'N'
                        INNER JOIN  m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id  
                        INNER JOIN m_attributevalue attv ON tt.m_attribute_id=attv.m_attribute_id AND tt.m_attributevalue_id=attv.m_attributevalue_id AND attv.M_AttributeValue_ID=1000442
                        INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
                        INNER JOIN m_lot lo ON tts.lot = lo.name AND  tts.lot IS NOT NULL AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}  AND (lo.M_Lot_ID=$P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
                    ) AS k
                    RIGHT JOIN  hsv_kqthumua tp ON tp.value = k.id
                    WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '4'
                ) AS k 
                UNION ALL
                SELECT '19' AS id,0 AS a4,round(sum(a5),2) AS a5
                FROM(
                    SELECT id,tp.description AS a1,tp.name AS a2, a3,tp.hsv_dinhmuc AS a4, a3*hsv_dinhmuc AS a5 
                FROM(
                    SELECT '6' AS id,sum(qtyentered)  AS a3   
                    FROM c_invoiceline civ 
                        INNER JOIN c_invoice ci ON civ.c_invoice_id= ci.c_invoice_id AND civ.m_product_id = 1016614  AND ci.docstatus IN ('CL','CO') AND  ci.issotrx = 'Y'
                        INNER JOIN  m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id  
                        INNER JOIN m_attributevalue attv ON tt.m_attribute_id=attv.m_attribute_id AND tt.m_attributevalue_id=attv.m_attributevalue_id AND attv.M_AttributeValue_ID=1000449
                        INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
                        INNER JOIN m_lot lo ON tts.lot = lo.name AND  tts.lot IS NOT NULL AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}  AND (lo.M_Lot_ID=$P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
                    ) AS k
                    RIGHT JOIN  hsv_kqthumua tp ON tp.value = k.id
                    WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '6'
                    UNION ALL
                SELECT id,tp.description AS a1,tp.name AS a2, a3,tp.hsv_dinhmuc AS a4, a3*hsv_dinhmuc AS a5 
                FROM(
                    SELECT '7' AS id,sum(qtyentered)  AS a3   
                    FROM c_invoiceline civ 
                        INNER JOIN c_invoice ci ON civ.c_invoice_id= ci.c_invoice_id AND civ.m_product_id = 1016614  AND ci.docstatus IN ('CL','CO') AND  ci.issotrx = 'Y'
                        INNER JOIN  m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id  
                        INNER JOIN m_attributevalue attv ON tt.m_attribute_id=attv.m_attribute_id AND tt.m_attributevalue_id=attv.m_attributevalue_id AND attv.M_AttributeValue_ID=1000447
                        INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
                        INNER JOIN m_lot lo ON tts.lot = lo.name AND  tts.lot IS NOT NULL AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}   AND (lo.M_Lot_ID=$P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
                    ) AS k
                    RIGHT JOIN  hsv_kqthumua tp ON tp.value = k.id
                    WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '7'
                    UNION ALL
                SELECT id,tp.description AS a1,tp.name AS a2, a3,tp.hsv_dinhmuc AS a4, a3*hsv_dinhmuc AS a5 
                FROM(
                    SELECT '8' AS id,sum(qtyentered)  AS a3   
                    FROM c_invoiceline civ 
                        INNER JOIN c_invoice ci ON civ.c_invoice_id= ci.c_invoice_id AND civ.m_product_id = 1016614  AND ci.docstatus IN ('CL','CO') AND  ci.issotrx = 'Y'
                        INNER JOIN  m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id  
                        INNER JOIN m_attributevalue attv ON tt.m_attribute_id=attv.m_attribute_id AND tt.m_attributevalue_id=attv.m_attributevalue_id AND attv.M_AttributeValue_ID=1000446
                        INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
                        INNER JOIN m_lot lo ON tts.lot = lo.name AND  tts.lot IS NOT NULL AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}   AND (lo.M_Lot_ID=$P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
                  ) AS k
                RIGHT JOIN  hsv_kqthumua tp ON tp.value = k.id
                WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '8'
                UNION ALL
                SELECT id,tp.description AS a1,tp.name AS a2, a3,tp.hsv_dinhmuc AS a4, a3*hsv_dinhmuc AS a5 
                FROM(
                    SELECT '9' AS id,sum(qtyentered)  AS a3   
                    FROM c_invoiceline civ 
                        INNER JOIN c_invoice ci ON civ.c_invoice_id= ci.c_invoice_id AND civ.m_product_id = 1016614  AND ci.docstatus IN ('CL','CO') AND  ci.issotrx = 'Y'
                        INNER JOIN  m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id  
                        INNER JOIN m_attributevalue attv ON tt.m_attribute_id=attv.m_attribute_id AND tt.m_attributevalue_id=attv.m_attributevalue_id AND attv.M_AttributeValue_ID=1000445
                        INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
                        INNER JOIN m_lot lo ON tts.lot = lo.name AND  tts.lot IS NOT NULL AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}   AND (lo.M_Lot_ID=$P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
                    ) AS k
                    RIGHT JOIN  hsv_kqthumua tp ON tp.value = k.id
                    WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '9'
                UNION ALL
                SELECT id,tp.description AS a1,tp.name AS a2, a3,tp.hsv_dinhmuc AS a4, a3*hsv_dinhmuc AS a5 
                FROM(
                  SELECT '10' AS id,sum(qtyentered)  AS a3   
                  FROM c_invoiceline civ 
                  INNER JOIN c_invoice ci ON civ.c_invoice_id= ci.c_invoice_id AND civ.m_product_id = 1016614  AND ci.docstatus IN ('CL','CO') AND  ci.issotrx = 'Y'
                  INNER JOIN  m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id  
                  INNER JOIN m_attributevalue attv ON tt.m_attribute_id=attv.m_attribute_id AND tt.m_attributevalue_id=attv.m_attributevalue_id AND attv.M_AttributeValue_ID=1000448
                  INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
                  INNER JOIN m_lot lo ON tts.lot = lo.name AND  tts.lot IS NOT NULL AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}   AND (lo.M_Lot_ID=$P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
                  ) AS k
                 RIGHT JOIN  hsv_kqthumua tp ON tp.value = k.id
                WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '10'
            ) AS k           
        ) AS k GROUP BY id 
        UNION ALL
        SELECT '22' AS id,0 AS a19,a5 AS a10,0 AS a20,0 AS a21
        FROM(
            SELECT id,tp.description AS a1,tp.name AS a2, a3,tp.hsv_dinhmuc AS a4, a3*hsv_dinhmuc AS a5 
            FROM(
                  SELECT '10' AS id,sum(qtyentered)  AS a3   
                  FROM c_invoiceline civ 
                  INNER JOIN c_invoice ci ON civ.c_invoice_id= ci.c_invoice_id AND civ.m_product_id = 1016614  AND ci.docstatus IN ('CL','CO') AND  ci.issotrx = 'Y'
                  INNER JOIN  m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id  
                  INNER JOIN m_attributevalue attv ON tt.m_attribute_id=attv.m_attribute_id AND tt.m_attributevalue_id=attv.m_attributevalue_id AND attv.M_AttributeValue_ID=1000448
                  INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
                  INNER JOIN m_lot lo ON tts.lot = lo.name AND  tts.lot IS NOT NULL AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}   AND (lo.M_Lot_ID=$P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
                  ) AS k
                 RIGHT JOIN  hsv_kqthumua tp ON tp.value = k.id
                WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '10'
            ) AS k
            UNION ALL
            SELECT '22' AS id,0 AS a19,0 AS a10,a5 AS a20,0 AS a21
            FROM(
                    SELECT id,tp.description AS a1,tp.name AS a2, a3,NULL::int4 AS  a4, a5 
                    FROM(
                      SELECT '20' AS id,sum(qtyentered)  AS a3, sum(linenetamt) AS a5   
                      FROM c_invoiceline civ 
                      INNER JOIN c_invoice ci ON civ.c_invoice_id= ci.c_invoice_id AND civ.m_product_id = 1016529 AND ci.docstatus IN ('CL','CO') AND  ci.issotrx = 'N'
                      INNER JOIN  m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id  
                      INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
                      INNER JOIN m_lot lo ON tts.lot = lo.name AND  tts.lot IS NOT NULL AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}  $P{AD_CLIENT_ID}AND (lo.M_Lot_ID=$P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
                      ) AS k
                     RIGHT JOIN  hsv_kqthumua tp ON tp.value = k.id
                    WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '20'
            ) AS k
               UNION ALL
            SELECT '22' AS id,0 AS a19,0 AS a10,0 AS a20,a5 AS a21
            FROM(
                SELECT id,tp.description AS a1,tp.name AS a2, a3,NULL::int4  AS a4, a5 
                FROM(
                  SELECT '21' AS id,sum(qtyentered)  AS a3, sum(linenetamt) AS a5   
                  FROM c_invoiceline civ 
                  INNER JOIN c_invoice ci ON civ.c_invoice_id= ci.c_invoice_id AND civ.m_product_id = 1016529 AND ci.docstatus IN ('CL','CO') AND  ci.issotrx = 'Y'
                  INNER JOIN  m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id  
                  INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
                  INNER JOIN m_lot lo ON tts.lot = lo.name AND  tts.lot IS NOT NULL AND lo.dateto>=$P{StartDate} AND lo.dateto<=$P{EndDate}  $P{AD_CLIENT_ID}AND (lo.M_Lot_ID=$P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL)
                  
                  ) AS k
                 RIGHT JOIN  hsv_kqthumua tp ON tp.value = k.id
                WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '21'
            ) AS k
) AS k RIGHT JOIN  hsv_kqthumua tp ON tp.value = k.id
                WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '22'
                GROUP BY id,tp.description,tp.name