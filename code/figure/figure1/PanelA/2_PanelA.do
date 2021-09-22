use "C:\Users\managi-lab\Dropbox (managi-lab)\M2フォルダ\Okuyama\Air_pollution\submission\data\figure\figure1\PanelA\data_PanalA.dta",clear



twoway ///
(connected suicide_num year if code==1 ) ///
(connected suicide_num year if code==2 ) ///
(connected suicide_num year if code==3 ) ///
, xtitle(Year) ytitle (Number of Suicide) legend(label(1 "Combined") label(2 "Male") label(3 "Female")  label(4 "Fitted line (Combined)") label(5 "Fitted line (Male)") label(6 "Fitted line (Female)"))

