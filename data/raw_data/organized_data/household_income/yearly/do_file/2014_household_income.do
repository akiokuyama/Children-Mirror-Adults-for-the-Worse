clear all

use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\household_income\monthly\2014\data\2014-1_household_income.dta" 

forvalues i=2/12{
append using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\household_income\monthly\2014\data\2014-`i'_household_income.dta"
}

save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\household_income\yearly\household_income_2014.dta", replace
