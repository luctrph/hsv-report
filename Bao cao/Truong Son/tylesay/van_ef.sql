SELECT a1,a2,round(a3,2) AS a3,round(a4,2) AS a4,round(a5,2) AS a5,round(a6,2) AS a6,round(a7,2) AS a7,round(a8,2) AS a8, round((a7+a8 - a5),2) AS a9 FROM (

SELECT 'I' AS a1,'Nguyên Liệu ván sấy' AS a2,NULL::int4 AS a3,NULL::int4 AS a4,NULL::int4 AS a5,NULL::int4 AS a6,NULL::int4 AS a7,NULL::int4 AS a8
UNION ALL
SELECT '1' AS stt,
        'Ván sấy  loại A +' AS a2, sum(t.a3) AS a3,sum(t.a4) AS a4,sum(t.a5) AS a5,sum(t.a6) AS a6,sum(t.a7) AS a7,sum(t.a8) AS a8
    FROM(
        SELECT
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
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
        WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  t.M_Product_ID=1004073 AND t.movementtype IN ('I+') AND t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' 
 ) AS t
 
 
UNION ALL

SELECT '2' AS stt,
        'Ván sấy Loại A' AS a2, sum(t.a3) AS a3,sum(t.a4) AS a4,sum(t.a5) AS a5,sum(t.a6) AS a6,sum(t.a7) AS a7,sum(t.a8) AS a8
    FROM(
        SELECT
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
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
        WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  t.M_Product_ID=1004071 AND t.movementtype IN ('I+') AND t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' 
 ) AS t


UNION ALL
SELECT '3' AS stt,
        'Ván sấy Loai B' AS a2, sum(t.a3) AS a3,sum(t.a4) AS a4,sum(t.a5) AS a5,sum(t.a6) AS a6,sum(t.a7) AS a7,sum(t.a8) AS a8
    FROM(
        SELECT
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8
    FROM m_transaction t WHERE t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  M_Product_ID=1004072
    UNION ALL
    SELECT 0 AS a3, 
           0 AS a4,
        sum(CASE WHEN i.qtybook > i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
        FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
        WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  t.M_Product_ID=1004072 AND t.movementtype IN ('I+') AND t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' 
 ) AS t 
UNION ALL
SELECT '4' AS a1, 'Ván sấy  Loại C' AS a2,sum(a3) AS a3,sum(a4) AS a4,sum(a5) AS a5,sum(a6) AS a6,sum(a7) AS a7,sum(a8) AS a8 
FROM (
    SELECT  sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8 
    FROM m_transaction t WHERE t.ad_client_id =1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND t.M_Product_ID = 1004070
    UNION ALL
    SELECT  
        0 AS a3,
        0 AS a4,
        sum(CASE WHEN i.qtybook > i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
    FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
    WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  t.M_Product_ID=1004070 AND t.movementtype IN ('I+') AND t.movementdate>='1-1-2019' AND t.movementdate<='01-31-2019' 
) AS t
UNION ALL
SELECT '5' AS a1,'Ván may , p loại dở dang cuối kỳ' AS a2, sum(a3) AS a3,sum(a4) AS a4,sum(a5) AS a5,sum(a6) AS a6,sum(a7) AS a7,sum(a8) AS a8 
FROM (
    SELECT  sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8 
    FROM m_transaction t WHERE t.ad_client_id =1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND t.M_Product_ID = 1013052
    UNION ALL
    SELECT  
        0 AS a3,
        0 AS a4,
        sum(CASE WHEN i.qtybook > i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
    FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
    WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND  t.M_Product_ID=1013052 AND t.movementtype IN ('I+') AND t.movementdate>='1-1-2019' AND t.movementdate<='01-31-2019' 
) AS t
) AS t
UNION ALL
SELECT a1,a2,round(a3,2) AS a3,round(a4,2) AS a4,round(a5,2) AS a5,round(a6,2) as6,round(a7,2) AS a7,round(a8,2) AS a8,round(((t.a3+t.a5) -(t.a7+t.a8)),2) AS a9 FROM (

SELECT 'II' AS a1,'Thành phẩm' AS a2,NULL::int4 AS a3,NULL::int4 AS a4,NULL::int4 AS a5,NULL::int4 AS a6,NULL::int4 AS a7,NULL::int4 AS a8
UNION ALL
SELECT '1' AS a1, 'Ván cốt thiếu' AS a2,sum(a3) AS a3,sum(a4) AS a4,sum(a5) AS a5,sum(a6) AS a6,sum(a7) AS a7,sum(a8) AS a8 
FROM (
    SELECT  sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8 
    FROM m_transaction t JOIN m_product hh ON t.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000080  WHERE t.ad_client_id =1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL    ) 
    UNION ALL
    SELECT  
        0 AS a3,
        0 AS a4,
        sum(CASE WHEN i.qtybook > i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
    FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
    JOIN m_product hh ON t.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000080
    WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND t.movementtype IN ('I+') AND t.movementdate>='1-1-2019' AND t.movementdate<='01-31-2019' 
) AS t
UNION ALL
SELECT '2' AS a1, 'Ván cốt đủ' AS a2,sum(a3) AS a3,sum(a4) AS a4,sum(a5) AS a5,sum(a6) AS a6,sum(a7) AS a7,sum(a8) AS a8 
FROM (
    SELECT  sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8 
    FROM m_transaction t JOIN m_product hh ON t.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000070  WHERE t.ad_client_id =1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL    ) 
    UNION ALL
    SELECT  
        0 AS a3,
        0 AS a4,
        sum(CASE WHEN i.qtybook > i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
    FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
    JOIN m_product hh ON t.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000070
    WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND t.movementtype IN ('I+') AND t.movementdate>='1-1-2019' AND t.movementdate<='01-31-2019' 
) AS t
UNION ALL
SELECT '3' AS a1, 'Ván thành phẩm DH' AS a2,sum(a3) AS a3,sum(a4) AS a4,sum(a5) AS a5,sum(a6) AS a6,sum(a7) AS a7,sum(a8) AS a8 
FROM (
    SELECT  sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8 
    FROM m_transaction t JOIN m_product hh ON t.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000064  WHERE t.ad_client_id =1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL    ) 
    UNION ALL
    SELECT  
        0 AS a3,
        0 AS a4,
        sum(CASE WHEN i.qtybook > i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
    FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
    JOIN m_product hh ON t.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000064
    WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND t.movementtype IN ('I+') AND t.movementdate>='1-1-2019' AND t.movementdate<='01-31-2019' 
) AS t
UNION ALL
SELECT '4' AS a1, 'Ván bị lỗi thanh lý' AS a2,sum(a3) AS a3,sum(a4) AS a4,sum(a5) AS a5,sum(a6) AS a6,sum(a7) AS a7,sum(a8) AS a8 
FROM (
    SELECT  sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8 
    FROM m_transaction t JOIN m_product hh ON t.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000081  WHERE t.ad_client_id =1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL    ) 
    UNION ALL
    SELECT  
        0 AS a3,
        0 AS a4,
        sum(CASE WHEN i.qtybook > i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
    FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
    JOIN m_product hh ON t.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000081
    WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND t.movementtype IN ('I+') AND t.movementdate>='1-1-2019' AND t.movementdate<='01-31-2019' 
) AS t
UNION ALL
SELECT '5' AS a1, 'ván dở dang tồn kho' AS a2,sum(a3) AS a3,sum(a4) AS a4,sum(a5) AS a5,sum(a6) AS a6,sum(a7) AS a7,sum(a8) AS a8 
FROM (
    SELECT  sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>='1-1-2019' AND t.movementdate<='12-31-2019' AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8 
    FROM m_transaction t JOIN m_product hh ON t.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000083  WHERE t.ad_client_id =1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL    ) 
    UNION ALL
    SELECT  
        0 AS a3,
        0 AS a4,
        sum(CASE WHEN i.qtybook > i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
    FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
    JOIN m_product hh ON t.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID=1000083
    WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = 1000047 OR 1000047 IS NULL) AND t.movementtype IN ('I+') AND t.movementdate>='1-1-2019' AND t.movementdate<='01-31-2019' 
) AS t

) AS t