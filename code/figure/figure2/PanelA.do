clear all
use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\air_pollution\air_pollution_merge.dta"

collapse (mean) pm25, by(year month) 

gen day = 1

gen edate = mdy(month, day, year)

format edate %d

drop if month>3 & year==2021


twoway (line pm25 edate) (lfit pm25 edate), xtitle("Year") ytitle("PM2.5 (AQI)")
