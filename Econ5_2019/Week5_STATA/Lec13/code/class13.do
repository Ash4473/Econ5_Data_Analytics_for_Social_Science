/*	
Econ 5/Poli 5D, Class 13
In-class Activity
	
Instructions:
Below is some partially completed code. Using the comments as a guide,
finish the code. Remember to use the "help" command when needed. I 
recommend trying each line of code in the command window before moving on
in the do file. You may ask questions and help others around you.
*******************************************************************************/

// Start-up commands
capture log close
clear all
graph drop _all
set autotabgraphs on

********************************************************************************
* Pre Class Exercise: basic appending and one-to-one merging
********************************************************************************

*	Change your directory
	cd 

/*	Start a log called LastName_class11.txt.*/
	log using .txt, text replace

/*	Watch the following YouTube video on appending. No code is required here,
	but feel free to follow along with the video to try appending:
	https://www.youtube.com/watch?v=AZGW8tohiqw */

/*	Now we will append some data. Download person2015.dta, person2016.dta, and
	person2017.dta from TritonEd. Open person2015.dta and tabulate the
	variable `year'. How many years are present? */

	
*	Now append person2016.dta and person2017.dta.

	
*	Verify that your data frame now contains three years using tabulate. 

	
/*	Watch the following YouTube video on merging. No code is required here,
	but feel free to follow along with the video to try 1:1 merging:
	https://www.youtube.com/watch?v=niGZBRyyDuY */
	
/*	Next we will 1:1 merge in demographic data. Download demographics.dta from 
	TritonEd and merge with your existing three years of worker data. 
	HINT: you'll need to sort the data for the merge to work. Also, the unit of 
	analysis of both data frames is `year id'. */
	
	
/*	Finally, drop the cases where caseid is only present in one of the two data
	frames (that is, keep the matched cases). */
	
	
*	Drop _merge and sort the data by `year id'. 
	
	
*	Save a version your appended and merged data as class13.dta.
	
	
********************************************************************************
* In Class Activity: collapsing, many-to-one merging, and reshaping
********************************************************************************
	
/*	This part will demonstrate how collapsing the data can be more
	efficient than maintaining a lower unit of analysis and generating summary
	statistics one by one. */
	
*** Method 1: generate summary statistics one by one.
*	0. Load class13.dta if you need to. 
	use class13.dta, clear

*	1a. Sort your data by year id 
	
	
*	1b. Generate an identifier to indicate the first person in each year. 
	
	
/*	1c. Generate means of perwt - female for each year. */
	
	
/*	1d. Plot the mean income in the US over time. Add titles as appropriate. 
	Name the plot "method1". HINT: only plot the data where firstob == 1. */
	line incomemean year if ___, name(method1, replace) ///
	title("Mean income over time (first method)") ///
	xtitle("Year") ytitle("Mean income in US")
	
*** Method 2: collapse the data frame
*	0. Load class13.dta to replace the data in memory. 
	use class13.dta, clear

*	2a. Collapse the data from person-year to year using weights.

*	2b. Rename your variables to reflect that they are means.
	local varlist "perwt hours income age white female"
	foreach v in `varlist'{
		rename `v' `v'mean
	}	
		
*	2c. Save this collapsed data as class13collapsed.dta.
	
		
/*	2d. Plot the mean income in the US over time. Add titles as appropriate. 
	Name the plot "method2". */
	line incomemean year, name(method2, replace) ///
	title("Mean income over time (second method)") ///
	xtitle("Year") ytitle("Mean income in US")
	
*** Merging many-to-one
/*	The next part will teach you how to perform merges where data from one of 
	the two data frames are repeated. This often occurs when you merge 
	data frames with disjoint units of analysis. */

*	0. Load class13.dta to replace the data in memory. 
	use class13.dta, clear	
	
/*	3. Merge (m:1) the data in memory with class13collapsed.dta. After you 
	complete that task, observe that the new data frame is equivalent to the 
	data frame created in method 1 earlier (without firstob). 
	HINT: what is the finest unit of analysis of the two data sets you are 
	merging? That will help you determine the ID by which to merge your data. */
	
	
*** Reshaping	
/*	The next part will teach you how to reshape data from 'long' to 'wide' and
	back. The key to success here is knowing how your observations are uniquely 
	identified. */

*	0. Load class13.dta to replace the data in memory. 
	use class13.dta, clear
	
/*	4a. Change the unit of analysis from person-year to person by reshaping the
	data from long to wide. */
	
	
/* 	4b. Change the unit of analysis back to person-year by reshaping the data
	from wide to long. */
	
	
*	Close log
	capture log close
