SELECT nhom,stt,id,a2,round(a3,2) AS a3,round(a4,2) AS a4,round(a5,2) AS a5,round(a6,2) AS a6,round(a7,2) AS a7,round(a8,2) AS a8,round(a9,2) AS a9 FROM(
SELECT 'I' AS nhom,'I' AS stt, '1' AS id, 'NGUYÊN LIỆU' AS a2,NULL::int4 AS a3,NULL::int4 AS a4,NULL::int4 AS a5,NULL::int4 AS a6,NULL::int4 AS a7,NULL::int4 AS a8, NULL::int4 AS a9
UNION ALL
SELECT 'I' AS nhom,stt,id, a2, a3, a4,a5,a6,a7,a8,a7+a8 - a5 AS a9 FROM
( 
SELECT '1' AS stt,id,'Ván Bóc tươi :  loại A' AS a2, sum(a3) AS a3,sum(a4) AS a4,sum(a5) AS a5,sum(a6) AS a6,sum(a7) AS a7,sum(a8) AS a8
FROM (
SELECT '2' AS "id", sum(inv.productionqty) AS a3, 0 AS a4, 0 AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM m_production iv
INNER JOIN m_productionplan inv ON iv.m_production_id = inv.m_production_id 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004077 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '2' AS "id",0 AS a3, sum(inv.movementqty) AS a4,0 AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM m_inout iv
INNER JOIN m_inoutline inv ON iv.m_inout_id = inv.m_inout_id  AND issotrx = 'N'
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND  inv.M_Product_ID=1004077 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '2' AS "id",0 AS a3, 0 AS a4, sum(CASE WHEN inv.qtybook < inv.qtycount THEN inv.qtycount-inv.qtybook ELSE 0 END) AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM M_Inventory iv 
INNER JOIN m_inventoryline inv ON iv.M_Inventory_id = inv.M_Inventory_id AND iv.c_doctype_id = 1000323 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004077 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '2' AS "id",0 AS a3, 0 AS a4, 0 AS a5,sum(inv.movementqty) AS a6, 0 AS a7, 0 AS a8 FROM m_inout iv
INNER JOIN m_inoutline inv ON iv.m_inout_id = inv.m_inout_id  AND issotrx = 'Y'
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND  inv.M_Product_ID=1004077 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL
SELECT '2' AS "id",0 AS a3, 0 AS a4, 0 AS a5, 0 AS a6, sum(inv.qtyinternaluse) AS a7, 0 AS a8 FROM m_inventory iv 
INNER JOIN m_inventoryline inv ON iv.m_inventory_id = inv.m_inventory_id AND  iv.c_doctype_id =1000326 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004077 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'
UNION ALL

SELECT '2' AS "id",0 AS a3, 0 AS a4, 0 AS a5, 0 AS a6,0 AS a7, sum(CASE WHEN inv.qtybook > inv.qtycount THEN inv.qtybook-inv.qtycount ELSE 0 END) AS a8
FROM M_Inventory iv 
INNER JOIN m_inventoryline inv ON iv.M_Inventory_id = inv.M_Inventory_id AND iv.c_doctype_id = 1000323 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004077 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'
) AS k GROUP BY id
UNION ALL
SELECT '2' AS stt,id,'Ván Bóc tươi :  loại B' AS a2, sum(a3) AS a3,sum(a4) AS a4,sum(a5) AS a5,sum(a6) AS a6,sum(a7) AS a7,sum(a8) AS a8
FROM (
SELECT '3' AS "id", sum(inv.productionqty) AS a3, 0 AS a4, 0 AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM m_production iv
INNER JOIN m_productionplan inv ON iv.m_production_id = inv.m_production_id 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004076 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '3' AS "id",0 AS a3, sum(inv.movementqty) AS a4,0 AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM m_inout iv
INNER JOIN m_inoutline inv ON iv.m_inout_id = inv.m_inout_id  AND issotrx = 'N'
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND  inv.M_Product_ID=1004076 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '3' AS "id",0 AS a3, 0 AS a4, sum(CASE WHEN inv.qtybook < inv.qtycount THEN inv.qtycount-inv.qtybook ELSE 0 END) AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM M_Inventory iv 
INNER JOIN m_inventoryline inv ON iv.M_Inventory_id = inv.M_Inventory_id AND iv.c_doctype_id = 1000323 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004076 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '3' AS "id",0 AS a3, 0 AS a4, 0 AS a5,sum(inv.movementqty) AS a6, 0 AS a7, 0 AS a8 FROM m_inout iv
INNER JOIN m_inoutline inv ON iv.m_inout_id = inv.m_inout_id  AND issotrx = 'Y'
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND  inv.M_Product_ID=1004076 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL
SELECT '3' AS "id",0 AS a3, 0 AS a4, 0 AS a5, 0 AS a6, sum(inv.qtyinternaluse) AS a7, 0 AS a8 FROM m_inventory iv 
INNER JOIN m_inventoryline inv ON iv.m_inventory_id = inv.m_inventory_id AND  iv.c_doctype_id =1000326 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004076 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'
UNION ALL

SELECT '3' AS "id",0 AS a3, 0 AS a4, 0 AS a5, 0 AS a6,0 AS a7, sum(CASE WHEN inv.qtybook > inv.qtycount THEN inv.qtybook-inv.qtycount ELSE 0 END) AS a8
FROM M_Inventory iv 
INNER JOIN m_inventoryline inv ON iv.M_Inventory_id = inv.M_Inventory_id AND iv.c_doctype_id = 1000323 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004076 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'
) AS k GROUP BY id
UNION ALL
SELECT '3' AS stt,id,'Ván Bóc tươi :  loại C' AS a2, sum(a3) AS a3,sum(a4) AS a4,sum(a5) AS a5,sum(a6) AS a6,sum(a7) AS a7,sum(a8) AS a8
FROM (
SELECT '4' AS "id", sum(inv.productionqty) AS a3, 0 AS a4, 0 AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM m_production iv
INNER JOIN m_productionplan inv ON iv.m_production_id = inv.m_production_id 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004079 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '4' AS "id",0 AS a3, sum(inv.movementqty) AS a4,0 AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM m_inout iv
INNER JOIN m_inoutline inv ON iv.m_inout_id = inv.m_inout_id  AND issotrx = 'N'
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND  inv.M_Product_ID=1004079 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '4' AS "id",0 AS a3, 0 AS a4, sum(CASE WHEN inv.qtybook < inv.qtycount THEN inv.qtycount-inv.qtybook ELSE 0 END) AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM M_Inventory iv 
INNER JOIN m_inventoryline inv ON iv.M_Inventory_id = inv.M_Inventory_id AND iv.c_doctype_id = 1000323 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004079 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '4' AS "id",0 AS a3, 0 AS a4, 0 AS a5,sum(inv.movementqty) AS a6, 0 AS a7, 0 AS a8 FROM m_inout iv
INNER JOIN m_inoutline inv ON iv.m_inout_id = inv.m_inout_id  AND issotrx = 'Y'
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND  inv.M_Product_ID=1004079 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL
SELECT '4' AS "id",0 AS a3, 0 AS a4, 0 AS a5, 0 AS a6, sum(inv.qtyinternaluse) AS a7, 0 AS a8 FROM m_inventory iv 
INNER JOIN m_inventoryline inv ON iv.m_inventory_id = inv.m_inventory_id AND  iv.c_doctype_id =1000326 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004079 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'
UNION ALL

SELECT '4' AS "id",0 AS a3, 0 AS a4, 0 AS a5, 0 AS a6,0 AS a7, sum(CASE WHEN inv.qtybook > inv.qtycount THEN inv.qtybook-inv.qtycount ELSE 0 END) AS a8
FROM M_Inventory iv 
INNER JOIN m_inventoryline inv ON iv.M_Inventory_id = inv.M_Inventory_id AND iv.c_doctype_id = 1000323 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004079 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'
) AS k GROUP BY id
) AS t
UNION ALL
SELECT 'I' AS nhom,stt,id, a2, a3, a4,a5,a6,a7,a8,(a7+a8) - (a5+a3) AS a9 FROM
( 
SELECT '4' AS stt,id,'Ván tươi  đang sấy dở' AS a2, sum(a3) AS a3,sum(a4) AS a4,sum(a5) AS a5,sum(a6) AS a6,sum(a7) AS a7,sum(a8) AS a8
FROM (
SELECT '5' AS "id", sum(inv.productionqty) AS a3, 0 AS a4, 0 AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM m_production iv
INNER JOIN m_productionplan inv ON iv.m_production_id = inv.m_production_id 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1013224 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '5' AS "id",0 AS a3, sum(inv.movementqty) AS a4,0 AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM m_inout iv
INNER JOIN m_inoutline inv ON iv.m_inout_id = inv.m_inout_id  AND issotrx = 'N'
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND  inv.M_Product_ID=1013224 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '5' AS "id",0 AS a3, 0 AS a4, sum(CASE WHEN inv.qtybook < inv.qtycount THEN inv.qtycount-inv.qtybook ELSE 0 END) AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM M_Inventory iv 
INNER JOIN m_inventoryline inv ON iv.M_Inventory_id = inv.M_Inventory_id AND iv.c_doctype_id = 1000323 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1013224 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '5' AS "id",0 AS a3, 0 AS a4, 0 AS a5,sum(inv.movementqty) AS a6, 0 AS a7, 0 AS a8 FROM m_inout iv
INNER JOIN m_inoutline inv ON iv.m_inout_id = inv.m_inout_id  AND issotrx = 'Y'
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND  inv.M_Product_ID=1013224 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL
SELECT '5' AS "id",0 AS a3, 0 AS a4, 0 AS a5, 0 AS a6, sum(inv.qtyinternaluse) AS a7, 0 AS a8 FROM m_inventory iv 
INNER JOIN m_inventoryline inv ON iv.m_inventory_id = inv.m_inventory_id AND  iv.c_doctype_id =1000326 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1013224 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'
UNION ALL

SELECT '5' AS "id",0 AS a3, 0 AS a4, 0 AS a5, 0 AS a6,0 AS a7, sum(CASE WHEN inv.qtybook > inv.qtycount THEN inv.qtybook-inv.qtycount ELSE 0 END) AS a8
FROM M_Inventory iv 
INNER JOIN m_inventoryline inv ON iv.M_Inventory_id = inv.M_Inventory_id AND iv.c_doctype_id = 1000323 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1013224 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'
) AS k GROUP BY id
) AS t
UNION ALL
SELECT 'II' AS nhom,'II' AS stt, '6' AS id, 'KẾT QUẢ SẤY, PHƠI' AS a2,NULL::int4 AS a3,NULL::int4 AS a4,NULL::int4 AS a5,NULL::int4 AS a6,NULL::int4 AS a7,NULL::int4 AS a8, NULL::int4 AS a9
UNION ALL
SELECT 'II' AS nhom,stt,id, a2, a3, a4,a5,a6,a7,a8,(a3+a5) - a8 AS a9 
FROM (
SELECT '1' AS stt,id,'Ván sấy,khô : loại A+' AS a2, sum(a3) AS a3,sum(a4) AS a4,sum(a5) AS a5,sum(a6) AS a6,sum(a7) AS a7,sum(a8) AS a8
FROM (
SELECT '7' AS "id", sum(inv.productionqty) AS a3, 0 AS a4, 0 AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM m_production iv
INNER JOIN m_productionplan inv ON iv.m_production_id = inv.m_production_id 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004073 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '7' AS "id",0 AS a3, sum(inv.movementqty) AS a4,0 AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM m_inout iv
INNER JOIN m_inoutline inv ON iv.m_inout_id = inv.m_inout_id  AND issotrx = 'N'
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND  inv.M_Product_ID=1004073 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '7' AS "id",0 AS a3, 0 AS a4, sum(CASE WHEN inv.qtybook < inv.qtycount THEN inv.qtycount-inv.qtybook ELSE 0 END) AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM M_Inventory iv 
INNER JOIN m_inventoryline inv ON iv.M_Inventory_id = inv.M_Inventory_id AND iv.c_doctype_id = 1000323 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004073 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '7' AS "id",0 AS a3, 0 AS a4, 0 AS a5,sum(inv.movementqty) AS a6, 0 AS a7, 0 AS a8 FROM m_inout iv
INNER JOIN m_inoutline inv ON iv.m_inout_id = inv.m_inout_id  AND issotrx = 'Y'
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND  inv.M_Product_ID=1004073 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL
SELECT '7' AS "id",0 AS a3, 0 AS a4, 0 AS a5, 0 AS a6, sum(inv.qtyinternaluse) AS a7, 0 AS a8 FROM m_inventory iv 
INNER JOIN m_inventoryline inv ON iv.m_inventory_id = inv.m_inventory_id AND  iv.c_doctype_id =1000326 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004073 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'
UNION ALL

SELECT '7' AS "id",0 AS a3, 0 AS a4, 0 AS a5, 0 AS a6,0 AS a7, sum(CASE WHEN inv.qtybook > inv.qtycount THEN inv.qtybook-inv.qtycount ELSE 0 END) AS a8
FROM M_Inventory iv 
INNER JOIN m_inventoryline inv ON iv.M_Inventory_id = inv.M_Inventory_id AND iv.c_doctype_id = 1000323 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004073 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'
) AS k GROUP BY id
UNION ALL
SELECT '2' AS stt,id,'Ván sấy,khô loại A' AS a2, sum(a3) AS a3,sum(a4) AS a4,sum(a5) AS a5,sum(a6) AS a6,sum(a7) AS a7,sum(a8) AS a8
FROM (
SELECT '8' AS "id", sum(inv.productionqty) AS a3, 0 AS a4, 0 AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM m_production iv
INNER JOIN m_productionplan inv ON iv.m_production_id = inv.m_production_id 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004071 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '8' AS "id",0 AS a3, sum(inv.movementqty) AS a4,0 AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM m_inout iv
INNER JOIN m_inoutline inv ON iv.m_inout_id = inv.m_inout_id  AND issotrx = 'N'
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND  inv.M_Product_ID=1004071 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '8' AS "id",0 AS a3, 0 AS a4, sum(CASE WHEN inv.qtybook < inv.qtycount THEN inv.qtycount-inv.qtybook ELSE 0 END) AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM M_Inventory iv 
INNER JOIN m_inventoryline inv ON iv.M_Inventory_id = inv.M_Inventory_id AND iv.c_doctype_id = 1000323 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004071 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '8' AS "id",0 AS a3, 0 AS a4, 0 AS a5,sum(inv.movementqty) AS a6, 0 AS a7, 0 AS a8 FROM m_inout iv
INNER JOIN m_inoutline inv ON iv.m_inout_id = inv.m_inout_id  AND issotrx = 'Y'
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND  inv.M_Product_ID=1004071 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL
SELECT '8' AS "id",0 AS a3, 0 AS a4, 0 AS a5, 0 AS a6, sum(inv.qtyinternaluse) AS a7, 0 AS a8 FROM m_inventory iv 
INNER JOIN m_inventoryline inv ON iv.m_inventory_id = inv.m_inventory_id AND  iv.c_doctype_id =1000326 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004071 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'
UNION ALL

SELECT '8' AS "id",0 AS a3, 0 AS a4, 0 AS a5, 0 AS a6,0 AS a7, sum(CASE WHEN inv.qtybook > inv.qtycount THEN inv.qtybook-inv.qtycount ELSE 0 END) AS a8
FROM M_Inventory iv 
INNER JOIN m_inventoryline inv ON iv.M_Inventory_id = inv.M_Inventory_id AND iv.c_doctype_id = 1000323 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004071 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'
) AS k GROUP BY id
UNION ALL
SELECT '3' AS stt,id,'Ván sấy,khô loại B' AS a2, sum(a3) AS a3,sum(a4) AS a4,sum(a5) AS a5,sum(a6) AS a6,sum(a7) AS a7,sum(a8) AS a8
FROM (
SELECT '9' AS "id", sum(inv.productionqty) AS a3, 0 AS a4, 0 AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM m_production iv
INNER JOIN m_productionplan inv ON iv.m_production_id = inv.m_production_id 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004072 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '9' AS "id",0 AS a3, sum(inv.movementqty) AS a4,0 AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM m_inout iv
INNER JOIN m_inoutline inv ON iv.m_inout_id = inv.m_inout_id  AND issotrx = 'N'
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND  inv.M_Product_ID=1004072 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '9' AS "id",0 AS a3, 0 AS a4, sum(CASE WHEN inv.qtybook < inv.qtycount THEN inv.qtycount-inv.qtybook ELSE 0 END) AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM M_Inventory iv 
INNER JOIN m_inventoryline inv ON iv.M_Inventory_id = inv.M_Inventory_id AND iv.c_doctype_id = 1000323 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004072 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '9' AS "id",0 AS a3, 0 AS a4, 0 AS a5,sum(inv.movementqty) AS a6, 0 AS a7, 0 AS a8 FROM m_inout iv
INNER JOIN m_inoutline inv ON iv.m_inout_id = inv.m_inout_id  AND issotrx = 'Y'
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND  inv.M_Product_ID=1004072 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL
SELECT '9' AS "id",0 AS a3, 0 AS a4, 0 AS a5, 0 AS a6, sum(inv.qtyinternaluse) AS a7, 0 AS a8 FROM m_inventory iv 
INNER JOIN m_inventoryline inv ON iv.m_inventory_id = inv.m_inventory_id AND  iv.c_doctype_id =1000326 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004072 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'
UNION ALL

SELECT '9' AS "id",0 AS a3, 0 AS a4, 0 AS a5, 0 AS a6,0 AS a7, sum(CASE WHEN inv.qtybook > inv.qtycount THEN inv.qtybook-inv.qtycount ELSE 0 END) AS a8
FROM M_Inventory iv 
INNER JOIN m_inventoryline inv ON iv.M_Inventory_id = inv.M_Inventory_id AND iv.c_doctype_id = 1000323 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004072 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'
) AS k GROUP BY id
UNION ALL
SELECT '4' AS stt,id,'Ván sấy,khô loại C' AS a2, sum(a3) AS a3,sum(a4) AS a4,sum(a5) AS a5,sum(a6) AS a6,sum(a7) AS a7,sum(a8) AS a8
FROM (
SELECT '10' AS "id", sum(inv.productionqty) AS a3, 0 AS a4, 0 AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM m_production iv
INNER JOIN m_productionplan inv ON iv.m_production_id = inv.m_production_id 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004070 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '10' AS "id",0 AS a3, sum(inv.movementqty) AS a4,0 AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM m_inout iv
INNER JOIN m_inoutline inv ON iv.m_inout_id = inv.m_inout_id  AND issotrx = 'N'
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND  inv.M_Product_ID=1004070 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '10' AS "id",0 AS a3, 0 AS a4, sum(CASE WHEN inv.qtybook < inv.qtycount THEN inv.qtycount-inv.qtybook ELSE 0 END) AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM M_Inventory iv 
INNER JOIN m_inventoryline inv ON iv.M_Inventory_id = inv.M_Inventory_id AND iv.c_doctype_id = 1000323 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004070 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '10' AS "id",0 AS a3, 0 AS a4, 0 AS a5,sum(inv.movementqty) AS a6, 0 AS a7, 0 AS a8 FROM m_inout iv
INNER JOIN m_inoutline inv ON iv.m_inout_id = inv.m_inout_id  AND issotrx = 'Y'
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND  inv.M_Product_ID=1004070 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL
SELECT '10' AS "id",0 AS a3, 0 AS a4, 0 AS a5, 0 AS a6, sum(inv.qtyinternaluse) AS a7, 0 AS a8 FROM m_inventory iv 
INNER JOIN m_inventoryline inv ON iv.m_inventory_id = inv.m_inventory_id AND  iv.c_doctype_id =1000326 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004070 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'
UNION ALL

SELECT '10' AS "id",0 AS a3, 0 AS a4, 0 AS a5, 0 AS a6,0 AS a7, sum(CASE WHEN inv.qtybook > inv.qtycount THEN inv.qtybook-inv.qtycount ELSE 0 END) AS a8
FROM M_Inventory iv 
INNER JOIN m_inventoryline inv ON iv.M_Inventory_id = inv.M_Inventory_id AND iv.c_doctype_id = 1000323 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1004070 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'
) AS k GROUP BY id) 
AS t
UNION ALL
SELECT 'II' AS nhom,stt,id, a2, a3, a4,a5,a6,a7,a8,(a3+a5)-(a7+a8) AS a9 FROM
( 
SELECT '5' AS stt,id,'Ván may , p loại, dở dang cuối kỳ' AS a2, sum(a3) AS a3,sum(a4) AS a4,sum(a5) AS a5,sum(a6) AS a6,sum(a7) AS a7,sum(a8) AS a8
FROM (
SELECT '11' AS "id", sum(inv.productionqty) AS a3, 0 AS a4, 0 AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM m_production iv
INNER JOIN m_productionplan inv ON iv.m_production_id = inv.m_production_id 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1013052 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '11' AS "id",0 AS a3, sum(inv.movementqty) AS a4,0 AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM m_inout iv
INNER JOIN m_inoutline inv ON iv.m_inout_id = inv.m_inout_id  AND issotrx = 'N'
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND  inv.M_Product_ID=1013052 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '11' AS "id",0 AS a3, 0 AS a4, sum(CASE WHEN inv.qtybook < inv.qtycount THEN inv.qtycount-inv.qtybook ELSE 0 END) AS a5, 0 AS a6, 0 AS a7, 0 AS a8 FROM M_Inventory iv 
INNER JOIN m_inventoryline inv ON iv.M_Inventory_id = inv.M_Inventory_id AND iv.c_doctype_id = 1000323 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1013052 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL

SELECT '11' AS "id",0 AS a3, 0 AS a4, 0 AS a5,sum(inv.movementqty) AS a6, 0 AS a7, 0 AS a8 FROM m_inout iv
INNER JOIN m_inoutline inv ON iv.m_inout_id = inv.m_inout_id  AND issotrx = 'Y'
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND  inv.M_Product_ID=1013052 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'

UNION ALL
SELECT '11' AS "id",0 AS a3, 0 AS a4, 0 AS a5, 0 AS a6, sum(inv.qtyinternaluse) AS a7, 0 AS a8 FROM m_inventory iv 
INNER JOIN m_inventoryline inv ON iv.m_inventory_id = inv.m_inventory_id AND  iv.c_doctype_id =1000326 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1013052 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'
UNION ALL

SELECT '11' AS "id",0 AS a3, 0 AS a4, 0 AS a5, 0 AS a6,0 AS a7, sum(CASE WHEN inv.qtybook > inv.qtycount THEN inv.qtybook-inv.qtycount ELSE 0 END) AS a8
FROM M_Inventory iv 
INNER JOIN m_inventoryline inv ON iv.M_Inventory_id = inv.M_Inventory_id AND iv.c_doctype_id = 1000323 
WHERE iv.ad_client_id=1000006 AND iv.docstatus IN ('CO','CL') AND (iv.AD_Org_ID=1000047 OR 1000047 IS NULL) AND inv.M_Product_ID=1013052 AND iv.movementdate >='01-01-2019' AND iv.movementdate<='02-28-2019'
) AS k GROUP BY id
) AS t
) AS t ORDER BY CAST("id" AS INTEGER) ASC