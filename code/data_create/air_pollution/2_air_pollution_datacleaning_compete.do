clear all

use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\air_pollution\air_pollution_nation.dta"


gen edate = date(date, "YMD")
format edate %td
gen day=day(edate)

order date day month year prefecture_num


sort prefecture_num year month day    

********************************************************************************************************
egen PM25_mean=mean( pm25 ) if prefecture_num==1 & year==2014 & month==1


forvalues i=1/47{
forvalues j=1/12{
egen averagePM25_2014_`j'_`i'=mean( pm25 ) if prefecture_num==`i' & year==2014 & month==`j'
replace PM25_mean= abs(averagePM25_2014_`j'_`i') if prefecture_num==`i' & year==2014 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averagePM25_2015_`j'_`i'=mean( pm25 ) if prefecture_num==`i' & year==2015 & month==`j'
replace PM25_mean= abs(averagePM25_2015_`j'_`i') if prefecture_num==`i' & year==2015 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averagePM25_2016_`j'_`i'=mean( pm25 ) if prefecture_num==`i' & year==2016 & month==`j'
replace PM25_mean= abs(averagePM25_2016_`j'_`i') if prefecture_num==`i' & year==2016 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averagePM25_2017_`j'_`i'=mean( pm25 ) if prefecture_num==`i' & year==2017 & month==`j'
replace PM25_mean= abs(averagePM25_2017_`j'_`i') if prefecture_num==`i' & year==2017 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averagePM25_2018_`j'_`i'=mean( pm25 ) if prefecture_num==`i' & year==2018 & month==`j'
replace PM25_mean= abs(averagePM25_2018_`j'_`i') if prefecture_num==`i' & year==2018 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averagePM25_2019_`j'_`i'=mean( pm25 ) if prefecture_num==`i' & year==2019 & month==`j'
replace PM25_mean= abs(averagePM25_2019_`j'_`i') if prefecture_num==`i' & year==2019 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averagePM25_2020_`j'_`i'=mean( pm25 ) if prefecture_num==`i' & year==2020 & month==`j'
replace PM25_mean= abs(averagePM25_2020_`j'_`i') if prefecture_num==`i' & year==2020 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/5{
egen averagePM25_2021_`j'_`i'=mean( pm25 ) if prefecture_num==`i' & year==2021 & month==`j'
replace PM25_mean= abs(averagePM25_2021_`j'_`i') if prefecture_num==`i' & year==2021 & month==`j'
}
}

keep date day month year prefecture_num pm25 pm10 o3 no2 so2 co edate PM25_mean 


********************************************************************************************************
*generate variable represents total month vale of PM2.5 in each prefecture

egen PM25_sum=total( pm25 ) if prefecture_num==1 & year==2014 & month==1

forvalues i=1/47{
forvalues j=1/12{
egen totalPM25_2014_`j'_`i'=total( pm25 ) if prefecture_num==`i' & year==2014 & month==`j'
replace PM25_sum= abs(totalPM25_2014_`j'_`i') if prefecture_num==`i' & year==2014 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalPM25_2015_`j'_`i'=total( pm25 ) if prefecture_num==`i' & year==2015 & month==`j'
replace PM25_sum= abs(totalPM25_2015_`j'_`i') if prefecture_num==`i' & year==2015 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalPM25_2016_`j'_`i'=total( pm25 ) if prefecture_num==`i' & year==2016 & month==`j'
replace PM25_sum= abs(totalPM25_2016_`j'_`i') if prefecture_num==`i' & year==2016 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalPM25_2017_`j'_`i'=total( pm25 ) if prefecture_num==`i' & year==2017 & month==`j'
replace PM25_sum= abs(totalPM25_2017_`j'_`i') if prefecture_num==`i' & year==2017 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalPM25_2018_`j'_`i'=total( pm25 ) if prefecture_num==`i' & year==2018 & month==`j'
replace PM25_sum= abs(totalPM25_2018_`j'_`i') if prefecture_num==`i' & year==2018 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalPM25_2019_`j'_`i'=total( pm25 ) if prefecture_num==`i' & year==2019 & month==`j'
replace PM25_sum= abs(totalPM25_2019_`j'_`i') if prefecture_num==`i' & year==2019 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalPM25_2020_`j'_`i'=total( pm25 ) if prefecture_num==`i' & year==2020 & month==`j'
replace PM25_sum= abs(totalPM25_2020_`j'_`i') if prefecture_num==`i' & year==2020 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/5{
egen totalPM25_2021_`j'_`i'=total( pm25 ) if prefecture_num==`i' & year==2021 & month==`j'
replace PM25_sum= abs(totalPM25_2021_`j'_`i') if prefecture_num==`i' & year==2021 & month==`j'
}
}


keep date day month year prefecture_num pm25 pm10 o3 no2 so2 co edate PM25_mean PM25_sum

********************************************PM10************************************************************
*generate variable represents average month vale of PM10 in each prefecture

egen PM10_mean=mean( pm10 ) if prefecture_num==1 & year==2014 & month==1


forvalues i=1/47{
forvalues j=1/12{
egen averagePM10_2014_`j'_`i'=mean( pm10 ) if prefecture_num==`i' & year==2014 & month==`j'
replace PM10_mean= abs(averagePM10_2014_`j'_`i') if prefecture_num==`i' & year==2014 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averagePM10_2015_`j'_`i'=mean( pm10 ) if prefecture_num==`i' & year==2015 & month==`j'
replace PM10_mean= abs(averagePM10_2015_`j'_`i') if prefecture_num==`i' & year==2015 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averagePM10_2016_`j'_`i'=mean( pm10 ) if prefecture_num==`i' & year==2016 & month==`j'
replace PM10_mean= abs(averagePM10_2016_`j'_`i') if prefecture_num==`i' & year==2016 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averagePM10_2017_`j'_`i'=mean( pm10 ) if prefecture_num==`i' & year==2017 & month==`j'
replace PM10_mean= abs(averagePM10_2017_`j'_`i') if prefecture_num==`i' & year==2017 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averagePM10_2018_`j'_`i'=mean( pm10 ) if prefecture_num==`i' & year==2018 & month==`j'
replace PM10_mean= abs(averagePM10_2018_`j'_`i') if prefecture_num==`i' & year==2018 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averagePM10_2019_`j'_`i'=mean( pm10 ) if prefecture_num==`i' & year==2019 & month==`j'
replace PM10_mean= abs(averagePM10_2019_`j'_`i') if prefecture_num==`i' & year==2019 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averagePM10_2020_`j'_`i'=mean( pm10 ) if prefecture_num==`i' & year==2020 & month==`j'
replace PM10_mean= abs(averagePM10_2020_`j'_`i') if prefecture_num==`i' & year==2020 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/5{
egen averagePM10_2021_`j'_`i'=mean( pm10 ) if prefecture_num==`i' & year==2021 & month==`j'
replace PM10_mean= abs(averagePM10_2021_`j'_`i') if prefecture_num==`i' & year==2021 & month==`j'
}
}

keep date day month year prefecture_num pm25 pm10 o3 no2 so2 co edate PM25_mean PM25_sum PM10_mean


*generate variable represents total month vale of PM10 in each prefecture

egen PM10_sum=total( pm10 ) if prefecture_num==1 & year==2014 & month==1

forvalues i=1/47{
forvalues j=1/12{
egen totalPM10_2014_`j'_`i'=total( pm10 ) if prefecture_num==`i' & year==2014 & month==`j'
replace PM10_sum= abs(totalPM10_2014_`j'_`i') if prefecture_num==`i' & year==2014 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalPM10_2015_`j'_`i'=total( pm10 ) if prefecture_num==`i' & year==2015 & month==`j'
replace PM10_sum= abs(totalPM10_2015_`j'_`i') if prefecture_num==`i' & year==2015 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalPM10_2016_`j'_`i'=total( pm10 ) if prefecture_num==`i' & year==2016 & month==`j'
replace PM10_sum= abs(totalPM10_2016_`j'_`i') if prefecture_num==`i' & year==2016 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalPM10_2017_`j'_`i'=total( pm10 ) if prefecture_num==`i' & year==2017 & month==`j'
replace PM10_sum= abs(totalPM10_2017_`j'_`i') if prefecture_num==`i' & year==2017 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalPM10_2018_`j'_`i'=total( pm10 ) if prefecture_num==`i' & year==2018 & month==`j'
replace PM10_sum= abs(totalPM10_2018_`j'_`i') if prefecture_num==`i' & year==2018 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalPM10_2019_`j'_`i'=total( pm10 ) if prefecture_num==`i' & year==2019 & month==`j'
replace PM10_sum= abs(totalPM10_2019_`j'_`i') if prefecture_num==`i' & year==2019 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalPM10_2020_`j'_`i'=total( pm10 ) if prefecture_num==`i' & year==2020 & month==`j'
replace PM10_sum= abs(totalPM10_2020_`j'_`i') if prefecture_num==`i' & year==2020 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/5{
egen totalPM10_2021_`j'_`i'=total( pm10 ) if prefecture_num==`i' & year==2021 & month==`j'
replace PM10_sum= abs(totalPM10_2021_`j'_`i') if prefecture_num==`i' & year==2021 & month==`j'
}
}

keep date day month year prefecture_num pm25 pm10 o3 no2 so2 co edate PM25_mean PM25_sum PM10_mean PM10_sum

********************************************O3************************************************************
*generate variable represents average month vale of O3 in each prefecture

egen o3_mean=mean( o3 ) if prefecture_num==1 & year==2014 & month==1


forvalues i=1/47{
forvalues j=1/12{
egen averageo3_2014_`j'_`i'=mean( o3 ) if prefecture_num==`i' & year==2014 & month==`j'
replace o3_mean= abs(averageo3_2014_`j'_`i') if prefecture_num==`i' & year==2014 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageo3_2015_`j'_`i'=mean( o3 ) if prefecture_num==`i' & year==2015 & month==`j'
replace o3_mean= abs(averageo3_2015_`j'_`i') if prefecture_num==`i' & year==2015 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageo3_2016_`j'_`i'=mean( o3 ) if prefecture_num==`i' & year==2016 & month==`j'
replace o3_mean= abs(averageo3_2016_`j'_`i') if prefecture_num==`i' & year==2016 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageo3_2017_`j'_`i'=mean( o3 ) if prefecture_num==`i' & year==2017 & month==`j'
replace o3_mean= abs(averageo3_2017_`j'_`i') if prefecture_num==`i' & year==2017 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageo3_2018_`j'_`i'=mean( o3 ) if prefecture_num==`i' & year==2018 & month==`j'
replace o3_mean= abs(averageo3_2018_`j'_`i') if prefecture_num==`i' & year==2018 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageo3_2019_`j'_`i'=mean( o3 ) if prefecture_num==`i' & year==2019 & month==`j'
replace o3_mean= abs(averageo3_2019_`j'_`i') if prefecture_num==`i' & year==2019 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageo3_2020_`j'_`i'=mean( o3 ) if prefecture_num==`i' & year==2020 & month==`j'
replace o3_mean= abs(averageo3_2020_`j'_`i') if prefecture_num==`i' & year==2020 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/5{
egen averageo3_2021_`j'_`i'=mean( o3 ) if prefecture_num==`i' & year==2021 & month==`j'
replace o3_mean= abs(averageo3_2021_`j'_`i') if prefecture_num==`i' & year==2021 & month==`j'
}
}

keep date day month year prefecture_num pm25 pm10 o3 no2 so2 co edate PM25_mean PM25_sum PM10_mean PM10_sum o3_mean

*generate variable represents total month vale of O3 in each prefecture

egen o3_sum=total( o3 ) if prefecture_num==1 & year==2014 & month==1

forvalues i=1/47{
forvalues j=1/12{
egen totalo3_2014_`j'_`i'=total( o3 ) if prefecture_num==`i' & year==2014 & month==`j'
replace o3_sum= abs(totalo3_2014_`j'_`i') if prefecture_num==`i' & year==2014 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalo3_2015_`j'_`i'=total( o3 ) if prefecture_num==`i' & year==2015 & month==`j'
replace o3_sum= abs(totalo3_2015_`j'_`i') if prefecture_num==`i' & year==2015 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalo3_2016_`j'_`i'=total( o3 ) if prefecture_num==`i' & year==2016 & month==`j'
replace o3_sum= abs(totalo3_2016_`j'_`i') if prefecture_num==`i' & year==2016 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalo3_2017_`j'_`i'=total( o3 ) if prefecture_num==`i' & year==2017 & month==`j'
replace o3_sum= abs(totalo3_2017_`j'_`i') if prefecture_num==`i' & year==2017 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalo3_2018_`j'_`i'=total( o3 ) if prefecture_num==`i' & year==2018 & month==`j'
replace o3_sum= abs(totalo3_2018_`j'_`i') if prefecture_num==`i' & year==2018 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalo3_2019_`j'_`i'=total( o3 ) if prefecture_num==`i' & year==2019 & month==`j'
replace o3_sum= abs(totalo3_2019_`j'_`i') if prefecture_num==`i' & year==2019 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalo3_2020_`j'_`i'=total( o3 ) if prefecture_num==`i' & year==2020 & month==`j'
replace o3_sum= abs(totalo3_2020_`j'_`i') if prefecture_num==`i' & year==2020 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/5{
egen totalo3_2021_`j'_`i'=total( o3 ) if prefecture_num==`i' & year==2021 & month==`j'
replace o3_sum= abs(totalo3_2021_`j'_`i') if prefecture_num==`i' & year==2021 & month==`j'
}
}

keep date day month year prefecture_num pm25 pm10 o3 no2 so2 co edate PM25_mean PM25_sum PM10_mean PM10_sum o3_mean o3_sum

********************************************no2************************************************************
*generate variable represents average month vale of NO2 in each prefecture

egen no2_mean=mean( no2 ) if prefecture_num==1 & year==2014 & month==1


forvalues i=1/47{
forvalues j=1/12{
egen averageno2_2014_`j'_`i'=mean( no2 ) if prefecture_num==`i' & year==2014 & month==`j'
replace no2_mean= abs(averageno2_2014_`j'_`i') if prefecture_num==`i' & year==2014 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageno2_2015_`j'_`i'=mean( no2 ) if prefecture_num==`i' & year==2015 & month==`j'
replace no2_mean= abs(averageno2_2015_`j'_`i') if prefecture_num==`i' & year==2015 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageno2_2016_`j'_`i'=mean( no2 ) if prefecture_num==`i' & year==2016 & month==`j'
replace no2_mean= abs(averageno2_2016_`j'_`i') if prefecture_num==`i' & year==2016 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageno2_2017_`j'_`i'=mean( no2 ) if prefecture_num==`i' & year==2017 & month==`j'
replace no2_mean= abs(averageno2_2017_`j'_`i') if prefecture_num==`i' & year==2017 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageno2_2018_`j'_`i'=mean( no2 ) if prefecture_num==`i' & year==2018 & month==`j'
replace no2_mean= abs(averageno2_2018_`j'_`i') if prefecture_num==`i' & year==2018 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageno2_2019_`j'_`i'=mean( no2 ) if prefecture_num==`i' & year==2019 & month==`j'
replace no2_mean= abs(averageno2_2019_`j'_`i') if prefecture_num==`i' & year==2019 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageno2_2020_`j'_`i'=mean( no2 ) if prefecture_num==`i' & year==2020 & month==`j'
replace no2_mean= abs(averageno2_2020_`j'_`i') if prefecture_num==`i' & year==2020 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/5{
egen averageno2_2021_`j'_`i'=mean( no2 ) if prefecture_num==`i' & year==2021 & month==`j'
replace no2_mean= abs(averageno2_2021_`j'_`i') if prefecture_num==`i' & year==2021 & month==`j'
}
}

keep date day month year prefecture_num pm25 pm10 o3 no2 so2 co edate PM25_mean PM25_sum PM10_mean PM10_sum o3_mean o3_sum no2_mean


*generate variable represents total month vale of NO2 in each prefecture

egen no2_sum=total( no2 ) if prefecture_num==1 & year==2014 & month==1

forvalues i=1/47{
forvalues j=1/12{
egen totalno2_2014_`j'_`i'=total( no2 ) if prefecture_num==`i' & year==2014 & month==`j'
replace no2_sum= abs(totalno2_2014_`j'_`i') if prefecture_num==`i' & year==2014 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalno2_2015_`j'_`i'=total( no2 ) if prefecture_num==`i' & year==2015 & month==`j'
replace no2_sum= abs(totalno2_2015_`j'_`i') if prefecture_num==`i' & year==2015 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalno2_2016_`j'_`i'=total( no2 ) if prefecture_num==`i' & year==2016 & month==`j'
replace no2_sum= abs(totalno2_2016_`j'_`i') if prefecture_num==`i' & year==2016 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalno2_2017_`j'_`i'=total( no2 ) if prefecture_num==`i' & year==2017 & month==`j'
replace no2_sum= abs(totalno2_2017_`j'_`i') if prefecture_num==`i' & year==2017 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalno2_2018_`j'_`i'=total( no2 ) if prefecture_num==`i' & year==2018 & month==`j'
replace no2_sum= abs(totalno2_2018_`j'_`i') if prefecture_num==`i' & year==2018 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalno2_2019_`j'_`i'=total( no2 ) if prefecture_num==`i' & year==2019 & month==`j'
replace no2_sum= abs(totalno2_2019_`j'_`i') if prefecture_num==`i' & year==2019 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalno2_2020_`j'_`i'=total( no2 ) if prefecture_num==`i' & year==2020 & month==`j'
replace no2_sum= abs(totalno2_2020_`j'_`i') if prefecture_num==`i' & year==2020 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/5{
egen totalno2_2021_`j'_`i'=total( no2 ) if prefecture_num==`i' & year==2021 & month==`j'
replace no2_sum= abs(totalno2_2021_`j'_`i') if prefecture_num==`i' & year==2021 & month==`j'
}
}

keep date day month year prefecture_num pm25 pm10 o3 no2 so2 co edate PM25_mean PM25_sum PM10_mean PM10_sum o3_mean o3_sum no2_mean no2_sum


********************************************so2************************************************************
*generate variable represents average month vale of SO2 in each prefecture

egen so2_mean=mean( so2 ) if prefecture_num==1 & year==2014 & month==1


forvalues i=1/47{
forvalues j=1/12{
egen averageso2_2014_`j'_`i'=mean( so2 ) if prefecture_num==`i' & year==2014 & month==`j'
replace so2_mean= abs(averageso2_2014_`j'_`i') if prefecture_num==`i' & year==2014 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageso2_2015_`j'_`i'=mean( so2 ) if prefecture_num==`i' & year==2015 & month==`j'
replace so2_mean= abs(averageso2_2015_`j'_`i') if prefecture_num==`i' & year==2015 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageso2_2016_`j'_`i'=mean( so2 ) if prefecture_num==`i' & year==2016 & month==`j'
replace so2_mean= abs(averageso2_2016_`j'_`i') if prefecture_num==`i' & year==2016 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageso2_2017_`j'_`i'=mean( so2 ) if prefecture_num==`i' & year==2017 & month==`j'
replace so2_mean= abs(averageso2_2017_`j'_`i') if prefecture_num==`i' & year==2017 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageso2_2018_`j'_`i'=mean( so2 ) if prefecture_num==`i' & year==2018 & month==`j'
replace so2_mean= abs(averageso2_2018_`j'_`i') if prefecture_num==`i' & year==2018 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageso2_2019_`j'_`i'=mean( so2 ) if prefecture_num==`i' & year==2019 & month==`j'
replace so2_mean= abs(averageso2_2019_`j'_`i') if prefecture_num==`i' & year==2019 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageso2_2020_`j'_`i'=mean( so2 ) if prefecture_num==`i' & year==2020 & month==`j'
replace so2_mean= abs(averageso2_2020_`j'_`i') if prefecture_num==`i' & year==2020 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/5{
egen averageso2_2021_`j'_`i'=mean( so2 ) if prefecture_num==`i' & year==2021 & month==`j'
replace so2_mean= abs(averageso2_2021_`j'_`i') if prefecture_num==`i' & year==2021 & month==`j'
}
}

keep date day month year prefecture_num pm25 pm10 o3 no2 so2 co edate PM25_mean PM25_sum PM10_mean PM10_sum o3_mean o3_sum no2_mean no2_sum so2_mean

*generate variable represents total month vale of SO2 in each prefecture


egen so2_sum=total( so2 ) if prefecture_num==1 & year==2014 & month==1

forvalues i=1/47{
forvalues j=1/12{
egen totalso2_2014_`j'_`i'=total( so2 ) if prefecture_num==`i' & year==2014 & month==`j'
replace so2_sum= abs(totalso2_2014_`j'_`i') if prefecture_num==`i' & year==2014 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalso2_2015_`j'_`i'=total( so2 ) if prefecture_num==`i' & year==2015 & month==`j'
replace so2_sum= abs(totalso2_2015_`j'_`i') if prefecture_num==`i' & year==2015 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalso2_2016_`j'_`i'=total( so2 ) if prefecture_num==`i' & year==2016 & month==`j'
replace so2_sum= abs(totalso2_2016_`j'_`i') if prefecture_num==`i' & year==2016 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalso2_2017_`j'_`i'=total( so2 ) if prefecture_num==`i' & year==2017 & month==`j'
replace so2_sum= abs(totalso2_2017_`j'_`i') if prefecture_num==`i' & year==2017 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalso2_2018_`j'_`i'=total( so2 ) if prefecture_num==`i' & year==2018 & month==`j'
replace so2_sum= abs(totalso2_2018_`j'_`i') if prefecture_num==`i' & year==2018 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalso2_2019_`j'_`i'=total( so2 ) if prefecture_num==`i' & year==2019 & month==`j'
replace so2_sum= abs(totalso2_2019_`j'_`i') if prefecture_num==`i' & year==2019 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalso2_2020_`j'_`i'=total( so2 ) if prefecture_num==`i' & year==2020 & month==`j'
replace so2_sum= abs(totalso2_2020_`j'_`i') if prefecture_num==`i' & year==2020 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/5{
egen totalso2_2021_`j'_`i'=total( so2 ) if prefecture_num==`i' & year==2021 & month==`j'
replace so2_sum= abs(totalso2_2021_`j'_`i') if prefecture_num==`i' & year==2021 & month==`j'
}
}

keep date day month year prefecture_num pm25 pm10 o3 no2 so2 co edate PM25_mean PM25_sum PM10_mean PM10_sum o3_mean o3_sum no2_mean no2_sum so2_mean so2_sum

********************************************co************************************************************
*generate variable represents average month vale of CO in each prefecture
egen co_mean=mean( co ) if prefecture_num==1 & year==2014 & month==1


forvalues i=1/47{
forvalues j=1/12{
egen averageco_2014_`j'_`i'=mean( co ) if prefecture_num==`i' & year==2014 & month==`j'
replace co_mean= abs(averageco_2014_`j'_`i') if prefecture_num==`i' & year==2014 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageco_2015_`j'_`i'=mean( co ) if prefecture_num==`i' & year==2015 & month==`j'
replace co_mean= abs(averageco_2015_`j'_`i') if prefecture_num==`i' & year==2015 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageco_2016_`j'_`i'=mean( co ) if prefecture_num==`i' & year==2016 & month==`j'
replace co_mean= abs(averageco_2016_`j'_`i') if prefecture_num==`i' & year==2016 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageco_2017_`j'_`i'=mean( co ) if prefecture_num==`i' & year==2017 & month==`j'
replace co_mean= abs(averageco_2017_`j'_`i') if prefecture_num==`i' & year==2017 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageco_2018_`j'_`i'=mean( co ) if prefecture_num==`i' & year==2018 & month==`j'
replace co_mean= abs(averageco_2018_`j'_`i') if prefecture_num==`i' & year==2018 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageco_2019_`j'_`i'=mean( co ) if prefecture_num==`i' & year==2019 & month==`j'
replace co_mean= abs(averageco_2019_`j'_`i') if prefecture_num==`i' & year==2019 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen averageco_2020_`j'_`i'=mean( co ) if prefecture_num==`i' & year==2020 & month==`j'
replace co_mean= abs(averageco_2020_`j'_`i') if prefecture_num==`i' & year==2020 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/5{
egen averageco_2021_`j'_`i'=mean( co ) if prefecture_num==`i' & year==2021 & month==`j'
replace co_mean= abs(averageco_2021_`j'_`i') if prefecture_num==`i' & year==2021 & month==`j'
}
}

keep date day month year prefecture_num pm25 pm10 o3 no2 so2 co edate PM25_mean PM25_sum PM10_mean PM10_sum o3_mean o3_sum no2_mean no2_sum so2_mean so2_sum co_mean


*generate variable represents total month vale of CO in each prefecture

egen co_sum=total( co ) if prefecture_num==1 & year==2014 & month==1

forvalues i=1/47{
forvalues j=1/12{
egen totalco_2014_`j'_`i'=total( co ) if prefecture_num==`i' & year==2014 & month==`j'
replace co_sum= abs(totalco_2014_`j'_`i') if prefecture_num==`i' & year==2014 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalco_2015_`j'_`i'=total( co ) if prefecture_num==`i' & year==2015 & month==`j'
replace co_sum= abs(totalco_2015_`j'_`i') if prefecture_num==`i' & year==2015 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalco_2016_`j'_`i'=total( co ) if prefecture_num==`i' & year==2016 & month==`j'
replace co_sum= abs(totalco_2016_`j'_`i') if prefecture_num==`i' & year==2016 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalco_2017_`j'_`i'=total( co ) if prefecture_num==`i' & year==2017 & month==`j'
replace co_sum= abs(totalco_2017_`j'_`i') if prefecture_num==`i' & year==2017 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalco_2018_`j'_`i'=total( co ) if prefecture_num==`i' & year==2018 & month==`j'
replace co_sum= abs(totalco_2018_`j'_`i') if prefecture_num==`i' & year==2018 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalco_2019_`j'_`i'=total( co) if prefecture_num==`i' & year==2019 & month==`j'
replace co_sum= abs(totalco_2019_`j'_`i') if prefecture_num==`i' & year==2019 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/12{
egen totalco_2020_`j'_`i'=total( co ) if prefecture_num==`i' & year==2020 & month==`j'
replace co_sum= abs(totalco_2020_`j'_`i') if prefecture_num==`i' & year==2020 & month==`j'
}
}

forvalues i=1/47{
forvalues j=1/5{
egen totalco_2021_`j'_`i'=total( co ) if prefecture_num==`i' & year==2021 & month==`j'
replace co_sum= abs(totalco_2021_`j'_`i') if prefecture_num==`i' & year==2021 & month==`j'
}
}


keep prefecture_num date year month day pm25 pm10 o3 no2 so2 co PM25_mean PM25_sum PM10_mean PM10_sum o3_mean o3_sum no2_mean no2_sum so2_mean so2_sum co_mean co_sum


drop if day != 1


save "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\raw_data\organized_data\air_pollution\air_pollution_merge.dta", replace


































