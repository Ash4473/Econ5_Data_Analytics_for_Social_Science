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
	cd 

/*	Start a log called LastName_FirstName_class9.txt.*/
	log .txt, text replace

/*	Watch the following YouTube video on appending. No code is required here,
	but feel free to follow along with the video to try appending:
	https://www.youtube.com/watch?v=AZGW8tohiqw */

/*	Now we will append some data. Download person2015.dta, person2016.dta, and
	person2017.dta from Canvas. Open person2015.dta and tabulate the
	variable `year'. How many years are present? */
    
	
	
*	Now append person2016.dta and person2017.dta.

	
*	Verify that your data frame now contains three years using tabulate. 
   
	
*   save the appended datasets as combined_worker_dataset.dta
    	
	
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
 
	
/*	Next we will 1:1 merge demographic data with your existing three years of worker data, 
    which is now saved as "combined_worker_dataset.dta" 
	HINT: you'll need to sort the data for the merge to work. */
	
/*	Finally, drop the cases where caseid is only present in one of the two data
	frames (that is, keep the matched cases). */
	
	
*	Drop _merge and sort the data by `year id'. 
	
*	Save a version your appended and merged data as class9.dta.
	
	
*** Merging many-to-one
/*	The next part will teach you how to perform merges where data from one of 
	the two data frames are repeated. This often occurs when you merge 
	data frames with disjoint units of analysis. */
	
/*  Open avg_annual_income dataset. It contains avaerge annual income data for 2015, 2016 and 2017.
    Next we will merge class9 dataset with this dataset. */
	
/*  What is the unit of analysis of the dataset avg_annual_income.dta? of class9.dta? */

	
/*  Use merge m:1 command to merge the two datasets- avg_annual_income.dta and class9.dta */

 
	
/*  Use merge 1:m command to merge the two datasets- avg_annual_income.dta and class9.dta */

	
/* Save the merged file as class9_final.dta" */

	
********************************************************************************
* Generating identifiers
********************************************************************************
	
/*	This part will demonstrate how to create unique identifiers for a particular group, 
    within a group and for the dataset in general. */
	

/*  Create a unique identifier for the dataset class9_final.dta in three different ways. */
	
	
/*  Create a unique identifier for the group year-race (ie, 2015 white should 
    get one single no. and 2015 non white should get a different value) in two different ways. */
		

/*  Create a unique identifier within the group year (ie, each observation within year 2015 is 
    uniquely identified by your identifier; same for 2016 and 2017). */
	
	
*	Close log
	capture log close
