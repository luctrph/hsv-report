SELECT CASE WHEN (sum(c2)+sum(c3)) <>0 THEN round( sum(c1) / (sum(c2)+sum(c3)),2) ELSE 0 END  AS a10 FROM (
SELECT (t.a7+t.a8) - t.a5 AS c1,0 AS c2, 0 AS c3 FROM(
 SELECT  sum(t.a3) AS a3,sum(t.a4) AS a4,sum(t.a5) AS a5,sum(t.a6) AS a6,sum(t.a7) AS a7,sum(t.a8) AS a8
    FROM(
        SELECT
            sum(CASE WHEN t.movementdate>=$P{StartDate} AND t.movementdate<=$P{EndDate} AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>=$P{StartDate} AND t.movementdate<=$P{EndDate} AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>=$P{StartDate} AND t.movementdate<=$P{EndDate} AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>=$P{StartDate} AND t.movementdate<=$P{EndDate} AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8
    FROM m_transaction t WHERE t.ad_client_id = 1000006 AND (t.ad_org_id = $P{AD_Org_ID} OR $P{AD_Org_ID} IS NULL) AND  M_Product_ID=1004077
    UNION ALL
    SELECT 0 AS a3, 
           0 AS a4,
        sum(CASE WHEN i.qtybook > i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
        FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
        WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = $P{AD_Org_ID} OR $P{AD_Org_ID} IS NULL) AND  t.M_Product_ID=1004077 AND t.movementtype IN ('I+') AND t.movementdate>=$P{StartDate} AND t.movementdate<=$P{EndDate} 
 ) AS t
 ) AS t
UNION ALL
 SELECT 0 AS c1,(t.a3+t.a5) - t.a8 AS c2,0 AS c3  FROM(
SELECT  sum(t.a3) AS a3,sum(t.a4) AS a4,sum(t.a5) AS a5,sum(t.a6) AS a6,sum(t.a7) AS a7,sum(t.a8) AS a8
    FROM(
        SELECT
            sum(CASE WHEN t.movementdate>=$P{StartDate} AND t.movementdate<=$P{EndDate} AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>=$P{StartDate} AND t.movementdate<=$P{EndDate} AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>=$P{StartDate} AND t.movementdate<=$P{EndDate} AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>=$P{StartDate} AND t.movementdate<=$P{EndDate} AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8
    FROM m_transaction t WHERE t.ad_client_id = 1000006 AND (t.ad_org_id = $P{AD_Org_ID} OR $P{AD_Org_ID} IS NULL) AND  M_Product_ID=1004073
    UNION ALL
    SELECT 0 AS a3, 
           0 AS a4,
        sum(CASE WHEN i.qtybook > i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
        FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
        WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = $P{AD_Org_ID} OR $P{AD_Org_ID} IS NULL) AND  t.M_Product_ID=1004073 AND t.movementtype IN ('I+') AND t.movementdate>=$P{StartDate} AND t.movementdate<=$P{EndDate} 
 ) AS t
 ) AS t
 UNION ALL
 SELECT 0 AS c1,0 AS c2,(t.a3+t.a5) - t.a8 AS c3  FROM(
 SELECT  sum(t.a3) AS a3,sum(t.a4) AS a4,sum(t.a5) AS a5,sum(t.a6) AS a6,sum(t.a7) AS a7,sum(t.a8) AS a8
    FROM(
        SELECT
            sum(CASE WHEN t.movementdate>=$P{StartDate} AND t.movementdate<=$P{EndDate} AND t.movementtype IN ('P+') THEN t.movementqty ELSE 0 END) AS a3,
            sum(CASE WHEN t.movementdate>=$P{StartDate} AND t.movementdate<=$P{EndDate} AND t.movementtype IN ('V+') THEN t.movementqty ELSE 0 END) AS a4,
            0 AS a5,
            sum(CASE WHEN t.movementdate>=$P{StartDate} AND t.movementdate<=$P{EndDate} AND t.movementtype IN ('C-') THEN -1*t.movementqty ELSE 0 END) AS a6,
            sum(CASE WHEN t.movementdate>=$P{StartDate} AND t.movementdate<=$P{EndDate} AND t.movementtype IN ('I-') THEN -1*t.movementqty ELSE 0 END) AS a7,
            0 AS a8
    FROM m_transaction t WHERE t.ad_client_id = 1000006 AND (t.ad_org_id = $P{AD_Org_ID} OR $P{AD_Org_ID} IS NULL) AND  M_Product_ID=1004071
    UNION ALL
    SELECT 0 AS a3, 
           0 AS a4,
        sum(CASE WHEN i.qtybook > i.qtycount THEN i.qtybook-i.qtycount ELSE 0 END) AS a5,
        0 AS a6,
        0 AS a7,
        sum(CASE WHEN i.qtybook < i.qtycount THEN i.qtycount-i.qtybook ELSE 0 END) AS a8
        FROM m_transaction t JOIN m_inventoryline i ON t.m_inventoryline_id = i.m_inventoryline_id 
        WHERE  t.ad_client_id = 1000006 AND (t.ad_org_id = $P{AD_Org_ID} OR $P{AD_Org_ID} IS NULL) AND  t.M_Product_ID=1004071 AND t.movementtype IN ('I+') AND t.movementdate>=$P{StartDate} AND t.movementdate<=$P{EndDate} 
 ) AS t

) AS t
) AS t