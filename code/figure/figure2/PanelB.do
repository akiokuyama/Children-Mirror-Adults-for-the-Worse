clear all
use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\employment\employment_complete.dta"

collapse (mean) unemployment_rate, by (year month)

gen id=3
replace id =1  if  1<=month & month<=4
replace id =2  if  5<=month & month<=8

collapse (mean) unemployment_rate, by (year id)

gen order=_n

gen date= ym(year,id)
*format date %tm
 

 
twoway (line unemployment_rate order) (lfit unemployment_rate order), xtitle(Year) ytitle(Unemployment Rate (%)) xlabel(1 4 7 10 13 16 19)


