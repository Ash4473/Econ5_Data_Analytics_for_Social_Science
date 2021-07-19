use "/Volumes/My Passport for Mac/NFHS/NFHS4/IAIR72FL.DTA", clear

cd "/Users/arushikaushik/Desktop/Teaching/Poli:Econ5/2020/Week5/Week5_Lab/Data"
tab v024

label list V024

keep if v024==29 | v024==2


keep caseid v001 v002 v003 v024 v025 v133 v190 bidx_* bord_* b0_* b1_* b2_* b4_* b5_*   s707 s716 


rename v001 cluster_id

rename v002 hh_id

rename v003  mother_id

rename v024 state

rename v025 rural

replace rural= rural-1
 label define rural 0 "urban" 1 "rural"
 label values rural rural

rename v133 mother_edu

rename v190 hh_wealth

rename bidx_0* bidx*
rename bidx_* bidx*

rename bord_0* bord*
rename bord_* bord*

rename b0_0* twin*
rename b0_* twin*

rename b1_0* birthmonth*
rename b1_* birthmonth*

rename b2_0* birthyear*
rename b2_* birthyear*

rename b4_0* gender*
rename b4_* gender*

rename b5_0* Alive*
rename b5_* Alive*



rename s707 mother_smokes

rename s716 mother_drinks

reshape long bidx bord twin birthmonth birthyear gender Alive , i(caseid) j(birth_index)

replace twin=1 if twin>0 & twin!= .
label define twin 0 "no" 1 "yes"
label values twin twin

label define gender 0 "male" 1 "female"
replace gender= gender-1
label values gender gender

rename gender female

save "raw_data", replace


use "raw_data.dta", clear
keep state caseid cluster_id hh_id hh_wealth 
tostring cluster_id, gen(cluster_str)
tostring hh_id, gen(hh_str)
gen dum_id= cluster_str + hh_str
duplicates drop caseid, force
duplicates drop dum_id, force

drop cluster_str hh_str caseid dum_id
save "hh_data.dta", replace




use "raw_data.dta", clear

keep caseid mother_id state mother_edu mother_smokes mother_drinks
duplicates drop caseid, force
save "mother_data.dta", replace




use "raw_data.dta", clear
drop mother_edu hh_wealth mother_smokes mother_drinks CurrentAge

rename birth_index child_id

label var mother_id "mother's ID number"
label var rural "Rural or Urban"

drop bidx

label var bord "Birth Order number"

label var twin "Whether twin or not"

label var birthmonth "Month of birth"

label var birthyear "Year of Birth"

label var female "Whether female or male"

label var Alive "Whether alive or not"


label var child_id "Child's ID no."

reshape wide bord twin birthmonth birthyear female Alive , i(caseid) j(child_id)

order caseid cluster_id hh_id mother_id state rural bord* twin* birthmonth* birthyear* female* Alive* 

save "cleaned_data.dta", replace

keep if state==2
label data "DHS data 2015-16: Andhra Pradesh Sample"
save "child_data_AP.dta", replace

use "cleaned_data.dta", clear
keep if state==29
label data "DHS data 2015-16: Rajasthan Sample"
save "child_data_Rajasthan.dta", replace


reg Alive female twin bord rural mother_edu hh_wealth s707 s716

reg Alive female twin bord rural mother_edu hh_wealth s707 s716 if state==2

reg Alive female twin bord rural mother_edu hh_wealth s707 s716 if state==25

reg Alive female twin bord rural mother_edu hh_wealth s707 s716 if state==29








