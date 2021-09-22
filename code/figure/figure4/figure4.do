clear all
use using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\dv_call\dv_call.dta",clear

drop if year==2021
drop if month<4 & year==2020

gen dvcall2019=dvcall if year==2019
gen dvcall2020=dvcall if year==2020



twoway (connected dvcall2019 month) (connected dvcall2020 month), xtitle("Month") ytitle("Number of DV help calls") legend(label(1 "2019") label(2 "2020")) 
