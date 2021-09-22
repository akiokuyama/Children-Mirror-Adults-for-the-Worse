clear all 
use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\working_data\descriptive_statistics.dta"

corr unemployment_rate PM25_mean if firstwave==1
corr unemployment_rate PM25_mean if secondwave==1