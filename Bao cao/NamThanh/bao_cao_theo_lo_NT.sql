SELECT  'ca' AS "nhom",a1, round(sum(a2)/1000,0) AS a2, round(sum(a3)/1000,0) AS a3, round((sum(a2)- sum(a3)-(hsv_dinhmuc+hsv_dinhmuc1)/10000),0) AS a4, round(sum(a5),0) AS a5,round(sum(a6) ,0)AS a6,round(sum(a7),0) AS a7,
round(sum(a8),0) AS a8,round(sum(a9),0) AS a9,round(sum(a5-a6-a7-a8-a9),0) AS a10, CASE WHEN sum(a11)<>0 THEN round(100*(sum(a11)- sum(a5))/sum(a11),0) ELSE 0 END  AS a11,round((hsv_dinhmuc+hsv_dinhmuc1)/1000 ,0)AS a12
FROM(
            SELECT  
            att.lot AS a1,
            CASE WHEN ci.issotrx = 'N' THEN civ.linenetamt ELSE 0 END AS a2, 
            CASE WHEN ci.issotrx = 'Y' THEN civ.linenetamt ELSE 0  END AS a3,
            0 AS a4,  
            CASE WHEN ci.issotrx = 'N' THEN civ.qtyinvoiced ELSE 0 END  AS a5,
            0 AS a6,
            0 AS a7,
            0 AS a8,
            0 AS a9,
            0 AS a10,
            CASE WHEN ci.issotrx = 'Y' THEN civ.qtyinvoiced ELSE 0  END AS a11
            
            FROM c_invoiceline  civ 
            JOIN  c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id   AND ci.docstatus IN ('CO', 'CL') 
            JOIN m_product hh ON hh.m_product_id = civ.m_product_id 
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.lot IS NOT NULL
            WHERE civ.ad_client_id= 1000023
    
            UNION ALL
             --a6--
            SELECT  att.lot AS a1, 0 AS a2,0 AS a3, 0 AS a4, 0 AS a5, civ.qtyinvoiced AS a6,0 AS a7, 0 AS a8, 0 AS a9, 0 AS a10,0 AS a11 FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id   AND ci.docstatus IN ('CO', 'CL') AND ci.issotrx = 'N'
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.lot IS NOT NULL
            WHERE  civ.m_product_id = 1016441 AND civ.ad_client_id= $P{AD_CLIENT_ID}
            
            UNION ALL
             --a7--
            SELECT  att.lot AS a1, 0 AS a2,0 AS a3, 0 AS a4, 0 AS a5,0 AS a6, civ.qtyinvoiced AS a7,  0 AS a8, 0 AS a9, 0 AS a10,0 AS a11 FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id   AND ci.docstatus IN ('CO', 'CL') AND ci.issotrx = 'N'
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.lot IS NOT NULL
            WHERE  civ.m_product_id = 1016443 AND civ.ad_client_id= $P{AD_CLIENT_ID}
            UNION ALL
             
            SELECT  att.lot AS a1, 0 AS a2,0 AS a3, 0 AS a4, 0 AS a5,0 AS a6, 0 AS a7,  civ.qtyinvoiced AS a8, 0 AS a9, 0 AS a10,0 AS a11 FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id   AND ci.docstatus IN ('CO', 'CL') AND ci.issotrx = 'N'
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.lot IS NOT NULL
            WHERE  civ.m_product_id = 1016444  AND civ.ad_client_id= $P{AD_CLIENT_ID} 
            UNION ALL
            SELECT  att.lot AS a1,0 AS a2,0 AS a3, 0 AS a4, 0 AS a5,0 AS a6, 0 AS a7,  0 AS a8, civ.qtyinvoiced AS a9, 0 AS a10,0 AS a11 FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id   AND ci.docstatus IN ('CO', 'CL') AND ci.issotrx = 'N'
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.lot IS NOT NULL
            WHERE  civ.m_product_id = 1016445 AND civ.ad_client_id= $P{AD_CLIENT_ID}

            UNION ALL
            SELECT  att.lot AS a1,0 AS a2,0 AS a3, 0 AS a4, 0 AS a5,0 AS a6, 0 AS a7,  0 AS a8, 0 AS a9, civ.qtyinvoiced AS a10,0 AS a11  FROM c_invoiceline civ
            JOIN c_invoice ci ON ci.c_invoice_id = civ.c_invoice_id   AND ci.docstatus IN ('CO', 'CL') AND ci.issotrx = 'N'
            JOIN m_attributesetinstance att ON civ.m_attributesetinstance_id = att.m_attributesetinstance_id AND att.lot IS NOT NULL
            WHERE  civ.m_product_id = 1016442 AND civ.ad_client_id= $P{AD_CLIENT_ID}
            
            

) AS t JOIN m_lot lo ON lo.name = t.a1 AND lo.datefrom >= '01-01-2019' AND lo.datefrom <= '12-31-2019' 
AND (lo.M_Lot_ID = $P{M_Lot_ID} OR $P{M_Lot_ID} IS NULL) 
GROUP BY a1,hsv_dinhmuc, hsv_dinhmuc1


