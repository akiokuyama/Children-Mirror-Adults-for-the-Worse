clear all
use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\merge_data\data_for_merge\air_pollution_merge.dta"

*set maxvar 120000

*******************************************************************************************************************

merge m:m  year month prefecture_num using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\merge_data\data_for_merge\bankruptcy.dta"

drop _merge
*******************************************************************************************************************
merge m:m  year month prefecture_num using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\merge_data\data_for_merge\climate_complete.dta"

drop _merge

*******************************************************************************************************************
merge m:m  year month using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\merge_data\data_for_merge\composite_index.dta"

drop _merge
*******************************************************************************************************************
merge m:m  year month using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\merge_data\data_for_merge\consumption_index.dta"

drop _merge

********************************************************************************************************************
merge m:m  year month prefecture_num using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\merge_data\data_for_merge\covid_complete.dta"

drop _merge

*******************************************************************************************************************
merge m:m  year month using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\merge_data\data_for_merge\dv_call.dta"

drop _merge

*******************************************************************************************************************
merge m:m  year month prefecture_num using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\merge_data\data_for_merge\employment_complete.dta"

drop _merge

*******************************************************************************************************************
merge m:m  year month using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\merge_data\data_for_merge\employment_gender.dta"

drop _merge

*******************************************************************************************************************
merge m:m  year month prefecture_num using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\merge_data\data_for_merge\household_income_complete.dta"

drop _merge

*******************************************************************************************************************
merge m:m  year prefecture_num using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\merge_data\data_for_merge\municipality_income_complete.dta"

drop _merge

*******************************************************************************************************************
merge m:m year prefecture_num using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\merge_data\data_for_merge\population_complete.dta"

drop _merge

*******************************************************************************************************************
merge m:m  year month  using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\merge_data\data_for_merge\stringency_index_complete.dta"

drop _merge

*******************************************************************************************************************
merge m:m  year month using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\merge_data\data_for_merge\subsidy_complete.dta"

drop _merge

*******************************************************************************************************************
merge m:m  year month prefecture_num using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\merge_data\data_for_merge\suicide_men_complete.dta"

drop _merge

*******************************************************************************************************************
merge m:m  year month prefecture_num using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\merge_data\data_for_merge\suicide_nation_complete.dta"

drop _merge

*******************************************************************************************************************
merge m:m  year month prefecture_num using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\merge_data\data_for_merge\suicide_women_complete.dta"

drop _merge

*******************************************************************************************************************
merge m:m  year month using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\merge_data\data_for_merge\working_hours_check.dta"

drop _merge

*******************************************************************************************************************

drop date



/*
drop  pm25 pm10 o3 no2 so2 co
save "D:\Master_Thesis\data\merge\AP-suicide_complete.dta"




*save AP_suicide_monthly, replace


use "D:\Master_Thesis\data\merge\AP-suicide_complete.dta",clear

sort prefecture_num

merge m:m year prefecture_num using "D:\Master_Thesis\data\merge\data_for_merge\population_complete.dta"
drop _merge


*merge m:m year month prefecture_num using "D:\Master_Thesis\data\merge\data_for_merge\employment_complete.dta"
*drop _merge


merge m:m year prefecture_num using "D:\Master_Thesis\data\merge\data_for_merge\income_complete.dta"
drop _merge


use "D:\Master_Thesis\data\merge\AP-suicide_complete.dta",clear

merge m:m year month prefecture_num using "D:\Master_Thesis\data\merge\data_for_merge\household_income_complete.dta"
drop _merge



use "D:\Master_Thesis\data\merge\AP-suicide_complete.dta",clear

merge m:m year month using "D:\Master_Thesis\data\merge\data_for_merge\dv_call.dta"
drop _merge


use "D:\Master_Thesis\data\merge\AP-suicide_complete.dta",clear

merge m:m year month using "D:\Master_Thesis\data\merge\data_for_merge\working_hours.dta"
drop _merge


use "D:\Master_Thesis\data\merge\AP-suicide_complete.dta",clear

merge m:m year month using "D:\Master_Thesis\data\merge\data_for_merge\consumption_index.dta"
drop _merge


use "D:\Master_Thesis\data\merge\AP-suicide_complete.dta",clear

merge m:m year month using "D:\Master_Thesis\data\merge\data_for_merge\composite_index.dta"
drop _merge


use "D:\Master_Thesis\data\merge\AP-suicide_complete.dta",clear

merge m:m year month using "D:\Master_Thesis\data\merge\data_for_merge\stringency_index_complete.dta"
drop _merge


use "D:\Master_Thesis\data\merge\AP-suicide_complete.dta",clear

merge m:m year month prefecture_num using "D:\Master_Thesis\data\merge\data_for_merge\bankruptcy.dta"
drop _merge

use "D:\Master_Thesis\data\merge\AP-suicide_complete.dta",clear

merge m:m year month using "D:\Master_Thesis\data\merge\data_for_merge\subsidy.dta"
drop _merge


drop date PM25_mean PM25_sum PM10_mean PM10_sum o3_mean o3_sum no2_mean no2_sum so2_mean so2_sum co_mean co_sum



drop claims_for_subsidy claims_for_subsidy_total accepted_application accepted_application_total amount_of_subsidy amount_of_subsidy_total


merge m:m year month using "D:\Master_Thesis\data\merge\data_for_merge\subsidy_complete.dta"
drop _merge


drop stringency_index
merge m:m year month using "D:\Master_Thesis\data\merge\data_for_merge\stringency_index_complete.dta"
drop _merge


merge m:m year month using "D:\Master_Thesis\data\merge\data_for_merge\dv_call.dta"
drop _merge


merge m:m year month prefecture_num using "D:\Master_Thesis\data\merge\data_for_merge\air_pollution_all_prefecture_check.dta"
drop _merge


drop pop*
merge m:m year prefecture_num using "D:\Master_Thesis\data\merge\data_for_merge\population_complete.dta"
drop _merge
*/




