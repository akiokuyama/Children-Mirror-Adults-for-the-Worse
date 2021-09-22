use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\COVID19\COVID19_month.dta", clear

reshape long covid_infections_daily_ave covid_infections_daily_agg covid_death_daily_ave covid_death_daily_agg, i(prefecture_num)j(date)



tostring date,replace
gen date_new=date(date, "YM" )
format date_new %tm
drop date
rename date_new date
gen month=month(date)
gen year=year(date)


drop date

order prefecture_num month year covid_infections_daily_ave covid_infections_daily_agg covid_death_daily_ave covid_death_daily_agg

sort prefecture_num year month

save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\COVID19\covid_complete", replace