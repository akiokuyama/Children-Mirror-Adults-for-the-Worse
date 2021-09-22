clear all 
use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\nation\suicide_nation_complete.dta"


collapse (sum)  suicide_num, by(year) 

drop if year==2021

gen code=1

save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\figure\figure1\PanelA\suicide_nation_panelA.dta",replace


*****************************************************************************************************************************************
clear all 
use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\men\suicide_men_complete.dta"


collapse (sum)  suicide_num_men, by(year) 

drop if year==2021

rename suicide_num_men suicide_num
gen code=2

save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\figure\figure1\PanelA\suicide_men_panelA.dta",replace



*****************************************************************************************************************************************

clear all 
use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\suicide\data_cleaning\women\suicide_women_complete.dta"

collapse (sum)  suicide_num_women, by(year) 

drop if year==2021

rename suicide_num_women suicide_num
gen code=3

save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\figure\figure1\PanelA\suicide_women_panelA.dta",replace


*****************************************************************************************************************************************

*****************Combine three data above**********************

clear all 
use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\figure\figure1\PanelA\suicide_nation_panelA.dta"

append using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\figure\figure1\PanelA\suicide_men_panelA.dta"

append using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\figure\figure1\PanelA\suicide_women_panelA.dta"


save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\figure\figure1\PanelA\data_PanalA.dta", replace