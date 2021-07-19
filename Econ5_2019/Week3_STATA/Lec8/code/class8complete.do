/*	
Econ 5/Poli 5D Class 8
In-class Activity
	
Instructions:
Below is some partially completed code. Using the comments as a guide,
complete the code. Remember to use the "help" command when needed. Work
in small groups and feel free to ask questions and help others around you.

Variable description:
id: unique passenger id
class: 0 = crew, 1 = first, 2 = second, 3 = third
adult: 1 = adult, 0 = child
male: 1 = male, 0 = female
survive: 1 = survived, 0 = didn't survive
*******************************************************************************/

* Start-up commands
capture log close
clear

********************************************************************************

* 1. Change your directory to the correct path
cd 

* 2. Create a log file
log using class8log.txt, text replace

* 3. Load titanic.dta
use titanic, clear

* 4. Show summary statistics for the variables adult, male, and survive
sum adult - survive

* 5. Determine the frequency of survival by class and show percentages 
*	 (hint: use the row option)
tab class survive, row

* 6. Create a string variable called crew = "yes" if class == 0, "no" otherwise
gen str crew = "no"
replace crew = "yes" if class == 0

* 7. Keep the observations where crew == "no"
keep if crew == "no"

* 8.0 Generate a new variable called mean_survive equal to the mean survival rate
egen mean_survive = mean(survive)

* 8.1 Add a label to mean_survive (in quotes below)
label var mean_survive "mean survival rate among all adult passengers"

* 8.2 Display the value of mean_survive (hint: use tab)
tab mean_survive

* 9. Sort the data by class adult male id
sort class adult male id

/* 10.1 create a new variable called "survive_by_group" equal to the average 
survival rate within each class-age-gender group. */
by class adult male: egen survive_by_group = mean(survive)

/* 10.2 Show the value of survive_by_group for:
		1. male adults in third class 
		2. female adults in first class. */
tab survive_by_group if male == 1 & class == 3 & adult == 1
tab survive_by_group if male == 0 & class == 1 & adult == 0

* 10.3 Change the name of survive_by_group to survive_bg
rename survive_by_group survive_bg  

/* Now we will coarsen the unit of analysis from person-level to group-level 
(each group consists of a unique class-age-gender combination). Code that
produces the group identifier has been completed for you. */

by class adult male: gen group_id = _n if _n == 1
by class adult male: gen num_in_group = _N if _n == 1
replace group_id = sum(group_id) if !missing(group_id)

* 11. Keep only observations where group_id is not missing
keep if !missing(group_id)

* 12. Remove the following variables: id survive crew
drop id survive crew

* 13. Order the variables to put the group_id variable first
order group_id

* 14. Sort the observations in increasing order by survive_bg
sort survive_bg

* 15. Display the observations for which survive_bg > mean_survive
li if survive_bg > mean_survive

log close
