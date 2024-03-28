SELECT tp.description, tp.name, NULL::int4 AS hsv_dinhmuc1, tp.value AS id, NULL::int4 AS qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM hsv_thanhpham tp
WHERE "value" = '1' AND ad_client_id = 1000019

UNION ALL

SELECT tp.description, tp.name,  NULL::int4 AS hsv_dinhmuc1, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM (
	SELECT '2' AS id, - 1 * sum(fc.qty) AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND M_Product_ID = 1015083 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='12-31-2019'  AND fc.C_Campaign_ID=1000060 
	GROUP BY id
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '2'

UNION ALL

SELECT tp.description, tp.name,  NULL::int4 AS hsv_dinhmuc1, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM (
	SELECT '3' AS id, - 1 * sum(fc.qty) AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492,1000493) AND fc.C_Campaign_ID=1000060 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019' 
	WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321
	GROUP BY id
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '3'

UNION ALL

SELECT k.value, k.name, k.dinhmuc1, k.id, k.qty, k.tt, CASE WHEN k.qty <> 0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM (
	SELECT CONCAT('2',CAST(ROW_NUMBER() OVER() AS VARCHAR)) AS "value", hh.name, 0 AS dinhmuc1, '100' AS id, - 1 * sum(fc.qty) AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492,1000493) AND fc.C_Campaign_ID=1000060 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
	WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321
	GROUP BY hh.name
	) AS k

UNION ALL

SELECT tp.description, tp.name,  NULL::int4 AS hsv_dinhmuc1, "value" AS id, NULL::int4 AS qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM hsv_thanhpham tp
WHERE "value" = '4' AND ad_client_id = 1000019

UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, "value" AS id, NULL::int4 AS qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM hsv_thanhpham tp
WHERE "value" = '5' AND ad_client_id = 1000019

UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, k.qty, NULL::int4 AS tt,NULL::int4 AS dg
FROM (
	SELECT '6' AS id, sum(fc.qty) AS qty, sum(- fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000272 AND fc.ad_table_id = 325 AND fc.M_Product_ID = 1015086 AND fc.C_Campaign_ID = 1000060 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
	GROUP BY id
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '6'

UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, k.qty, NULL::int4 AS tt,NULL::int4 AS dg
FROM (
	SELECT '7' AS id, sum(fc.qty) AS qty, sum(- fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000272 AND fc.ad_table_id = 325 AND fc.M_Product_ID = 1015087 AND fc.C_Campaign_ID = 1000060 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
	GROUP BY id
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '7'

UNION ALL

SELECT tp.description, tp.name, NULL::int4 AS hsv_dinhmuc1, tp.value AS id, NULL::int4 AS qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM hsv_thanhpham tp
WHERE "value" = '8' AND ad_client_id = 1000019


UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, k.qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM (
	SELECT id,  CASE WHEN sum(k.a2) <>0 THEN round(sum(k.a1) / sum(k.a2),2) ELSE 0 END AS qty
	FROM (
		SELECT id, sum(k.qty) AS a1, 0 AS a2
		FROM (
			SELECT '9' AS id, - 1 * sum(fc.qty) AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND M_Product_ID = 1015083 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
			GROUP BY id
			
			UNION ALL
			
			SELECT '9' AS id, - 1 * sum(fc.qty) AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492,1000493) AND fc.C_Campaign_ID=1000060
			WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
			GROUP BY id
			) AS k
		GROUP BY id
		
		UNION ALL
		
		SELECT id, 0 AS a1, sum(k.qty) AS a2
		FROM (
			SELECT '9' AS id, sum(fc.qty) AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000272 AND fc.ad_table_id = 325 AND fc.M_Product_ID = 1015086 AND fc.C_Campaign_ID = 1000060 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
			GROUP BY id
			
			UNION ALL
			
			SELECT '9' AS id, sum(fc.qty) AS qty
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000272 AND fc.ad_table_id = 325 AND fc.M_Product_ID = 1015087 AND fc.C_Campaign_ID = 1000060 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
			GROUP BY id
			) AS k
		GROUP BY id
		) AS k
	GROUP BY id
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '9'


UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, k.qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM (
	SELECT k.id, CASE WHEN sum(k.a7)<>0 THEN round(sum(k.a3) / sum(k.a7),2) ELSE 0 END AS qty
	FROM (
		SELECT '10' AS id, - 1 * sum(fc.qty) AS a3, 0 AS a7
		FROM fact_acct fc
		JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
		JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492,1000493) AND fc.C_Campaign_ID=1000060 
		WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
		GROUP BY id
		
		UNION ALL
		
		SELECT '10' AS id, 0 AS a3, sum(fc.qty) AS a7
		FROM fact_acct fc
		JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
		WHERE fc.C_Activity_ID = 1000272 AND fc.ad_table_id = 325 AND fc.M_Product_ID = 1015087 AND fc.C_Campaign_ID = 1000060 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
		GROUP BY id
		) AS k
	GROUP BY id
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '10'

UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, k.qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM (
	SELECT id, CASE WHEN sum(k.a6) <>0 THEN round(sum(k.a2) / sum(k.a6),2) ELSE 0 END AS qty
	FROM (
		SELECT '11' AS id, - 1 * sum(fc.qty) AS a2, 0 AS a6
		FROM fact_acct fc
		JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
		WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND M_Product_ID = 1015083 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
		GROUP BY id
		
		UNION ALL
		
		SELECT '11' AS id, 0 AS a2, sum(fc.qty) AS a6
		FROM fact_acct fc  

		JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
		WHERE fc.C_Activity_ID = 1000272 AND fc.ad_table_id = 325 AND fc.M_Product_ID = 1015086 AND fc.C_Campaign_ID = 1000060 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
		GROUP BY id
		) AS k
	GROUP BY id
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '11'

UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, NULL::int4 AS qty, k.tt AS tt, NULL::int4 AS dg
FROM (
	SELECT id,CASE WHEN sum(k.t67)<>0 THEN round(sum(k.t23) / sum(k.t67),2) ELSE 0 END AS tt
	FROM (
		SELECT '12' AS id, sum(k.t23) AS t23, 0 AS t67
		FROM (
			SELECT '23' AS id, sum(fc.amtacctcr - fc.amtacctdr) AS t23
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND M_Product_ID = 1015083 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
			GROUP BY id
			
			UNION ALL
			
			SELECT '23' AS id, sum(fc.amtacctcr - fc.amtacctdr) AS t23
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492,1000493) AND fc.C_Campaign_ID=1000060
			WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
			GROUP BY id
			) AS k
		GROUP BY id
		
		UNION ALL
		
		SELECT '12' AS id, 0 AS t23, sum(k.t67) AS t67
		FROM (
			SELECT '67' AS id, sum(fc.qty) AS "t67"
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000272 AND fc.ad_table_id = 325 AND fc.M_Product_ID = 1015086 AND fc.C_Campaign_ID = 1000060 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
			GROUP BY id
			
			UNION ALL
			
			SELECT '67' AS id, sum(fc.qty)  AS "t67"
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
			WHERE fc.C_Activity_ID = 1000272 AND fc.ad_table_id = 325 AND fc.M_Product_ID = 1015087 AND fc.C_Campaign_ID = 1000060 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
			GROUP BY id
			) AS k
		GROUP BY k.id
		) AS k
	GROUP BY k.id
	) AS k
RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '12'
UNION ALL
SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, NULL::int4 AS qty, k.tt AS tt, NULL::int4 AS dg
FROM (
SELECT '13' AS id , CASE WHEN sum(t7)<>0 THEN round(sum(t3)/sum(t7),2) ELSE 0 END AS tt
FROM(
	SELECT '13' AS id,  sum(fc.amtacctcr - fc.amtacctdr) AS "t3", 0 AS "t7"
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_Product_Category_ID IN (1000492,1000493) AND fc.C_Campaign_ID=1000060
	WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
	GROUP BY id
	UNION ALL
	SELECT '13' AS id ,0 AS "t3", sum(fc.qty) AS "t7"
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000272 AND fc.ad_table_id = 325 AND fc.M_Product_ID = 1015087 AND fc.C_Campaign_ID = 1000060 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
	GROUP BY id
	) AS k
	) AS k
	RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '13'
UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc1, tp.value, NULL::int4 AS qty, k.tt AS tt, NULL::int4 AS dg
FROM (
SELECT id, CASE WHEN sum(t6) <>0 THEN round(sum(t2)/sum(t6),2) ELSE 0 END AS tt FROM(
	SELECT '14' AS id, sum(fc.amtacctcr - fc.amtacctdr) AS "t2", 0 AS t6
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000272 AND ad_table_id = 321 AND M_Product_ID = 1015083 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
	GROUP BY id
	UNION ALL
	SELECT '14' AS id, 0 AS t2, sum(fc.qty) AS t6
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000272 AND fc.ad_table_id = 325 AND fc.M_Product_ID = 1015086 AND fc.C_Campaign_ID = 1000060 AND fc.dateacct>='1-1-2019' AND fc.dateacct<='3-31-2019'
	GROUP BY id
	)AS k GROUP BY id 
	)AS k RIGHT JOIN hsv_thanhpham tp ON tp.value = k.id
WHERE ad_client_id = 1000019 AND tp.value = '14'