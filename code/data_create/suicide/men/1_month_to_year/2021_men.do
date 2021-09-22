clear all

use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\men\monthly\2021\2021_1_men.dta" 

cd "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\men\monthly\2021"

forvalues i=2/3{
append using 2021_`i'_men.dta
}

save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\men\yearly\men_2021.dta", replace