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


/*	Start a log called class10.txt Remember to use the options that make the 
	log file txt format and overwrite exisiting files of the same name.*/


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
	graph twoway line le_male le_female year, ///
	lcolor(red blue) legend(order(1 "Men" 2 "Women")) ///
	name(lifeexpmw, replace) ///
	title("Life Expectancy for Men	vs Women") ///
	ytitle("Life Expectancy") ///
	xtitle("Year")
		
/* 	Now we are going to switch datasets to try a different kind of plot.
	Feel free to explore the dataset to get a feel for the variables. */
	sysuse citytemp, clear
	
/*	2. Create a histrogram of the temperatures in january (tempjan) with a
	bin width of 5 degrees. Also toggle the frequency option. Add appropriate 
	axis labels and titles. Give the plot a name. */
	histogram tempjan, width(5) frequency kdensity ///
	name(temphist, replace) ///
	title("January Temperature Histogram") ///
	ytitle("Frequency") ///
	xtitle("Temperature in Degrees F") 
	
/*	3. Plot a bar graph of the average temperature in both January and 
	July for all regions (in the same plot). Add an appropriate title, 
	legend, and axis titles. Change the colors to something other than 
	the default. Give the plot a name. */
	graph bar (mean) tempjan tempjuly, over(region) ///
	title("Average Temperatures across Divisions") ///
	ytitle("Temperature in Degrees F") ///
	legend(order(1 "January" 2 "July")) ///
	bar(1, color(green)) bar(2, color(purple)) ///
	name(tempbar, replace)	
	
/*	4. Create box plots for January and July temperatures by region.
	Change the color to something other than the default. Add a title and
	axis titles as appropriate. Give the plot a name. */
	graph box tempjan tempjuly, over(region) ///
	legend(order(1 "January" 2 "July")) ///
	box(1, color(orange)) box(2, color(red)) ///
	title("Temperatures by Region") ///
	ytitle("Temperature in Degrees F") ///
	name(tempbox, replace)
	
*	close log
	log close
