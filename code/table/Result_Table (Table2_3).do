clear all
set seed 999
use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\working_data\working_data.dta"

*generate COVID lockdown variable
gen lockdown=0
replace lockdown=1 if month>=2 & month<=5 & year==2020
replace lockdown=1 if month>=7 &month<=9 & year==2020

gen covid=0 
replace covid=1 if covid_infections_daily_ave>0
replace covid=0 if covid_infections_daily_ave==.

gen firstlockdown=0
replace firstlockdown=1 if month>=2 & month<=5 & year==2020

gen secondlockdown=0
replace secondlockdown=1 if month>=7 &month<=9 & year==2020


*generate log value of air pollutants
gen lnpm25=ln(PM25_mean+1)
gen lnpm10=ln(PM10_mean+1)
gen lno3=ln(o3_mean+1)
gen lnno2=ln(no2_mean+1)
gen lnso2=ln(so2_mean+1)

*generate month year prefecture fixed variable
tabulate year, gen(yearid)
tabulate month, gen(monthid)
tabulate prefecture, generate(prefectureid)


**** treatment variable (PM2.5)****
sum PM25_mean if firstlockdown==1 , detail
sum PM25_mean if secondlockdown==1 , detail
sum PM25_mean if secondlockdown==0 & firstlockdown==0 , detail
gen highpm25=0
replace highpm25=1 if PM25_mean>=50
replace highpm25=1 if PM25_mean>=42 & firstlockdown==1
replace highpm25=1 if PM25_mean>=38 & secondlockdown==1

gen firstlockdown_highpm=firstlockdown*highpm25
gen secondlockdown_highpm=secondlockdown*highpm25
gen lockdown_highpm=lockdown*highpm25


*change 0 to missing
foreach var of varlist pop* claim*  average_temp highest_temp_day lowest_temp_day highest_temp lowest_temp sum_rain max_rain_hour max_rain_day sunlight_hour sunlight_percent humidity humidity_hpa unemployment unemployment_rate municipality_income real_income expenditure disposable_income working_hour consumption_index composite_index covid_infections_daily_ave covid_infections_daily_agg covid_death_daily_ave covid_death_daily_agg stringency_index bankruptcy claims_for_subsidy  accepted_application  amount_of_subsidy dvcall  max_rain_hour max_rain_day sunlight_hour sunlight_percent  {
                replace `var'=0 if `var'==.
}

*take log value
foreach var of varlist  average_temp highest_temp_day lowest_temp_day highest_temp lowest_temp sum_rain max_rain_hour max_rain_day sunlight_hour sunlight_percent humidity humidity_hpa unemployment unemployment_rate municipality_income real_income expenditure disposable_income working_hour consumption_index composite_index covid_infections_daily_ave covid_infections_daily_agg covid_death_daily_ave covid_death_daily_agg stringency_index bankruptcy claims_for_subsidy  accepted_application  amount_of_subsidy dvcall  {
                gen ln`var'=ln(`var'+1)
}



**** treatment variable (unemployment rate)****
sum unemployment_rate if firstlockdown==1 , detail
sum unemployment_rate if secondlockdown==1 , detail
sum unemployment_rate if secondlockdown==0 & firstlockdown==0 , detail
gen un=0
replace un=1 if unemployment_rate>=2.5
replace un=1 if unemployment_rate>=2.2 & firstlockdown==1
replace un=1 if unemployment_rate>=2.4 & secondlockdown==1

gen lockdown_pm25=lockdown*PM25_mean
gen ddd1= firstlockdown_highpm*un 
gen ddd2= secondlockdown_highpm*un 
gen dd1= highpm25*un 
gen dd2= un*firstlockdown
gen dd3= un*secondlockdown


*generate variables of suicide rate
gen sr=suicide_num/pop_all
gen lnsr=ln(sr)
sum lnsr

gen sr_men=suicide_num_men/pop_all_men
gen lnsr_men=ln(sr_men)
sum lnsr_men

gen sr_women=suicide_num_women/pop_all_women
gen lnsr_women=ln(sr_women)
sum lnsr_women

gen pop_ch=pop_04 + pop_59 + pop_1014 + pop_1519
gen pop_ch_men=pop_04_men + pop_59_men + pop_1014_men + pop_1519_men
gen pop_ch_women=pop_04_women + pop_59_women + pop_1014_women + pop_1519_women

