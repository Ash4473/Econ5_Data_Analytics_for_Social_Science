/*	
Econ 5/Poli 5D, Class 10
In-class Activity

Instructions:
Below is some partially completed code. Using the comments as a guide,
complete the code. Remember to use the "help" command when needed. 
*******************************************************************************/

// Start-up commands
capture log close
clear all
graph drop _all

********************************************************************************
* Pre class exercise
********************************************************************************
*	Change your directory
	

/*	Start a log called LastName_class10.txt Remember to use the options that make 
	the log file txt format and overwrite exisiting files of the same name.*/
	

*	Open the built-in dataset uslifeexp (done for you)
	sysuse uslifeexp, clear

/*	Explore the dataset a bit - check out what variables are present, what 
	values they take, how many observations, etc.*/

	
********************************************************************************
* Plotting
********************************************************************************	
*	Set this option to produce plots in different tabs in the same window.
	set autotabgraphs on

/*	1. Plot two line graphs, in the same coordinate axes, of male and female
	life expectancy. Change the colors of the two lines to colors other 
	than the defaults. Add a legend. Add appropriate titles and axis labels.
	Give the plot a name. */
twoway line le_male le_female year, ytitle("Life expectancy (in years)") ///
title("Life Expectancy in US") legend(order(1 "Males" 2 "Females")) name(LE, replace)

		
/* 	Now we are going to switch datasets to try a different kind of plot.
	Feel free to explore the dataset to get a feel for the variables. */
	sysuse citytemp, clear
	
/*	2. Create a histrogram of the temperatures in january (tempjan) with a
	bin width of 5 degrees. Also toggle the frequency option. Add appropriate 
	axis labels and titles. Give the plot a name. */
hist tempjan, freq width(5) title("Distribution of temperature in January") name(Dist_jan,replace)

	
/*	3. Plot a bar graph of the average temperature in both January and 
	July for all regions (in the same plot). Add an appropriate title, 
	legend, and axis titles. Change the colors to something other than 
	the default. Give the plot a name. */
 graph bar tempjan tempjuly, over(region) bar(1, color(red)) bar(2, color(green)) ytitle("Mean Temperatures") legend(order(1 "January" 2 "July"))

	
/*	4. Create box plots for January and July temperatures by region.
	Change the color to something other than the default. Add a title and
	axis titles as appropriate. Give the plot a name. */
graph box tempjan tempjuly
	
*	close log
	log close
