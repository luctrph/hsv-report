SELECT  row_number() OVER () AS stt,a1,a2,a3,a4,a5,a6,a7,round(a8,0) AS a8,round(a7-a5,0) AS a9, round(a7/a5*100,1) AS a10,round( a8-a6,0) AS a11, kt ,a12,a13
FROM (
    SELECT 
     to_char(tm.dateto,'DD-MM-YYYY') AS a1 ,
     cb.name AS a2,
     pdg.hsv_hesosp AS a3 ,
     atv.name AS a4, 
    civ.qtyordered AS a5,
    civ.linenetamt AS a6,
    pdg.hsv_soluong AS a7,
    ((pdg.hsv_soluong-pdg.hsv_soluong*(hsv_ngaovo + hsv_chet+hsv_ngambun+ hsv_chetam+hsv_khongruot+hsv_HHBS+hsv_ngaochi+ hsv_ngaodau+hsv_ngaoditat+hsv_size150up+pdg.hsv_ngaovang)/100)*atv.hsv_dinhmuc +  (pdg.hsv_soluong*0.7*atv.hsv_dinhmuc*(pdg.hsv_ngaochi+pdg.hsv_ngaodau+pdg.hsv_ngaovang)/100) +(pdg.hsv_soluong*4000*pdg.hsv_ngaoditat/100)+ (pdg.hsv_soluong*3000*pdg.hsv_size150up/100)) AS a8,
    (pdg.hsv_size1116 + pdg.hsv_size1722 + pdg.hsv_size4060 + pdg.hsv_size6080 + pdg.hsv_size80100 + pdg.hsv_size100120 + pdg.hsv_size120150 + pdg.hsv_size150up) - 100  AS kt,
     round(k.a1,0) AS a12,
        civ.description AS a13
    FROM hsv_phieudanhgia pdg
    JOIN hsv_thumua tm ON tm.hsv_thumua_id = pdg.hsv_thumua_id 
    JOIN c_orderline civ ON pdg.c_orderline_id = civ.c_orderline_id  
    JOIN c_order co ON civ.c_order_id = co.c_order_id AND co.docstatus IN ('CO','CL')
    JOIN c_bpartner cb ON cb.c_bpartner_id = co.c_bpartner_id                         
    JOIN  m_attributeinstance att ON pdg.m_attributesetinstance_id=att.m_attributesetinstance_id
    JOIN m_attributevalue atv ON atv.m_attributevalue_id =att.m_attributevalue_id
    JOIN hsv_xe hx ON tm.hsv_xe_id=hx.hsv_xe_id 
    JOIN hsv_bangke bk ON bk.hsv_thumua_id = tm.hsv_thumua_id AND bk.isactive = 'Y' AND bk.hsv_soluong IS NOT NULL
    JOIN (
        SELECT bk.hsv_thumua_id,sum(bk.hsv_soluong)- tm.qtycount AS a1 FROM hsv_bangke bk
        JOIN hsv_thumua tm ON tm.hsv_thumua_id = bk.hsv_thumua_id 
        WHERE tm.isactive ='Y'  
        GROUP BY bk.hsv_thumua_id, tm.qtycount
    ) AS k ON k.hsv_thumua_id = tm.hsv_thumua_id
    WHERE tm.dateto >= '01-01-2018' AND tm.dateto <='12-31-2018' 
    ORDER BY tm.dateto NULLS FIRST  
) AS k
