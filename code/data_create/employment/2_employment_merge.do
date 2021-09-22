clear all

use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\employment\work_complete.dta"

sort prefecture_num

merge m:m month year prefecture_num using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\employment\unemployment_complete.dta"
drop _merge


merge m:m month year prefecture_num using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\employment\unemployment_rate_complete.dta"
drop _merge


drop date

order prefecture_num month year work unemployment unemployment_rate

drop if unemployment==.

sort year month prefecture_num


save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\employment\employment_complete.dta",replace















