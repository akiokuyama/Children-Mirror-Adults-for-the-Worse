clear all

use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\men\monthly\2015\2015_1_men.dta" 
cd "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\men\monthly\2015"


forvalues i=2/12{
append using 2015_`i'_men.dta
}


save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\men\yearly\men_2015.dta", replace