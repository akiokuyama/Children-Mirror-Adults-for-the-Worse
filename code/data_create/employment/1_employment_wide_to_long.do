clear all
insheet using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\employment\worker_long.csv"


reshape long work ,i(prefecture_num)j(date)

drop prefecture


tostring date,replace
gen date_new=date(date, "YM" )
format date_new %tm
drop date
rename date_new date
gen month=month(date)
gen year=year(date)

save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\employment\work_complete.dta",replace

******************************************************************************************************************************


clear all
insheet using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\employment\unemployment_long.csv"


reshape long unemployment ,i(prefecture_num)j(date)

drop prefecture


tostring date,replace
gen date_new=date(date, "YM" )
format date_new %tm
drop date
rename date_new date
gen month=month(date)
gen year=year(date)

save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\employment\unemployment_complete.dta", replace

******************************************************************************************************************************

clear all
insheet using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\employment\unemployment_rate_long.csv"


reshape long unemployment_rate ,i(prefecture_num)j(date)

drop prefecture


tostring date,replace
gen date_new=date(date, "YM" )
format date_new %tm
drop date
rename date_new date
gen month=month(date)
gen year=year(date)

save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\employment\unemployment_rate_complete.dta",replace

