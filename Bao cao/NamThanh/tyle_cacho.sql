SELECT id,tp.description AS a1,tp.name AS a2, a3,NULL::int4 AS  a4, a5 
FROM(
  SELECT '20' AS id,sum(qtyentered)  AS a3, sum(linenetamt) AS a5   
  FROM c_invoiceline civ 
  INNER JOIN c_invoice ci ON civ.c_invoice_id= ci.c_invoice_id AND civ.m_product_id = 1016529 AND ci.docstatus IN ('CL','CO') AND  ci.issotrx = 'N'
  INNER JOIN  m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id  
  INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
  INNER JOIN m_lot lo ON tts.lot = lo.name AND  tts.lot IS NOT NULL AND lo.dateto>='01-01-2019' AND lo.dateto<='05-31-2019'  --and (lo.M_Lot_ID=$P{M_Lot_ID} or $P{M_Lot_ID} is null)
  ) AS k
 RIGHT JOIN  hsv_kqthumua tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '20'
UNION ALL

SELECT id,tp.description AS a1,tp.name AS a2, a3,NULL::int4  AS a4, a5 
FROM(
  SELECT '21' AS id,sum(qtyentered)  AS a3, sum(linenetamt) AS a5   
  FROM c_invoiceline civ 
  INNER JOIN c_invoice ci ON civ.c_invoice_id= ci.c_invoice_id AND civ.m_product_id = 1016529 AND ci.docstatus IN ('CL','CO') AND  ci.issotrx = 'Y'
  INNER JOIN  m_attributeinstance tt ON tt.m_attributesetinstance_id = civ.m_attributesetinstance_id  
  INNER JOIN m_attributesetinstance tts ON tt.m_attributesetinstance_id = tts.m_attributesetinstance_id
  INNER JOIN m_lot lo ON tts.lot = lo.name AND  tts.lot IS NOT NULL AND lo.dateto>='01-01-2019' AND lo.dateto<='05-31-2019'  --and (lo.M_Lot_ID=$P{M_Lot_ID} or $P{M_Lot_ID} is null)
  
  ) AS k
 RIGHT JOIN  hsv_kqthumua tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '21'