clear all

use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\nation\monthly\2021\2021-1_nation.dta" 

cd "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\nation\monthly\2021"


forvalues i=2/3{
append using 2021-`i'_nation.dta
}


save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\nation\yearly\nation_2021.dta", replace
