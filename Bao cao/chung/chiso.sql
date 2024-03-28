
SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, k.qty,NULL::int4 AS tt, NULL::int4  AS dg
FROM(
SELECT id, CASE WHEN sum(qty3) <> 0 THEN (sum(qty1)-sum(qty2)-sum(qty4))/sum(qty3) ELSE 0 END  AS qty
FROM(
    SELECT '7' AS id, - 1 * sum(fc.qty) AS qty1 ,0 AS qty2, 0 AS qty3, 0 AS qty4
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492,1000493) AND fc.C_Campaign_ID=1000062
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 321 AND fc.dateacct>='07-01-2019' AND fc.dateacct<='07-31-2019' 
	GROUP BY id
	UNION ALL
	SELECT '7' AS id, 0 AS qty1,- 1 * sum(fc.qty) AS qty2 , 0 AS qty3, 0 AS qty4
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_ID IN (1016501,1016346) AND fc.C_Campaign_ID=1000062
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 321 AND fc.dateacct>='07-01-2019' AND fc.dateacct<='07-31-2019' 
	GROUP BY id
	UNION ALL
	
	SELECT '7' AS id, 0 AS qty1,0 AS qty2 , 0 AS qty3,- 1 * sum(fc.qty) AS qty4
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_ID IN (1016440) AND fc.C_Campaign_ID=1000062
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 321 AND fc.dateacct>='07-01-2019' AND fc.dateacct<='07-31-2019' 
	GROUP BY id
    UNION ALL

	SELECT '7' AS id, 0 AS qty1, 0 AS qty2, sum(fc.qty) AS qty3,0 AS qty4
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15') AND fc.C_Campaign_ID=1000062
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>='07-01-2019' AND fc.dateacct<='07-31-2019' 
	GROUP BY id
) AS k GROUP BY id
) AS k 
RIGHT JOIN HSV_Payrollcogviec tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '7'