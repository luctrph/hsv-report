SELECT 'I' AS nhom,'1' AS id , description,NAME, NULL::int4 AS sl,NULL::int4 AS tt,NULL::int4 AS dg FROM hsv_kqthumua WHERE ad_client_id =1000019 AND VALUE ='1'
UNION ALL
SELECT  'I' AS nhom, '2' AS id,  tp.description, tp.name, sl,tt, tt/sl AS dg 
FROM(
SELECT '2' AS id,sum(qtyinvoiced) AS sl, sum(linenetamt) AS tt  FROM c_invoice ci
JOIN c_invoiceline civ ON civ.c_invoice_id=ci.c_invoice_id AND civ.m_product_id = 1015089
 WHERE issotrx = 'Y' AND ci.ad_client_id = 1000019
) AS k 
JOIN hsv_kqthumua tp ON  tp.value = k.id 
WHERE ad_client_id = 1000019
UNION ALL
SELECT tp.description, tp.name, NULL::int4 AS hsv_dinhmuc1, tp.value, k.qty, k.tt, CASE WHEN k.qty <> 0 THEN round(k.tt / k.qty, 2) ELSE 0 END AS dg
FROM (
	SELECT '2' AS id, - 1 * sum(fc.qty) AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE  ad_table_id = 321 AND M_Product_ID = 1015083 AND fc.dateacct <= 1000019 
	GROUP BY id
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '2'
UNION ALL
SELECT 'I' AS nhom,'4' AS id , description,NAME, NULL::int4 AS sl,NULL::int4 AS tt,NULL::int4 AS dg FROM hsv_kqthumua WHERE ad_client_id =1000019 AND VALUE ='4'