gen sr_ch=suicide_age_0_19/pop_ch
gen lnsr_ch=ln(sr_ch)
sum lnsr_ch

gen sr_ch_men=suicide_age_0_19_men/pop_ch_men
gen lnsr_ch_men=ln(sr_ch_men)
sum lnsr_ch_men

gen sr_ch_women=suicide_age_0_19_women/pop_ch_women
gen lnsr_ch_women=ln(sr_ch_women)
sum lnsr_ch_women

egen suicide_ad = rowtotal(suicide_age_20_29 suicide_age_30_39 suicide_age_40_49 suicide_age_50_59 suicide_age_60_69)
egen pop_ad = rowtotal(pop_2024 pop_2529 pop_3034 pop_3539 pop_4044 pop_4549 pop_5054 pop_5559 pop_6064 pop_6569)
gen sr_ad=suicide_ad/pop_ad
gen lnsr_ad=ln(sr_ad)
sum lnsr_ad

egen suicide_ad_men = rowtotal(suicide_age_20_29_men suicide_age_30_39_men suicide_age_40_49_men suicide_age_50_59_men suicide_age_60_69_men)
egen pop_ad_men = rowtotal(pop_2024_men pop_2529_men pop_3034_men pop_3539_men pop_4044_men pop_4549_men pop_5054_men pop_5559_men pop_6064_men pop_6569_men)
gen sr_ad_men=suicide_ad_men/pop_ad_men
gen lnsr_ad_men=ln(sr_ad_men)
sum lnsr_ad_men

egen suicide_ad_women = rowtotal(suicide_age_20_29_women suicide_age_30_39_women suicide_age_40_49_women suicide_age_50_59_women suicide_age_60_69_women)
egen pop_ad_women = rowtotal(pop_2024_women pop_2529_women pop_3034_women pop_3539_women pop_4044_women pop_4549_women pop_5054_women pop_5559_women pop_6064_women pop_6569_women)
gen sr_ad_women=suicide_ad_women/pop_ad_women
gen lnsr_ad_women=ln(sr_ad_women)
sum lnsr_ad_women

egen suicide_el = rowtotal(suicide_age_70_79 suicide_age_80)
egen pop_el = rowtotal(pop_7074 pop_7579 pop_8084 pop_8589 pop_9094 pop_9599 pop_o100)
gen sr_el=suicide_el/pop_el
gen lnsr_el=ln(sr_el)
sum lnsr_el

gen sr_home=suicide_reason_home/pop_all
gen lnsr_home=ln(sr_home)
sum lnsr_home

gen sr_home_men=suicide_reason_home_men/pop_all_men
gen lnsr_home_men=ln(sr_home_men)
sum lnsr_home_men
gen sr_home_women=suicide_reason_home_women/pop_all_women
gen lnsr_home_women=ln(sr_home_women)
sum lnsr_home_women

gen sr_health=suicide_reason_health/pop_all
gen lnsr_health=ln(sr_health)
sum lnsr_health

gen sr_econ=suicide_reason_eco/pop_all
gen lnsr_econ=ln(sr_econ)
sum lnsr_econ

gen sr_econ_men=suicide_reason_eco_men/pop_all
gen lnsr_econ_men=ln(sr_econ_men)
sum lnsr_econ_men

gen sr_econ_women=suicide_reason_eco_women/pop_all
gen lnsr_econ_women=ln(sr_econ_women)
sum lnsr_econ_women


gen sr_labor=suicide_reason_labor/pop_all
gen lnsr_labor=ln(sr_labor)
sum lnsr_labor

gen sr_sex=suicide_reason_sex/pop_all
gen lnsr_sex=ln(sr_sex)
sum lnsr_sex

gen sr_other=suicide_reason_other/pop_all
gen lnsr_other=ln(sr_other)
sum lnsr_other

gen sr_school=suicide_reason_school/pop_ch
gen lnsr_school=ln(sr_school)
sum lnsr_school



*drop missing variables 
drop if PM25_mean==.



