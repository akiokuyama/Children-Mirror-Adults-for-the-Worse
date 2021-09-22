use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\working_data\descriptive_statistics.dta", clear

drop sr_econ sr_home sr_labor sr_school sr_sex sr_health

***suicide rate reasons***
gen sr_econ=suicide_reason_eco/pop_all*100000

gen sr_home=suicide_reason_home/pop_all*100000

gen sr_labor=suicide_reason_labor/pop_all*100000

gen sr_school=suicide_reason_school/pop_ch*100000

gen sr_sex=suicide_reason_sex/pop_all*100000




**Feb to May in 2019 & 2020***
drop if month!= 2 & month!= 3 & month!= 4 & month!=  5
drop if year!=2020 & year!=2019


sort prefecture_num  year month


collapse (mean) sr_econ sr_home sr_labor sr_school sr_sex, by (year)


*************create excel file "data for figure 3" by hand*******************


clear all

insheet using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\figure\figure3\data_for_figure3.csv"


graph bar sr2019 sr2020, over(reason)  ytitle("Suicide Rate")

