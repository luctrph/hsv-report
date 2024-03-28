SELECT tp.description, tp.name, tp.hsv_dinhmuc, tp.value AS id, NULL::int4 AS qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM hsv_giathanhvan tp
WHERE "value" = '1' AND ad_client_id = $P{AD_CLIENT_ID}

UNION ALL
SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, NULL::int4 AS tt, NULL::int4  AS dg
FROM (
    SELECT '2' AS id, sum(fc.qty) AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID=1000062 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	
	) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '2'

UNION ALL
SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM (
    SELECT '3' AS id, sum(fc.qty) AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1015083 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '3'

UNION ALL
SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM (
    SELECT '4' AS id, sum(fc.qty) AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND M_Product_ID = 1015097 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '4'
UNION ALL
SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM (
    SELECT '5' AS id, sum(fc.qty) AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 318  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '5'
UNION ALL

SELECT tp.description, tp.name, tp.hsv_dinhmuc, tp.value AS id, NULL::int4 AS qty, NULL::int4 AS tt, NULL::int4 AS dg
FROM hsv_giathanhvan tp
WHERE "value" = '6' AND ad_client_id = $P{AD_CLIENT_ID}

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '7' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID=1000062 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '7' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.m_product_category_id IN (1000492,1000493)
	WHERE fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '7'
UNION ALL
---

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '8' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID=1000062 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '8' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 4) IN ('6213')
	WHERE fc.C_Activity_ID = 1000273  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '8'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '9' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND   ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '9' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000053
	WHERE fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '9'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '10' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND   ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '10' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000054
	WHERE fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '10'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '11' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND   ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '11' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000055
	WHERE fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '11'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '12' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND   ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '12' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000056
	WHERE fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '12'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '13' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND   ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '13' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000057
	WHERE fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '13'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '14' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID=1000062 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '14' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 4) IN ('6221')
	WHERE fc.C_Activity_ID = 1000273  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '14'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '15' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID=1000062 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '15' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 4) IN ('6223')
	WHERE fc.C_Activity_ID = 1000273  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '15'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '16' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID=1000062 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '16' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 4) IN ('6271')
	WHERE fc.C_Activity_ID = 1000273  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '16'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '17' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID=1000062 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '17' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 4) IN ('6272')
	WHERE fc.C_Activity_ID = 1000273  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '17'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '18' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND   ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '18' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000058
	WHERE fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '18'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '19' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND   ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '19' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000060
	WHERE fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '19'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '20' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND   ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '20' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000059
	WHERE fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '20'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '21' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID=1000062 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '21' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 4) IN ('6273')
	WHERE fc.C_Activity_ID = 1000273  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '21'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '22' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID=1000062 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '22' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 4) IN ('6274')
	WHERE fc.C_Activity_ID = 1000273  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '22'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '23' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID=1000062 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '23' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 4) IN ('6275')
	WHERE fc.C_Activity_ID = 1000273  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '23'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '24' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID=1000062 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '24' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 4) IN ('6276')
	WHERE fc.C_Activity_ID = 1000273  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '24'
UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '25' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND   ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '25' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000065
	WHERE fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '25'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '26' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND   ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '26' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000061
	WHERE fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '26'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '27' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND   ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '27' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000062
	WHERE fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '27'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt, CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '28' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND   ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '28' AS id, 0 AS qty, sum(fc.amtacctcr - fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_PartType_ID=1000063
	WHERE fc.C_Activity_ID = 1000273  AND ad_table_id = 321  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '28'
UNION ALL
SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '29' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID=1000062 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '29' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 4) IN ('6277')
	WHERE fc.C_Activity_ID = 1000273  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '29'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
    SELECT '30' AS id, sum(fc.qty) AS qty, 0 AS tt
	FROM fact_acct fc
	JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
	WHERE fc.C_Activity_ID = 1000273 AND fc.C_Campaign_ID=1000062 AND ad_table_id = 325 AND M_Product_ID = 1015088 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	
	UNION ALL
    SELECT '30' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 4) IN ('6278')
	WHERE fc.C_Activity_ID = 1000273  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '30'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
	SELECT '31' AS id, sum(fc.qty) AS qty, 0 AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '31' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 4) IN ('6411')
	WHERE fc.C_Activity_ID = 1000273  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '31'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
 SELECT '32' AS id, sum(fc.qty) AS qty, 0 AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '32' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 4) IN ('6417')
	WHERE fc.C_Activity_ID = 1000273  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '32'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
 SELECT '33' AS id, sum(fc.qty) AS qty, 0 AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '33' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr) AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 4) IN ('6418')
	WHERE fc.C_Activity_ID = 1000273  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '33'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
 SELECT '34' AS id, sum(fc.qty) AS qty, 0 AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '34' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr)/2 AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 4) IN ('6421')
	WHERE fc.C_Activity_ID = 1000273  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '34'

UNION ALL

SELECT tp.description, tp.name,  tp.hsv_dinhmuc, tp.value, k.qty, k.tt,  CASE WHEN k.qty<>0 THEN round(k.tt / k.qty,2) ELSE 0 END AS dg
FROM(
SELECT id, sum(qty) AS qty, sum(tt)AS tt 
FROM (
 SELECT '35' AS id, sum(fc.qty) AS qty, 0 AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 2) IN ('15')
    JOIN m_product hh ON fc.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000088
	WHERE fc.C_Activity_ID = 1000273 AND ad_table_id = 325 AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
UNION ALL
    SELECT '35' AS id, 0 AS qty, sum(-fc.amtacctcr + fc.amtacctdr)/2 AS "tt"
	FROM fact_acct fc
    JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 4) IN ('6428')
	WHERE fc.C_Activity_ID = 1000273  AND fc.dateacct>=$P{StartDate} AND fc.dateacct<=$P{EndDate} 
	GROUP BY id
	) AS k GROUP BY id) AS k
	RIGHT JOIN hsv_giathanhvan tp ON tp.value = k.id
WHERE ad_client_id = $P{AD_CLIENT_ID} AND tp.value = '35'