*change name
rename ddd1 firstlockdown_highpm_un 
rename ddd2 secondlockdown_highpm_un 
rename dd1 highpm25_un 
rename dd2 firstlockdown_un
rename dd3 secondlockdown_un


rename lockdown_highpm COVIDwave_highpm
rename firstlockdown firstwave
rename secondlockdown secondwave
rename firstlockdown_highpm firstwave_highpm
rename secondlockdown_highpm secondwave_highpm
rename firstlockdown_highpm_un firstwave_highpm_un
rename secondlockdown_highpm_un secondwave_highpm_un
rename firstlockdown_un firstwave_un
rename secondlockdown_un secondwave_un


cd "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\tables"
**************************
**   Model Estimation   **
local ld2  firstwave  secondwave highpm25 un highpm25_un firstwave_highpm secondwave_highpm firstwave_un secondwave_un firstwave_highpm_un  secondwave_highpm_un  

**************************
**   DDD Specification  **
**************************
quietly reghdfe lnsr_ad `ld2'  ,absorb( i.yearid*##i.prefectureid*  i.monthid*##i.prefectureid*  yearid* prefectureid* monthid*) 
eststo ad_ddd 
quietly reghdfe lnsr_ch `ld2'   , absorb( i.yearid*##i.prefectureid*  i.monthid*##i.prefectureid*  yearid* prefectureid* monthid*) 
eststo ch_ddd 

quietly reghdfe lnsr_ad_men `ld2'  , absorb( i.yearid*##i.prefectureid*  i.monthid*##i.prefectureid*  yearid* prefectureid* monthid*) 
eststo ad_men_ddd 
quietly reghdfe lnsr_ch_men `ld2'   , absorb( i.yearid*##i.prefectureid*  i.monthid*##i.prefectureid*  yearid* prefectureid* monthid*)   
eststo ch_men_ddd 

quietly reghdfe lnsr_ad_women `ld2'  , absorb( i.yearid*##i.prefectureid*  i.monthid*##i.prefectureid*  yearid* prefectureid* monthid*) 
eststo ad_women_ddd 
quietly reghdfe lnsr_ch_women `ld2'   , absorb( i.yearid*##i.prefectureid*  i.monthid*##i.prefectureid*  yearid* prefectureid* monthid*)   
eststo ch_women_ddd 

esttab ad_ddd ch_ddd ad_men_ddd ch_men_ddd ad_women_ddd ch_women_ddd using Table2.tex, b(4) se r2 star(* 0.10 ** 0.05 *** 0.05) title(DDD Estimation (PM2.5)) replace



**************************
**   DID Specification  **
**************************
local ld1  firstwave  secondwave highpm25 un highpm25_un firstwave_highpm secondwave_highpm firstwave_un secondwave_un 

quietly reghdfe lnsr_ad `ld1'  , absorb( i.yearid*##i.prefectureid*  i.monthid*##i.prefectureid*  yearid* prefectureid* monthid*) 
eststo ad_dd
quietly reghdfe lnsr_ch `ld1'   , absorb( i.yearid*##i.prefectureid*  i.monthid*##i.prefectureid*  yearid* prefectureid* monthid*)   
eststo ch_dd

quietly reghdfe lnsr_ad_men `ld1'  , absorb( i.yearid*##i.prefectureid*  i.monthid*##i.prefectureid*  yearid* prefectureid* monthid*) 
eststo ad_men_dd 
quietly reghdfe lnsr_ch_men `ld1'   , absorb( i.yearid*##i.prefectureid*  i.monthid*##i.prefectureid*  yearid* prefectureid* monthid*)   
eststo ch_men_dd 

quietly reghdfe lnsr_ad_women `ld1'  , absorb( i.yearid*##i.prefectureid*  i.monthid*##i.prefectureid*  yearid* prefectureid* monthid*) 
eststo ad_women_dd 
quietly reghdfe lnsr_ch_women `ld1'   , absorb( i.yearid*##i.prefectureid*  i.monthid*##i.prefectureid*  yearid* prefectureid* monthid*)   
eststo ch_women_dd 

esttab ad_dd ch_dd ad_men_dd ch_men_dd ad_women_dd ch_women_dd using Table3.tex, b(4) se r2 star(* 0.10 ** 0.05 *** 0.05) title(DID Estimation (PM2.5)) replace



**************************
























