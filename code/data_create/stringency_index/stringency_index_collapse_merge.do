clear all 
insheet using "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\stringency_index\stringency_index_complete.csv"


collapse (mean) stringency_index, by (month year)

sort year month 

order month year

save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\stringency_index\stringency_index_complete.dta",replace