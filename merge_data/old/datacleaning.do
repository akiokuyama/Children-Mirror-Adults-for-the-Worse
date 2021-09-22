*clear all
*use "D:\Master_Thesis\data\merge\AP_suicide_monthly_long.dta", replace
*tostring date,replace
*gen date_new=date(date, "YM" )
*format date_new %tm
*drop date
*rename date_new date
*gen month=month(date)
*gen year=year(date)

*gen high=0
*replace high=1 if pm25_ave>60
*tabulate (prefecture_num), generate(prefectureid)

*gen covid=0
*replace covid=1 if covid_infections_daily_ave~=.

*gen highcovid=covid*high

*reg suicide_rate  high   highcovid covid prefectureid* avetemp


*forvalues i=14/21 {
*merge m:m   year month prefecture_num using "D:\Master_Thesis\data\suicide\data_cleaning\nation\20`i'_nation.dta"
*drop _merge 
*}


clear all
use "D:\Master_Thesis\data\merge\AP_suicide_monthly_long_2021_5-13.dta", replace

merge m:m   year month prefecture_num using "D:\Master_Thesis\data\climate\climate_complete.dta"

drop _merge




merge m:m year month prefecture_num using "D:\Master_Thesis\data\air_pollution\air_pollution_prefecture\air_pollution_month.dta"

drop _merge



merge m:m   year month prefecture_num using "D:\Master_Thesis\data\suicide\data_cleaning\nation\sucide_nation_complete.dta"

drop _merge



merge m:m   year month prefecture_num using "D:\Master_Thesis\data\suicide\data_cleaning\men\sucide_men_complete.dta"

drop _merge
