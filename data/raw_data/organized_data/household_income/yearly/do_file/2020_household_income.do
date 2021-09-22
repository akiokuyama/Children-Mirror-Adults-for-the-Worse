clear all

use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\household_income\monthly\2020\data\2020-1_household_income.dta" 

cd "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\household_income\monthly\2020\data"

forvalues i=2/12{
append using 2020-`i'_household_income.dta
}


save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\household_income\yearly\household_income_2020.dta", replace