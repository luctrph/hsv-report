select sum(tt1) + sum(tt2) - sum(tt3) as kq, sum(tienmua) as tienmua, sum(tiendau) as tiendau, sum(tienda) as tienda
from (
	select tt as tt1, 0 as tt2, 0 as tt3, 0 as tienmua, 0 as tiendau, 0 as tienda,0 as qty1, 0 as tt1
	from (
		select sum(civ.qtyinvoiced) as sl, sum(linenetamt) as tt
		from c_invoiceline civ
		join c_invoice ci on ci.c_invoice_id = civ.c_invoice_id
		join m_product hh on hh.m_product_id = civ.m_product_id
		join m_attributesetinstance att on civ.m_attributesetinstance_id = att.m_attributesetinstance_id and att.lot is not null
		join m_lot lo on lo.name = att.lot and ci.dateacct >= $p{startdate} and ci.dateacct <= $p{enddate} and (lo.M_Lot_ID = $p{m_lot_id} or $p{m_lot_id} is null)
		where ci.ad_client_id = $p{ad_client_id} and ci.docstatus in ('CO', 'CL') and ci.issotrx = 'Y'
		) as k
	
	union all
	
	select 0 as tt1, sl * dg as tt2, 0 as tt3, 0 as tienmua, 0 as tiendau, 0 as tienda,0 as qty1, 0 as tt1
	from (
		select lo.name as lo, hh.name as noidung, attv.name as thuoctinh, sum(civ.productionqty) as sl, attv.hsv_dinhmuc as dg
		from m_productionplan civ
		join m_production ci on ci.m_production_id = civ.m_production_id and ci.docstatus in ('CO', 'CL')
		join m_product hh on civ.m_product_id = hh.m_product_id
		join m_attributeinstance tt on tt.m_attributesetinstance_id = civ.m_attributesetinstance_id
		join m_attributevalue attv on tt.m_attribute_id = attv.m_attribute_id and tt.m_attributevalue_id = attv.m_attributevalue_id
		join m_lot lo on lo.m_lot_id = civ.m_lot_id
		where civ.ad_client_id = $p{ad_client_id} and (civ.M_Lot_ID = $p{m_lot_id} or $p{m_lot_id} is null) and ci.movementdate >= $p{startdate} and ci.movementdate <= $p{enddate}
		group by lo.name, hh.name, attv.name, attv.hsv_dinhmuc
		) as k
	
	union all
	
	select 0 as tt1, 0 as tt2, tienmua + tiendau + tienda as tt3, tienmua, tiendau, tienda
	from (
		select sum(case when ci.issotrx = 'N' then civ.linenetamt else 0 end) as tienmua, sum(lo.hsv_dinhmuc) as tiendau, sum(lo.hsv_dinhmuc1) as tienda
		from c_invoiceline civ
		join c_invoice ci on ci.c_invoice_id = civ.c_invoice_id and ci.docstatus in ('CO', 'CL')
		join m_product hh on hh.m_product_id = civ.m_product_id
		join m_attributesetinstance att on civ.m_attributesetinstance_id = att.m_attributesetinstance_id and att.lot is not null
		join m_lot lo on lo.name = att.lot and ci.dateacct >= $p{startdate} and ci.dateacct <= $p{enddate} and (lo.M_Lot_ID = $p{m_lot_id} or $p{m_lot_id} is null)
		where civ.ad_client_id = $p{ad_client_id}
		) as k
	) as k
