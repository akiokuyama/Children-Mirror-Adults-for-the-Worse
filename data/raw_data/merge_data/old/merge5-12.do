clear all
cd D:\Master_Thesis\data\merge
use average_temperature_month.dta

*set maxvar 120000

*****************************************************
 
use COVID19_month.dta
sort prefecture_num
save COVID19_month.dta, replace


use average_temperature_month.dta
sort prefecture_num
save average_temperature_month.dta, replace

use average_temperature_month.dta

merge prefecture_num using COVID19_month.dta


drop _merge

save AP_suicide_monthly, replace
***************************************************

clear all
cd D:\Master_Thesis\data\merge

use AP_suicide_monthly.dta 
sort prefecture_num
save AP_suicide_monthly, replace


use number_of_suicide_month.dta
sort prefecture_num
save number_of_suicide_month.dta, replace

use AP_suicide_monthly

merge prefecture_num using number_of_suicide_month.dta


drop _merge

save AP_suicide_monthly, replace
*****************************************************

clear all
cd D:\Master_Thesis\data\merge

use AP_suicide_monthly.dta 
sort prefecture_num
save AP_suicide_monthly, replace


use suicide_num_man_month.dta
sort prefecture_num
save suicide_num_man_month.dta, replace

use AP_suicide_monthly

merge prefecture_num using suicide_num_man_month.dta


drop _merge

save AP_suicide_monthly, replace
*****************************************************

clear all
cd D:\Master_Thesis\data\merge

use AP_suicide_monthly.dta 
sort prefecture_num
save AP_suicide_monthly, replace


use suicide_num_woman_month.dta
sort prefecture_num
save suicide_num_woman_month.dta, replace

use AP_suicide_monthly

merge prefecture_num using suicide_num_woman_month.dta


drop _merge

save AP_suicide_monthly, replace
*****************************************************

clear all
cd D:\Master_Thesis\data\merge

use AP_suicide_monthly.dta 
sort prefecture_num
save AP_suicide_monthly, replace


use suicide_rate_month.dta
sort prefecture_num
save suicide_rate_month.dta, replace

use AP_suicide_monthly

merge prefecture_num using suicide_rate_month.dta


drop _merge

save AP_suicide_monthly, replace
*****************************************************

clear all
cd D:\Master_Thesis\data\merge

use AP_suicide_monthly.dta 
sort prefecture_num
save AP_suicide_monthly, replace


use suicide_rate_man_month.dta
sort prefecture_num
save suicide_rate_man_month.dta, replace

use AP_suicide_monthly

merge prefecture_num using suicide_rate_man_month.dta


drop _merge

save AP_suicide_monthly, replace
*****************************************************

clear all
cd D:\Master_Thesis\data\merge

use AP_suicide_monthly.dta 
sort prefecture_num
save AP_suicide_monthly, replace


use suicide_rate_woman_month.dta.
sort prefecture_num
save suicide_rate_woman_month.dta, replace

use AP_suicide_monthly

merge prefecture_num using suicide_rate_woman_month.dta


drop _merge

save AP_suicide_monthly, replace
























*****************************************************
*****************************************************
clear all
cd D:\Master_Thesis\data\merge

use AP_suicide_monthly.dta 
sort prefecture_num
save AP_suicide_monthly, replace


use PM2.5_month.dta
sort prefecture_num
save PM2.5_month.dta, replace

use AP_suicide_monthly

merge prefecture_num using PM2.5_month.dta


drop _merge

save AP_suicide_monthly, replace
*****************************************************

clear all
cd D:\Master_Thesis\data\merge

use AP_suicide_monthly.dta 
sort prefecture_num
save AP_suicide_monthly, replace


use PM10_month.dta
sort prefecture_num
save PM10_month.dta, replace

use AP_suicide_monthly

merge prefecture_num using PM10_month.dta


drop _merge

save AP_suicide_monthly, replace


*****************************************************
*****************************************************


drop if prefecture_num==0

save AP_suicide_monthly, replace






clear all
cd D:\Master_Thesis\data\merge

use AP_suicide_monthly.dta 

*wide形式からlong形式に変換
reshape long avetemp covid_infections_daily_ave covid_infections_daily_agg covid_death_daily_ave covid_death_daily_agg suicide_num suicide_num_man suicide_num_woman suicide_rate suicide_rate_man suicide_rate_woman pm25_ave pm25_agg pm10_ave pm10_agg,i(prefecture_num)j(date)


save AP_suicide_monthly_long.dta,replace

*パネルデータとして認証させる
tsset prefecture_num date

*パネルデータの形状を確認
xtdes