order month year prefecture_num covid_infections_daily_ave covid_infections_daily_agg covid_death_daily_ave covid_death_daily_agg work unemployment unemployment_rate municipality_income real_income expenditure disposable_income working_hour consumption_index composite_index bankruptcy claims_for_subsidy accepted_application amount_of_subsidy stringency_index dvcall average_temp highest_temp_day lowest_temp_day highest_temp lowest_temp sum_rain max_rain_hour max_rain_day sunlight_hour sunlight_percent humidity humidity_hpa PM25_mean PM25_sum PM10_mean PM10_sum o3_mean o3_sum no2_mean no2_sum so2_mean so2_sum co_mean co_sum suicide_num suicide_rate suicide_rate_year suicide_age_0_19 suicide_age_20_29 suicide_age_30_39 suicide_age_40_49 suicide_age_50_59 suicide_age_60_69 suicide_age_70_79 suicide_age_80 suicide_age_unknown suicide_with_housemate suicide_without_housemate suicide_housemate_unknown suicide_business_owner suicide_employee suicide_all_disemployment suicide_student suicide_disemployment suicide_housewife suicide_job_loss suicide_pension suicide_other_disemployment suicide_job_unknown suicide_in_house suicide_in_high_building suicide_in_vehicle suicide_in_sea suicide_in_mountain suicide_in_other suicide_in_unknown suicide_way_neck suicide_way_poison suicide_way_coal suicide_way_fall_sky suicide_way_fall_water suicide_way_other suicide_way_unknown suicide_time_0_2 suicide_time_2_4 suicide_time_4_6 suicide_time_6_8 suicide_time_8_10 suicide_time_10_12 suicide_time_12_14 suicide_time_14_16 suicide_time_16_18 suicide_time_18_20 suicide_time_20_22 suicide_time_22_24 suicide_time_unknown suicide_day_sunday suicide_day_monday suicide_day_tuesday suicide_day_wednesday suicide_day_thursday suicide_day_friday suicide_day_saturday suicide_day_unknwon suicide_reason_home suicide_reason_health suicide_reason_eco suicide_reason_labor suicide_reason_sex suicide_reason_school suicide_reason_other suicide_reason_unknown suicide_history_yes suicide_history_no suicide_history_unknown suicide_num_men suicide_rate_men suicide_rate_year_men suicide_age_0_19_men suicide_age_20_29_men suicide_age_30_39_men suicide_age_40_49_men suicide_age_50_59_men suicide_age_60_69_men suicide_age_70_79_men suicide_age_80_men suicide_age_unknown_men suicide_with_housemate_men suicide_without_housemate_men suicide_housemate_unknown_men suicide_business_owner_men suicide_employee_men suicide_all_disemployment_men suicide_student_men suicide_disemployment_men suicide_housewife_men suicide_job_loss_men suicide_pension_men suicide_other_disemployment_men suicide_job_unknown_men suicide_in_house_men suicide_in_high_building_men suicide_in_vehicle_men suicide_in_sea_men suicide_in_mountain_men suicide_in_other_men suicide_in_unknown_men suicide_way_neck_men suicide_way_poison_men suicide_way_coal_men suicide_way_fall_sky_men suicide_way_fall_water_men suicide_way_other_men suicide_way_unknown_men suicide_time_0_2_men suicide_time_2_4_men suicide_time_4_6_men suicide_time_6_8_men suicide_time_8_10_men suicide_time_10_12_men suicide_time_12_14_men suicide_time_14_16_men suicide_time_16_18_men suicide_time_18_20_men suicide_time_20_22_men suicide_time_22_24_men suicide_time_unknown_men suicide_day_sunday_men suicide_day_monday_men suicide_day_tuesday_men suicide_day_wednesday_men suicide_day_thursday_men suicide_day_friday_men suicide_day_saturday_men suicide_day_unknwon_men suicide_reason_home_men suicide_reason_health_men suicide_reason_eco_men suicide_reason_labor_men suicide_reason_sex_men suicide_reason_school_men suicide_reason_other_men suicide_reason_unknown_men suicide_history_yes_men suicide_history_no_men suicide_history_unknown_men suicide_num_women suicide_rate_women suicide_rate_year_women suicide_age_0_19_women suicide_age_20_29_women suicide_age_30_39_women suicide_age_40_49_women suicide_age_50_59_women suicide_age_60_69_women suicide_age_70_79_women suicide_age_80_women suicide_age_unknown_women suicide_with_housemate_women suicide_without_housemate_women suicide_housemate_unknown_women suicide_business_owner_women suicide_employee_women suicide_all_disemployment_women suicide_student_women suicide_disemployment_women suicide_housewife_women suicide_job_loss_women suicide_pension_women suicide_other_disemployment_wome suicide_job_unknown_women suicide_in_house_women suicide_in_high_building_women suicide_in_vehicle_women suicide_in_sea_women suicide_in_mountain_women suicide_in_other_women suicide_in_unknown_women suicide_way_neck_women suicide_way_poison_women suicide_way_coal_women suicide_way_fall_sky_women suicide_way_fall_water_women suicide_way_other_women suicide_way_unknown_women suicide_time_0_2_women suicide_time_2_4_women suicide_time_4_6_women suicide_time_6_8_women suicide_time_8_10_women suicide_time_10_12_women suicide_time_12_14_women suicide_time_14_16_women suicide_time_16_18_women suicide_time_18_20_women suicide_time_20_22_women suicide_time_22_24_women suicide_time_unknown_women suicide_day_sunday_women suicide_day_monday_women suicide_day_tuesday_women suicide_day_wednesday_women suicide_day_thursday_women suicide_day_friday_women suicide_day_saturday_women suicide_day_unknwon_women suicide_reason_home_women suicide_reason_health_women suicide_reason_eco_women suicide_reason_labor_women suicide_reason_sex_women suicide_reason_school_women suicide_reason_other_women suicide_reason_unknown_women suicide_history_yes_women suicide_history_no_women suicide_history_unknown_women pop_all pop_04 pop_59 pop_1014 pop_1519 pop_2024 pop_2529 pop_3034 pop_3539 pop_4044 pop_4549 pop_5054 pop_5559 pop_6064 pop_6569 pop_7074 pop_7579 pop_8084 pop_8589 pop_9094 pop_9599 pop_o100 pop_all_men pop_04_men pop_59_men pop_1014_men pop_1519_men pop_2024_men pop_2529_men pop_3034_men pop_3539_men pop_4044_men pop_4549_men pop_5054_men pop_5559_men pop_6064_men pop_6569_men pop_7074_men pop_7579_men pop_8084_men pop_8589_men pop_9094_men pop_9599_men pop_o100_men pop_all_women pop_04_women pop_59_women pop_1014_women pop_1519_women pop_2024_women pop_2529_women pop_3034_women pop_3539_women pop_4044_women pop_4549_women pop_5054_women pop_5559_women pop_6064_women pop_6569_women pop_7074_women pop_7579_women pop_8084_women pop_8589_women pop_9094_women pop_9599_women pop_o100_women pop_u15 pop_u15_men pop_u15_women pop_1564 pop_1564_men pop_1564_women pop_o65 pop_o65_men pop_o65_women pop_rate_u15 pop_rate_u15_men pop_rate_u15_women pop_rate_1564 pop_rate_1564_men pop_rate_1564_women pop_rate_o65 pop_rate_o65_men pop_rate_o65_women


order day


drop if year==2021 & month>3

save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\working_data\working_data.dta", replace



/*

drop if year==2013

gen day=1
gen edate = mdy(month,day,year)
format edate %d





use "D:\Master_Thesis\data\merge\AP-suicide_complete.dta",clear
drop unemployment_rate
merge m:m year month prefecture_num using "D:\Master_Thesis\data\merge\data_for_merge\unemployment_rate_complete.dta"
drop _merge


use "D:\Master_Thesis\AP-suicide_complete_new.dta"
merge m:m year month  using "D:\Master_Thesis\data\merge\data_for_merge\employment_gender.dta"
drop _merge














































