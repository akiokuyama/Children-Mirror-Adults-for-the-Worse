clear all
use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\nation\suicide_nation_complete.dta"

drop if year == 2021

collapse (sum)  suicide_age_0_19, by(year) 


twoway ///
(connected suicide_age_0_19 year)  ///
, xtitle(Year) ytitle (Number of Child Suicide) 















