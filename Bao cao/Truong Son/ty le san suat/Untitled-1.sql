select sum(t.movementqty) as qty, 0 as qty1
from (
	select m_transaction.AD_Org_ID, hh.m_product_category_id, hh.value, hh.name, m_transaction.m_product_id, m_transaction.m_locator_id, m_transaction.movementdate, m_transaction.movementtype, m_transaction.
		movementqty
	from m_transaction
	join m_product hh on m_transaction.m_product_id = hh.m_product_id
	join (
		select ml.M_productionline_id
		from M_productionline ml
		join (
			select ml.M_productionplan_id
			from M_productionplan ml
			join M_production m on ml.M_production_id = m.M_production_id and m.docstatus in ('CO', 'CL') and m.ad_client_id = 1000023
			) m on ml.M_productionplan_id = m.M_productionplan_id
		) t3 on m_transaction.M_productionline_id = t3.M_productionline_id
	where m_transaction.movementtype in ('P+') and m_transaction.movementdate >= '06-01-2019' and m_transaction.movementdate <= '06-30-2019' and m_transaction.ad_client_id = 1000023 and hh.m_product_category_id = 
		1000513
	) as t
