SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
SELECT '22' AS id,  sum(qty) AS qty, sum(qty1) AS qty1
FROM(
SELECT CASE WHEN sum(qty)<> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty, 0 AS qty1
FROM (
	SELECT 0 AS qty, sum(t.amtacctdr - t.amtacctcr) AS tt
	FROM (
		SELECT  fc.amtacctdr, fc.amtacctcr, fc.account_id
		FROM Fact_Acct fc
		WHERE fc.dateacct <= '07-31-2019' AND fc.dateacct >= '07-01-2019' AND fc.AD_Client_ID IN ('1000003') AND fc.ad_table_id <> 224 AND fc.ad_org_id = 1000049
		
		UNION ALL
		
		SELECT  fc.amtacctdr, fc.amtacctcr, fc.account_id
		FROM Fact_Acct fc
		JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
		JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
		WHERE fc.dateacct <= '07-31-2019' AND fc.dateacct >= '07-01-2019' AND fc.AD_Client_ID IN ('1000003') AND fc.ad_table_id = 224 AND fc.ad_org_id = 1000049
		
		UNION ALL
		
		SELECT  fc.amtacctdr, fc.amtacctcr, fc.account_id
		FROM Fact_Acct fc
		JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
		WHERE fc.dateacct <= '07-31-2019' AND fc.dateacct >= '07-01-2019' AND fc.ad_table_id = 224 AND fc.AD_Client_ID IN ('1000003') AND fc.ad_org_id = 1000049 AND fc.line_id IS NULL
		) AS t
	INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID IN ('1000003') AND (LEFT(tk.value, 3) IN ('622', '627', '642', '641') OR LEFT(tk.value, 4) IN ('6211'))
	
	UNION ALL
	
	SELECT sum(civ.productionqty) AS qty, 0 AS tt
	FROM m_production ci
	JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_ID = 1000017
	WHERE ci.docstatus IN ('CO', 'CL') AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019' AND ci.ad_client_id = 1000003 AND ci.ad_org_id = 1000049
	) AS k
UNION ALL
SELECT 0 AS qty,CASE WHEN sum(qty)<> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty1
FROM (
	SELECT 0 AS qty, sum(t.amtacctdr - t.amtacctcr) AS tt
	FROM (
		SELECT  fc.amtacctdr, fc.amtacctcr, fc.account_id
		FROM Fact_Acct fc
		WHERE fc.dateacct <= '07-31-2019' AND fc.dateacct >= '01-01-2019' AND fc.AD_Client_ID IN ('1000003') AND fc.ad_table_id <> 224 AND fc.ad_org_id = 1000049
		
		UNION ALL
		
		SELECT  fc.amtacctdr, fc.amtacctcr, fc.account_id
		FROM Fact_Acct fc
		JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND fc.line_id = gl.gl_journalline_id AND fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
		JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
		WHERE fc.dateacct <= '07-31-2019' AND fc.dateacct >= '01-01-2019' AND fc.AD_Client_ID IN ('1000003') AND fc.ad_table_id = 224 AND fc.ad_org_id = 1000049
		
		UNION ALL
		
		SELECT  fc.amtacctdr, fc.amtacctcr, fc.account_id
		FROM Fact_Acct fc
		JOIN gl_journal a ON a.gl_journal_id = fc.record_id AND a.docstatus IN ('CO', 'CL')
		WHERE fc.dateacct <= '07-31-2019' AND fc.dateacct >= '01-01-2019' AND fc.ad_table_id = 224 AND fc.AD_Client_ID IN ('1000003') AND fc.ad_org_id = 1000049 AND fc.line_id IS NULL
		) AS t
	INNER JOIN c_elementvalue tk ON t.account_id = tk.c_elementvalue_id AND tk.AD_Client_ID IN ('1000003') AND (LEFT(tk.value, 3) IN ('622', '627', '642', '641') OR LEFT(tk.value, 4) IN ('6211'))
	
	UNION ALL
	
	SELECT sum(civ.productionqty) AS qty, 0 AS tt
	FROM m_production ci
	JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
	JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_Product_ID = 1000017
	WHERE ci.docstatus IN ('CO', 'CL') AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019' AND ci.ad_client_id = 1000003 AND ci.ad_org_id = 1000049
	) AS k
) AS k
) AS k 
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '22'
