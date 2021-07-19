/*	
Econ 5/Poli 5D, Class 9
In-class Activity
	
Instructions:
Below is some partially completed code. Using the comments as a guide,
finish the code. Remember to use the "help" command when needed. I 
recommend trying each line of code in the command window before moving on
in the do file. 

Submit a completed do-file and log file named as LastName_FirstName_class9. 
Write your Name and PID at the top of teh do-file.
*******************************************************************************/

// Start-up commands
capture log close
clear all
graph drop _all
set autotabgraphs on

********************************************************************************
* Appending
********************************************************************************

*	Change your directory
	cd "/Users/arushikaushik/Desktop/Teaching/Poli:Econ5/2020/Week5/Class9/Data"

/*	Start a log called LastName_FirstName_class9.txt.*/
	log using Kaushik_Arushi_class9.txt, text replace

/*	Watch the following YouTube video on appending. No code is required here,
	but feel free to follow along with the video to try appending:
	https://www.youtube.com/watch?v=AZGW8tohiqw */

/*	Now we will append some data. Download person2015.dta, person2016.dta, and
	person2017.dta from Canvas. Open person2015.dta and tabulate the
	variable `year'. How many years are present? */
    use "person2015.dta", clear
	
	tab year
	
	** Only one year- 2015 is present.
	
*	Now append person2016.dta and person2017.dta.

	append using "/Users/arushikaushik/Desktop/Teaching/Poli:Econ5/2020/Week5/Class9/Data/person2016.dta"
	
	append using "/Users/arushikaushik/Desktop/Teaching/Poli:Econ5/2020/Week5/Class9/Data/person2017.dta"
	
*	Verify that your data frame now contains three years using tabulate. 
    
	tab year
	
*   save the appended datasets as combined_dataset.dta
    
	save "combined_worker.dta", replace
	
	
********************************************************************************
* Merging
********************************************************************************	
	
/*	Watch the following YouTube video on merging. No code is required here,
	but feel free to follow along with the video to try 1:1 merging:
	https://www.youtube.com/watch?v=niGZBRyyDuY */
	
/*  Next download demographics.dta from Canvas.
	What is the unit of analysis of the following datasets: person2015, person2016, 
	person2017 and demographics?
*/	
 
    ** the unit of analysis for all the given datasets is year-id
	
	use "/Users/arushikaushik/Desktop/Teaching/Poli:Econ5/2020/Week5/Class9/Data/demographics.dta", clear
	
/*	Next we will 1:1 merge demographic data with your existing three years of worker data, 
    which is now saved as "combined_dataset.dta" 
	HINT: you'll need to sort the data for the merge to work. */
	sort year id
	
	merge 1:1 year id using "combined_worker.dta", gen(_merge)
	
/*	Finally, drop the cases where caseid is only present in one of the two data
	frames (that is, keep the matched cases). */
	
	drop if _merge != 3
	** Other solutions could be:
	drop if _merge==1
	drop if _merge==2
	
*	Drop _merge and sort the data by `year id'. 
	drop _merge
	
	sort year id
	
*	Save a version your appended and merged data as class9.dta.
	save "class9.dta", replace
	
	
*** Merging many-to-one
/*	The next part will teach you how to perform merges where data from one of 
	the two data frames are repeated. This often occurs when you merge 
	data frames with disjoint units of analysis. */
	
/*  Open avg_annual_income dataset. It contains avaerge annual income data for 2015, 2016 and 2017.
    Next we will merge class9 dataset with this dataset. */
	
/*  What is the unit of analysis of the dataset avg_annual_income.dta? of class9.dta? */

    ** The unit of analysis for ang_annual_income.dta is year; for class9.dta, it is year-id.
	
/*  Use merge m:1 command to merge the two datasets- avg_annual_income.dta and class9.dta */

    use "class9.dta", clear
    merge m:1 year using "avg_annual_income.dta", gen(_myear)
	
	
/*  Use merge 1:m command to merge the two datasets- avg_annual_income.dta and class9.dta */

    use "avg_annual_income.dta", clear
    merge 1:m year using "class9.dta", gen(_myear)
	
/* Save the merged file as class9_final.dta" */
    save "class9_final.dta", replace	
	
********************************************************************************
* Generating identifiers
********************************************************************************
	
/*	This part will demonstrate how to create unique identifiers for a particular group, 
    within a group and for the dataset in general. */
	

/*  Create a unique identifier for the dataset class9_final.dta in three different ways. */
    use "class9_final.dta", clear
	
	gen unique_id1= _n
	
	tostring year, gen(yr_str)
	tostring id, gen(id_str)
	gen unique_id2= yr_str + " " + id_str
	
	gen unique_id3= year*10000000 + id
	
	
/*  Create a unique identifier for the group year-race (ie, 2015 white should 
    get one single no. and 2015 non white should get a different value) in two different ways. */
	
	egen id1= group(year white)
	
	gen id2= year*100 + white
	
	tostring white, gen(white_str)
	gen id3= yr_str + " " + white_str
	

/*  Create a unique identifier within the group year (ie, each observation within year 2015 is 
    uniquely identified by your identifier; same for 2016 and 2017). */
	sort year id
	bysort year: gen within_id= _n
	
*	Close log
	capture log close
