select distinct
    pf.WEBSITE_ID	as "0_WEBSITE_ID",
	wp.URI			as "1_URI",
    wp.page_name	as "2_page_name",
    pf.TO_PAGE_ID	as "3_TO_PAGE_ID",
    wp2.page_name	as "4_page_name",
    pf.OPTION_ID	as "5_OPTION_ID",
	pf.RULE			as "6_RULE",
    pf.action		as "7_action",
	w."NAME"		as "8_website_name",
    wp2.URI  		as "9_toURI"
from
	cfg_page_flow pf
inner join
    cfg_website_page wp on pf.FROM_PAGE_ID = wp.page_id
inner join
    cfg_website_page wp2 on pf.TO_PAGE_ID = wp2.page_id
inner join
    cfg_website w on pf.WEBSITE_ID = w.WEBSITE_ID
where
    pf.WEBSITE_ID = :website_id

