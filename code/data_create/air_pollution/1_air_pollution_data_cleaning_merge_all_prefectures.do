clear all

use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\air_pollution\data\air_pollution_prefecture_1.dta" 

forvalues i=2/47{
merge m:m   year month prefecture_num using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\air_pollution\data\air_pollution_prefecture_`i'.dta"
drop _merge
}

save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\air_pollution\air_pollution_nation",replace
