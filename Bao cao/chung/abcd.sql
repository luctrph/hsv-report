SELECT hm.value AS id, hm.description AS stt, NAME, hm.hsv_dinhmuc, k.qty AS a1, k.qty1 AS a2
FROM (
	SELECT '11' AS id, sum(qty) AS qty, sum(qty1) AS qty1
	FROM (
		SELECT CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty, 0 AS qty1
		FROM (
			SELECT sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000088
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id = 1000062 AND ci.movementdate >= '07-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty, sum(fc.amtacctdr - fc.amtacctcr) AS "tt"
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 3) IN ('622', '627')
			JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND Fc.line_id = gl.gl_journalline_id AND Fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND fc.dateacct >= '07-01-2019' AND fc.dateacct <= '07-31-2019'
			) AS k
		
		UNION ALL
		
		SELECT 0 AS qty, CASE WHEN sum(qty) <> 0 THEN sum(tt) / sum(qty) ELSE 0 END AS qty1
		FROM (
			SELECT sum(civ.productionqty) AS qty, 0 AS tt
			FROM m_production ci
			JOIN m_productionplan civ ON ci.m_production_id = civ.m_production_id
			JOIN m_product hh ON civ.m_product_id = hh.m_product_id AND hh.M_AttributeSet_ID = 1000088
			WHERE ci.docstatus IN ('CO', 'CL') AND ci.c_activity_id = 1000273 AND ci.c_campaign_id = 1000062 AND ci.movementdate >= '01-01-2019' AND ci.movementdate <= '07-31-2019'
			
			UNION ALL
			
			SELECT 0 AS qty, sum(fc.amtacctdr - fc.amtacctcr) AS "tt"
			FROM fact_acct fc
			JOIN c_elementvalue acct ON fc.account_id = acct.c_elementvalue_id AND LEFT(acct.value, 3) IN ('622', '627')
			JOIN gl_journalline gl ON fc.record_id = gl.gl_journal_id AND Fc.line_id = gl.gl_journalline_id AND Fc.Account_ID = gl.Account_ID AND gl.IsGenerated = 'N'
			WHERE fc.ad_client_id = 1000019 AND fc.C_Activity_ID = 1000273 AND fc.dateacct >= '01-01-2019' AND fc.dateacct <= '07-31-2019'
			) AS k
		) AS k
	) AS k
JOIN hsv_chiso hm ON k.id = hm.value AND hm.value = '11'
