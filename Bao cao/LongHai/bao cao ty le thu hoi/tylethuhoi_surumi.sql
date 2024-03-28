SELECT tp.description, tp.name, NULL::int4 AS hsv_dinhmuc1, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM (
	SELECT '1' AS id, - 1 * sum(fc.qty) AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492,1000493) AND fc.C_Campaign_ID=1000062
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 321 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k
RIGHT JOIN HSV_Payrollcogviec tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '1'

UNION ALL

SELECT CAST(ROW_NUMBER() OVER() AS VARCHAR) AS "value", k.name, k.dinhmuc1, k.id, k.qty, k.tt, CASE WHEN k.qty<> 0 THEN round (k.tt / k.qty,2) ELSE 0 END  AS dg
FROM (
	SELECT '' AS "value", hh.name, NULL::int4  AS dinhmuc1, '100' AS id, - 1 * sum(fc.qty) AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492,1000493) AND fc.C_Campaign_ID=1000062
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 321 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY hh.name
	) AS k

UNION ALL

SELECT tp.description, tp.name, NULL::int4 AS hsv_dinhmuc1, tp.value AS id, NULL::int4 AS qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM HSV_Payrollcogviec tp
WHERE "value" = '2' AND ad_client_id = 1000019

UNION ALL


SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM (
	SELECT '3' AS id,  sum(fc.qty) AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1015083 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k
RIGHT JOIN HSV_Payrollcogviec tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '3'

UNION ALL


SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM (
	SELECT '4' AS id,  sum(fc.qty) AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1016237 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k
RIGHT JOIN HSV_Payrollcogviec tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '4'

UNION ALL


SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, k.qty, NULL::int4 AS tt,  NULL::int4 AS dg
FROM (
	SELECT '5' AS id, sum(fc.qty) AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID=1000062 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k
RIGHT JOIN HSV_Payrollcogviec tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '5'

UNION ALL


SELECT tp.description, tp.name, NULL::int4 AS hsv_dinhmuc1, tp.value AS id, NULL::int4 AS qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM HSV_Payrollcogviec tp
WHERE "value" = '6' AND ad_client_id = 1000019
UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, k.qty,NULL::int4 AS tt, NULL::int4  AS dg
FROM(
SELECT id, CASE WHEN sum(qty3) <> 0 THEN sum(qty1)/sum(qty3) ELSE 0 END  AS qty
FROM(
SELECT '7' AS id, - 1 * sum(fc.qty) AS qty1 , 0 AS qty3
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492,1000493) AND fc.C_Campaign_ID=1000062
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 321 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL

	SELECT '7' AS id, 0 AS qty1, sum(fc.qty) AS qty3
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
) AS k GROUP BY id
) AS k 
RIGHT JOIN HSV_Payrollcogviec tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '7'

UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, NULL::int4 AS qty,NULL::int4  AS tt,k.tt AS bg
FROM(
SELECT id,  CASE WHEN sum(sl3) <>0 THEN  (sum(t1)- sum(t2))/sum(sl3) ELSE 0 END  AS tt  FROM(
    SELECT '8' AS id, sum(fc.amtacctcr - fc.amtacctdr) AS "t1", 0 AS t2, 0 AS sl3
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492,1000493) AND fc.C_Campaign_ID=1000062 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 321
	GROUP BY id
	
	UNION ALL
	
	SELECT '8' AS id,  0 AS t1, sum(-fc.amtacctcr + fc.amtacctdr) AS "t2",0 AS sl3
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1015083 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	
	UNION ALL
	SELECT '8' AS id, 0 AS t1, 0 AS t2, sum(fc.qty) AS ql3
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id
	) AS k
	RIGHT JOIN HSV_Payrollcogviec tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '8'

UNION ALL


SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, k.qty AS qty,NULL::int4 AS tt, NULL::int4  AS dg
FROM(
SELECT id, CASE WHEN  sum(qty1)<>0 THEN   100*sum(qty3)/sum(qty1) ELSE 0 END AS qty FROM (
    SELECT '9' AS id,  sum(fc.qty) AS qty3, 0 AS qty1
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1015083 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	UNION ALL
	SELECT '9' AS id,0 AS qty3, - 1 * sum(fc.qty) AS qty1
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492,1000493) AND fc.C_Campaign_ID=1000062
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 321 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id
	) AS k 
	RIGHT JOIN HSV_Payrollcogviec tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '9'
UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, k.qty AS qty,NULL::int4 AS tt, NULL::int4  AS dg
FROM(
SELECT id, CASE WHEN sum(qty4) <> 0 THEN sum(qty1)/sum(qty4) ELSE 0 END AS qty
FROM(
SELECT '10' AS id, - 1 * sum(fc.qty) AS qty1,0 AS qty4
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492,1000493) AND fc.C_Campaign_ID=1000062
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 321 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	UNION ALL
	SELECT '10' AS id, 0 AS qty1, sum(fc.qty) AS qty4
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1016237 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
) AS k GROUP BY id
) AS k
RIGHT JOIN HSV_Payrollcogviec tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '10'

UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, k.qty AS qty,NULL::int4 AS tt, NULL::int4  AS dg
FROM(
SELECT id, CASE WHEN sum(qty3)<>0 THEN sum(qty2)/sum(qty3) ELSE 0 END AS qty
FROM(
 	SELECT '11' AS id,  sum(fc.qty) AS qty2, 0 AS qty3
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1016237 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	
	UNION ALL
SELECT '11' AS id, 0 AS qty2, sum(fc.qty) AS qty3
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id
	) AS k 
	RIGHT JOIN HSV_Payrollcogviec tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '11'