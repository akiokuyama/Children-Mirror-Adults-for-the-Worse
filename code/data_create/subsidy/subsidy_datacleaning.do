clear all
insheet using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\subsidy\subsidy_for_cleaning.csv"

collapse (sum)  claims_for_subsidy, by(month year) 

sort year month

save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\subsidy\claims_for_subsidy.dta", replace

*********************************************************************************************************************************
clear all
insheet using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\subsidy\subsidy_for_cleaning.csv"

collapse (sum)  accepted_application, by(month year) 

sort year month

save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\subsidy\accepted_application.dta", replace


*********************************************************************************************************************************
clear all
insheet using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\subsidy\subsidy_for_cleaning.csv"

collapse (sum)  amount_of_subsidy, by(month year) 

sort year month

save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\subsidy\amount_of_subsidy.dta", replace

*********************************************************************************************************************************

clear all

use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\subsidy\claims_for_subsidy.dta"


merge m:m year month using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\subsidy\accepted_application.dta"
drop _merge

merge m:m year month using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\subsidy\amount_of_subsidy.dta"
drop _merge


order month year


save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\subsidy\subsidy_complete.dta", replace