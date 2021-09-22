clear all 
use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\working_data\descriptive_statistics.dta"

*regenerating variables of suicide rate per 100K population
gen SuicideRate=suicide_num/pop_all*100000

gen SuicideRateamongMale=suicide_num_men/pop_all_men*100000


gen SuicideRateamongFemale=suicide_num_women/pop_all_women*100000


gen SuicideRateamongChildren=suicide_age_0_19/pop_ch*100000


gen SuicideRateamongMaleChildren=suicide_age_0_19_men/pop_ch_men*100000


gen SuicideRateamongFemaleChildren=suicide_age_0_19_women/pop_ch_women*100000

gen SuicideRateamongAdult=suicide_ad/pop_ad*100000

gen SuicideRateamongMaleAdult=suicide_ad_men/pop_ad_men*100000

gen SuicideRateamongFemaleAdult=suicide_ad_women/pop_ad_women*100000



*chage name of variables
rename PM25_mean PM25
rename unemployment_rate UnemploymentRate



cd "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\tables"
local summary SuicideRate SuicideRateamongMale SuicideRateamongFemale SuicideRateamongChildren SuicideRateamongMaleChildren SuicideRateamongFemaleChildren SuicideRateamongAdult SuicideRateamongMaleAdult SuicideRateamongFemaleAdult PM25 UnemploymentRate


estpost sum `summary'  
esttab using Table_A1.tex, replace cells("count mean(fmt(%5.2f)) sd(fmt(%5.2f)) min(fmt(%5.2f)) max(fmt(%5.2f))") title(Descriptive Statistics) noobs nomtitle nonumber b(3)

estpost sum `summary'   if COVIDwave==1
esttab using Table_A2.tex, replace cells("count mean(fmt(%5.2f)) sd(fmt(%5.2f)) min(fmt(%5.2f)) max(fmt(%5.2f))")  title(Descriptive Statistics During COVID) noobs nomtitle nonumber b(3)

estpost sum `summary'   if firstwave==1
esttab using Table_A3.tex, replace cells("count mean(fmt(%5.2f)) sd(fmt(%5.2f)) min(fmt(%5.2f)) max(fmt(%5.2f))")  title(Descriptive Statistics During First Wave) noobs nomtitle nonumber b(3) 

estpost sum `summary'   if secondwave==1
esttab using Table_A4.tex, replace cells("count mean(fmt(%5.2f)) sd(fmt(%5.2f)) min(fmt(%5.2f)) max(fmt(%5.2f))")  title(Descriptive Statistics During Second Wave) noobs nomtitle nonumber b(3) 
*/