clear all
use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\nation\yearly\nation_2014.dta", replace


forvalues i=2015/2021{
merge m:m   year month prefecture_num using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\nation\yearly\nation_`i'.dta"
drop _merge
}

drop prefecture
drop if prefecture_num==0

order prefecture_num month year

sort year month prefecture_num

save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\nation\suicide_nation_complete.dta", replace