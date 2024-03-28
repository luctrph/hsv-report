SELECT cb.name, cb.value, cb.hsv_laisuat, sum(sodu) AS sodu , sum(sodu)* cb.hsv_laisuat/100/30  AS laithang
FROM (
	SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE THEN (t.amtacctcr) ELSE 0 END) AS psco,
		 sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_bpartner cp ON t.c_bpartner_id = cp.c_bpartner_id
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
	
	SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 1 THEN (t.amtacctcr) ELSE 0 END) AS psco, 
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 1 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 1 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 2 THEN (t.amtacctcr) ELSE 0 END) AS psco, 
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 2 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 2 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 3 THEN (t.amtacctcr) ELSE 0 END) AS psco,
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 3 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 3 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 4 THEN (t.amtacctcr) ELSE 0 END) AS psco, 
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 4 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 4 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 5 THEN (t.amtacctcr) ELSE 0 END) AS psco,
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 5 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 5 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 6 THEN (t.amtacctcr) ELSE 0 END) AS psco,
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 6 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 6 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 7 THEN (t.amtacctcr) ELSE 0 END) AS psco,
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 7 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 7 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 8 THEN (t.amtacctcr) ELSE 0 END) AS psco,
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 8 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 8 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 9 THEN (t.amtacctcr) ELSE 0 END) AS psco, 
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 9 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 9 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 10 THEN (t.amtacctcr) ELSE 0 END) AS psco, 
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 10 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 10 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 11 THEN (t.amtacctcr) ELSE 0 END) AS psco,
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 11 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 11 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 12 THEN (t.amtacctcr) ELSE 0 END) AS psco, 
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 12 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 12 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 13 THEN (t.amtacctcr) ELSE 0 END) AS psco,
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 13 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 13 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 14 THEN (t.amtacctcr) ELSE 0 END) AS psco, 
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 14 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 14 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 15 THEN (t.amtacctcr) ELSE 0 END) AS psco,
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 15 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 15 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 16 THEN (t.amtacctcr) ELSE 0 END) AS psco,
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 16 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 16 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 17 THEN (t.amtacctcr) ELSE 0 END) AS psco,
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 17 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 17 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 18 THEN (t.amtacctcr) ELSE 0 END) AS psco,
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 18 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 18 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 19 THEN (t.amtacctcr) ELSE 0 END) AS psco, 
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 19 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 19 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 20 THEN (t.amtacctcr) ELSE 0 END) AS psco, 
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 20 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 20 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 21 THEN (t.amtacctcr) ELSE 0 END) AS psco,
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 21 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 21 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 22 THEN (t.amtacctcr) ELSE 0 END) AS psco,
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 22 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 22 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 23 THEN (t.amtacctcr) ELSE 0 END) AS psco, 
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 23 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 23 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 24 THEN (t.amtacctcr) ELSE 0 END) AS psco,
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 24 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 24 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 25 THEN (t.amtacctcr) ELSE 0 END) AS psco, 
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 25 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 25 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 26 THEN (t.amtacctcr) ELSE 0 END) AS psco,
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 26 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 26 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 27 THEN (t.amtacctcr) ELSE 0 END) AS psco,
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 27 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 27 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 28 THEN (t.amtacctcr) ELSE 0 END) AS psco,
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 28 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 28 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	UNION ALL
	SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 29 THEN (t.amtacctcr) ELSE 0 END) AS psco, 
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 29 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 29 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
	
	
	UNION ALL
		SELECT c_bpartner_id, psco - psno AS sodu
	FROM (
		SELECT t.c_bpartner_id, sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 30 THEN (t.amtacctcr) ELSE 0 END) AS psco,
		sum(CASE WHEN t.dateacct <= date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 30 THEN (t.amtacctdr) ELSE 0 END) AS psno
		FROM fact_acct t
		INNER JOIN c_elementvalue acct ON t.account_id = acct.c_elementvalue_id AND acct.value = '3113'
		WHERE t.ad_client_id = 1000003 AND date_trunc('MONTH', '02-01-2019'::DATE)::DATE + 30 < (date_trunc('MONTH', '02-01-2019'::DATE) + INTERVAL '1 MONTH - 1 day')::DATE
		GROUP BY t.c_bpartner_id
		) AS k
		) AS k
INNER JOIN c_bpartner cb ON cb.c_bpartner_id = k.c_bpartner_id
GROUP BY cb.name, cb.value, cb.hsv_laisuat
