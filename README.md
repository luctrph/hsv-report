select case when (detail_stt=10) then header_org else null end as header_org,
case when (detail_stt=10) then header_sct else null end as header_sct,
case when (detail_stt=10) then header_mota else null end as header_mota,
case when (detail_stt=10) then header_ngay else null end as header_ngay,
case when (detail_stt=10) then header_duan else null end as header_duan,
case when (detail_stt=10) then header_hoatdong else null end as header_hoatdong,
case when (detail_stt=10) then header_chiendich else null end as header_chiendich,
detail_sct,detail_stt,detail_product,detail_sl,detail_kho,detail_mota
from
(
select t.org as header_org,concat('NTP.', to_char(t.ngay,'DDMMYY')) as header_sct,'Nhập BTP sản xuất ván' as header_mota,to_char(t.ngay,'YYYY-MM-DD') as header_ngay,proj as header_duan, acct as header_hoatdong, camp as header_chiendich,
'' as detail_sct,stt as detail_stt,
product as detail_product, sl as detail_sl,kho as detail_kho,  mota as detail_mota
from (
	select 1 as id, cp.value as proj, act.value  as acct, camp.value as camp
	from c_project cp,  C_Activity act,C_Campaign camp
	where cp.c_project_id =1000240 and  act.c_activity_id = 1000072 and camp.C_Campaign_ID=1000037
) as z 
left join (
	select t.id,t.org,t.ngay, row_number() over(order by t.ngay) *10 as stt,t.product, t.sl,k.kho, concat(to_char(t.ngay,'DD/MM/YYYY' ),' - ',k.nghiepvu,' - ',tosx,' - ', coalesce(t.doitac,'')) as mota 
	from(
		select 1 as id,lo.value as kho, hl.name as nghiepvu
		from hsv_luongbep hl
		join m_locator lo on hl.m_locator_id = lo.m_locator_id 
		where hsv_cotluong = 'Nhap_kho.van.phanloai' and hl.ad_org_id =$P{AD_Org_ID} and hl.ad_client_id =$P{AD_CLIENT_ID}
	) as k 
	left join 
	(
		select 1 as id, org,product, sum(sl) as sl, doitac,ngay
		from(
			select org.name as org,hh.value as product, sum(nkl.qtyother) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name 
			
			union all 
			
			select org.name as org,hh.value as product, sum(nkl.amountdg1) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name 
			
			union all 
			
			select org.name as org,hh.value as product, sum(nkl.amountdg2) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name 
			
			union all 
			
			select org.name as org,hh.value as product, sum(nkl.amountdg3) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name 
			
			union all 
			
			select org.name as org,hh.value as product, sum(nkl.amountdg4) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name 
			
			union all 
			
			select org.name as org,hh.value as product, sum(nkl.amountdg5) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name 
			
			union all 
			
			select org.name as org,hh.value as product, sum(nkl.a_17) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name
			
			union all 
			
			select org.name as org,hh.value as product, sum(nkl.a_20) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name
			
			union all 
			
			select org.name as org,hh.value as product, sum(nkl.a_cuon17) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name
			
			union all 
			
			select org.name as org,hh.value as product, sum(nkl.a_cuon20) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name
			
			union all 
			
			select org.name as org,hh.value as product, sum(nkl.a_mai17) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name
			
			
			union all 
			
			select org.name as org,hh.value as product, sum(nkl.a_mai20) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name
			
			
			union all 
			
			select org.name as org,hh.value as product, sum(nkl.a17) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name
			union all 

			
			select org.name as org,hh.value as product, sum(nkl.a20) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name
			UNION all 
			select org.name as org,hh.value as product, sum(nkl.acuon17) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name
			UNION all 
			select org.name as org,hh.value as product, sum(nkl.acuon20) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name
			UNION all 
			select org.name as org,hh.value as product, sum(nkl.amai17) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name
			UNION all 
			select org.name as org,hh.value as product, sum(nkl.amai20) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name
			UNION all 
			select org.name as org,hh.value as product, sum(nkl.amount) as sl, coalesce(cb.value, null)  as doitac, nksx.dateacct as ngay 
			, ts.value as tosx
			from m_product hh 
			join hsv_sanpham sp on hh.m_product_id = sp.m_product_id 
			join hsv_nhatkysxline nkl on nkl.hsv_sanpham_id = sp.hsv_sanpham_id  
			join hsv_nhatkysx nksx on nksx.hsv_nhatkysx_id = nkl.hsv_nhatkysx_id 
			join ad_org org on org.ad_org_id =nksx.ad_org_id 
			left join c_bpartner cb on cb.c_bpartner_id = nksx.c_bpartner_id 
			join hsv_tosx ts on ts.hsv_tosx_id = nksx.hsv_tosx_id 
			where ts.hsv_loaimat_id in (1000078,1000018)
			and nksx.ad_org_id = $P{AD_Org_ID}
			and nksx.dateacct>= $P{StartDate} and nksx.dateacct <= $P{StartDate} and nksx.ad_client_id =$P{AD_CLIENT_ID}
			group by hh.m_product_id,doitac,  nksx.dateacct, ts.value, org.name
		) as k 
	) as t on k.id= t.id
	) as t on k.id= t.id
	where sl<>0
) as t on z.id = t.id 
where stt is not null 
) as k