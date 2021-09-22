clear all

use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\women\monthly\2014\2014_1_women.dta" 

cd "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\women\monthly\2014"

forvalues i=2/12{
append using 2014_`i'_women.dta
}

save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\women\yearly\women_2014.dta", replace