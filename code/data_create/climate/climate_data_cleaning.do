clear all

use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\climate\data\climate_prefecture_1.dta" 

forvalues i=2/47{
merge m:m   year month prefecture_num using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\climate\data\climate_prefecture_`i'.dta"
drop _merge
}


sort year month prefecture_num

drop date

order prefecture_num month year average_temp highest_temp_day lowest_temp_day highest_temp lowest_temp sum_rain1 sum_rain2 max_rain_hour1 max_rain_hour2 max_rain_day1 max_rain_day2 sunlight_hour1 sunlight_hour2 sunlight_percent1 sunlight_percent2 humidity humidity_hpa


drop sum_rain2 max_rain_hour2 max_rain_day2 sunlight_hour2 sunlight_percent2

save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\climate\climate_complete.dta", replace
