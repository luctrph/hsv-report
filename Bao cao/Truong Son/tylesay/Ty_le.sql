SELECT  CASE WHEN sum(a10)<>0 THEN  sum(t.a9)/sum(t.a10) ELSE 0 END  AS a10  FROM (
SELECT ((t.a7+t.a8) - t.a5) AS a9, 0 AS a10
FROM
(
SELECT 'I' AS tt, 'Nguyên Liệu' AS a2 , NULL::int4 AS a3,NULL::int4 AS a4,NULL::int4 AS a5,NULL::int4 AS a6,NULL::int4 AS a7,NULL::int4 AS a8
UNION ALL
SELECT '1' AS stt,
        'Ván Bóc tươi :  loại A' AS a2, sum(t.a3) AS a3,sum(t.a4) AS a4,sum(t.a5) AS a5,sum(t.a6) AS a6,sum(t.a7) AS a7,sum(t.a8) AS a8
    FROM(
        SELECT
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8
    FROM m_transaction t WHERE t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  M_Product_ID=1004077
    UNION ALL
    SELECT 0 AS a3, 
           0 AS a4,
        sum(CASE WHEN i.qtybook > i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
        FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
        WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  t.M_Product_ID=1004077 AND t.movementtype IN ('I+') AND t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' 
 ) AS t
UNION ALL
SELECT '2' AS stt,
        'Ván Bóc tươi : loại  B' AS a2, sum(t.a3) AS a3,sum(t.a4) AS a4,sum(t.a5) AS a5,sum(t.a6) AS a6,sum(t.a7) AS a7,sum(t.a8) AS a8
    FROM(
        SELECT
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8
    FROM m_transaction t WHERE t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  M_Product_ID=1004076
    UNION ALL
    SELECT 0 AS a3, 
           0 AS a4,
        sum(CASE WHEN i.qtybook > i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
        FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
        WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  t.M_Product_ID=1004076 AND t.movementtype IN ('I+') AND t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' 
 ) AS t
 
UNION ALL
SELECT '3' AS stt,
        'Ván Bóc tươi : loại  C' AS a2, sum(t.a3) AS a3,sum(t.a4) AS a4,sum(t.a5) AS a5,sum(t.a6) AS a6,sum(t.a7) AS a7,sum(t.a8) AS a8
    FROM(
        SELECT
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8
    FROM m_transaction t WHERE t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  M_Product_ID=1004079
    UNION ALL
    SELECT 0 AS a3, 
           0 AS a4,
        sum(CASE WHEN i.qtybook > i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
        FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
        WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  t.M_Product_ID=1004079 AND t.movementtype IN ('I+') AND t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' 
 ) AS t 
UNION ALL
SELECT '4' AS stt,
        'Ván tươi  đang sấy dở' AS a2, sum(t.a3) AS a3,sum(t.a4) AS a4,sum(t.a5) AS a5,sum(t.a6) AS a6,sum(t.a7) AS a7,sum(t.a8) AS a8
    FROM(
        SELECT
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8
    FROM m_transaction t WHERE t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  M_Product_ID=1013224
    UNION ALL
    SELECT 0 AS a3, 
           0 AS a4,
        sum(CASE WHEN i.qtybook > i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
        FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
        WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  t.M_Product_ID=1013224 AND t.movementtype IN ('I+') AND t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' 
 ) AS t 
 ) AS t
 ----
UNION ALL
SELECT 0 AS a9, (t.a3+t.a5) - t.a8 AS a10 
FROM
(
SELECT 'II' AS tt, 'Nguyên Liệu' AS a2 , NULL::int4 AS a3,NULL::int4 AS a4,NULL::int4 AS a5,NULL::int4 AS a6,NULL::int4 AS a7,NULL::int4 AS a8
UNION ALL
SELECT '1' AS stt,
        'Ván sấy,khô : loại A+' AS a2, sum(t.a3) AS a3,sum(t.a4) AS a4,sum(t.a5) AS a5,sum(t.a6) AS a6,sum(t.a7) AS a7,sum(t.a8) AS a8
    FROM(
        SELECT
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8
    FROM m_transaction t WHERE t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  M_Product_ID=1004073
    UNION ALL
    SELECT 0 AS a3, 
           0 AS a4,
        sum(CASE WHEN i.qtybook > i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
        FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
        WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  t.M_Product_ID=1004073 AND t.movementtype IN ('I+') AND t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' 
 ) AS t
UNION ALL
SELECT '2' AS stt,
        'Ván sấy,khô Loại A' AS a2, sum(t.a3) AS a3,sum(t.a4) AS a4,sum(t.a5) AS a5,sum(t.a6) AS a6,sum(t.a7) AS a7,sum(t.a8) AS a8
    FROM(
        SELECT
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8
    FROM m_transaction t WHERE t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  M_Product_ID=1004071
    UNION ALL
    SELECT 0 AS a3, 
           0 AS a4,
        sum(CASE WHEN i.qtybook > i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
        FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
        WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  t.M_Product_ID=1004071 AND t.movementtype IN ('I+') AND t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' 
 ) AS t
 
UNION ALL
SELECT '3' AS stt,
        'Ván sấy, khô Loai B' AS a2, sum(t.a3) AS a3,sum(t.a4) AS a4,sum(t.a5) AS a5,sum(t.a6) AS a6,sum(t.a7) AS a7,sum(t.a8) AS a8
    FROM(
        SELECT
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8
    FROM m_transaction t WHERE t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  M_Product_ID=1004072
    UNION ALL
    SELECT 0 AS a3, 
           0 AS a4,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
        FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
        WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  t.M_Product_ID=1004072 AND t.movementtype IN ('I+') AND t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' 
 ) AS t 
UNION ALL
SELECT '4' AS stt,
        'Ván sấy, khô  Loại C' AS a2, sum(t.a3) AS a3,sum(t.a4) AS a4,sum(t.a5) AS a5,sum(t.a6) AS a6,sum(t.a7) AS a7,sum(t.a8) AS a8
    FROM(
        SELECT
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8
    FROM m_transaction t WHERE t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  M_Product_ID=1004070
    UNION ALL
    SELECT 0 AS a3, 
           0 AS a4,
        sum(CASE WHEN i.qtybook > i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
        FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
        WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  t.M_Product_ID=1004070 AND t.movementtype IN ('I+') AND t.movementdate>='01-01-2019' AND t.movementdate<='01-31-2019' 
 ) AS t 
 ) AS t
 ) AS t
 