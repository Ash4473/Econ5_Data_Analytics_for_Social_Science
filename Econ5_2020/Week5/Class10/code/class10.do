/*	
Econ 5/Poli 5D, Class 10
In-class Activity
	
Instructions:
Below is some partially completed code. Using the comments as a guide,
finish the code. Remember to use the "help" command when needed. I 
recommend trying each line of code in the command window before moving on
in the do file. 

Submit a completed do-file and log file named as LastName_FirstName_class9. 
Write your Name and PID at the top of the do-file.
*******************************************************************************/

// Start-up commands
capture log close
clear all
graph drop _all
set autotabgraphs on

********************************************************************************
* Collapsing to generate summary stats
********************************************************************************

*	Change your directory
	cd 

/*	Start a log called LastName_FirstName_class10.txt.*/
	log using .txt, text replace

	
/*	This part will demonstrate how collapsing the data can be more
	efficient than maintaining a lower unit of analysis and generating summary
	statistics one by one. */
	
*	0. Load class10.dta. 
	   use "class10.dta", clear
	   
	   
*   1a. Collapse the data from person-year to year.

         collapse _______ , by(__)
		 
*	1b. Rename your variables to reflect that they are means.
	     local varlist " hours income age white female"
	      foreach v in `varlist'{
		     rename `v' `v'mean
	       }	
		   
		  
		
*	1c. Save this collapsed data as class10collapsed1.dta.	   
          save   _______  , replace
		  
		  
*	1d. Plot the mean income in the US over time. Add titles as appropriate. Name the plot "method1". 
	      graph bar incomemean , over(year) name(method1, replace) ///
	      title("Mean income over time (first method)") ///
	      ytitle("Mean income in US")
		  

*   2a. Use collapse command to generate means of income and hours by year and race grouping
        use "class10.dta", clear
        collapse ________ , by(______)
		
*	2b. Rename your variables to reflect that they are means.
		
		local varlist " hours income"
	      foreach v in `varlist'{
		     rename `v' `v'mean
	       }	
		   
		
*	2c. Save this collapsed data as class10collapsed2.dta.	   
          save ________, replace


*	2d. Plot the mean income of whites v/s non-whites in the US over time. Add titles as appropriate. Name the plot "method1_race". 
	      graph bar incomemean , over(white) over(year) name(method1_race, replace) ///
	      title("Mean income over time (first method)") ///
	      ytitle("Mean income in US")	


********************************************************************************
* Generating summary stats using bysort command
********************************************************************************

*	0. Load class10.dta to replace the data in memory. 
	use "class10.dta", clear
	
*	3a. Sort your data by year id 
	
	    
		
*	3b. Generate a variable that reflects the no. of observations in each year. 
	     
	   gen k=1
	   bysort ____ : egen no_obs=sum(k) 
    
		 
*   Compare your answer with 1.b above by tabulating year and no_obs
       
	   tab year no_obs
	
/*	3c. Generate means of income, hours, age, female, white for each year. */
       bysort ____: egen incomemean= mean(____)
	   bysort ____: egen hoursmean= mean(____)
	   bysort ____: egen agemean= mean(____)
	   bysort ____: egen femalemean= mean(____)
	   bysort ____: egen whitemean= mean(____)
	   
       
/*   Since mean values of each of the above variable is same for all observations within a year.
     Let's keep only the first observation for each year which contains all the information
	 on our summary statistics. */
	 
	   bysort year: keep if _n==1
	
/*	3d. Plot the mean income in the US over time. Add titles as appropriate. 
	Name the plot "method1". HINT: only plot the data where firstob == 1. */
	graph bar incomemean , over(year) name(method2, replace) ///
	title("Mean income over time (second method)") ///
	ytitle("Mean income in US")

	
** Re-run the analysis to generate summary stats at year-race level
*	0. Load class10.dta to replace the data in memory. 
	use "class10.dta", clear
	
*	4a. Sort your data by year id 
	
	    sort year id
		
*	4b. Generate a variable that reflects the no. of observations for each year-white variable combination. 
	     
		 gen k=1
	     bysort _______: egen no_obs=sum(k) 
		 
/*   Compare your answer with 2.b above by tabulating year and no_obs for each value 
     of white variable separately */
       
	   tab year no_obs if white==1
	   
	   tab year no_obs if white==0
	
/*	4c. Generate means of income, hours for each year-white variable combination. */

       bysort _______: egen incomemean= mean(____)
	   bysort _______: egen hoursmean= mean(_____)
	   
    
/*   Since mean values of each of the above variable is same for all observations within a year.
     Let's keep only the first observation for each year which contains all the information
	 on our summary statistics. */
	 
	   bysort year white: keep if _n==1
	
/*	4d. Plot the mean income in the US over time. Add titles as appropriate. 
	Name the plot "method1". HINT: only plot the data where firstob == 1. */
	graph bar incomemean , over(white) over(year) name(method2_race, replace) ///
	title("Mean income over time (second method)") ///
	ytitle("Mean income in US")
	
	
	
********************************************************************************
*** Reshaping	
********************************************************************************


/*	The next part will teach you how to reshape data from 'long' to 'wide' and
	back. The key to success here is knowing how your observations are uniquely 
	identified. */

*	0. Load class10.dta to replace the data in memory. 
	use "class10.dta", clear
	
/*	5a. Change the unit of analysis from person-year to person by reshaping the
	data from long to wide. */
	
	
	
	
/* 	5b. Change the unit of analysis back to person-year by reshaping the data
	from wide to long. */
	
	

	
*	Close log
	capture log close
