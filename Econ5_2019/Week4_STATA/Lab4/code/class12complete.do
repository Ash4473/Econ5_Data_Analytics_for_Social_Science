/*	
Econ 5/Poli 5D, Class 12
In-class Activity

Instructions:
Below is some partially completed code. Using the comments as a guide,
complete the code. Remember to use the "help" command when needed. You may ask 
questions and help others around you.
*******************************************************************************/

// Start-up commands
capture log close
clear
graph drop _all

********************************************************************************
* Part 1: Set-up and exploring the data
********************************************************************************

*	Change your directory.
	cd "Data"

*   Start a log called 'LastName_class12.txt'.
	log using LastName_class12.txt, text replace

*	Download anthropometric_data.dta from TritonEd and open in Stata.
	use anthropometric_data
	
*	Get familiar with the data 
	desc
	sum
	
********************************************************************************
* Part 2: Plotting
********************************************************************************

*	Turn on autotabgraphs to plot your graphs in the same window.
	set autotabgraphs on

/* 	Plot histograms of weight and height to see how the data are distributed. 
	Add appropriate titles, name the plots, change the bin width to 
	something thinner, and plot a kernal density function. */
	hist weight, name(hist_weight, replace) width(5) kdensity
	hist height, name(hist_height, replace) width(1) kdensity
	
/*	2. Create a plot that examines the relationship between weight and height. 
	Add appropriate titles and axis labels and name your plot. Change the colors
	to something other than the default. */
	scatter weight height, name(scatter1, replace) ///
	title("Weight vs Height") xtitle("Height") ytitle("Weight")	///
	color(blue)
	
/*  3. Uh-oh! There appear to be two outliers in the data (one for height and 
	one for weight). Plot a second, separate plot that is the same as the plot 
	in (2) with the outliers removed (HINT: use `if'). */
	scatter weight height if weight < 300 & height > 40, name(scatter2, replace) ///
	title("Weight vs Height") xtitle("Height") ytitle("Weight")	///
	color(green)
	
********************************************************************************
* Part 3: Linear best fit and regression
********************************************************************************

/*	4. Add a best fit line to your plot from (2). Recall that you can
	overlay two plots in the same coordinate axes by placing each plot in 
	parentheses after 'twoway'. Name this new plot. Keep the color of each 
	point in your plot the same as in (2) and pick a color for your
	best fit line. */
	twoway (scatter weight height, color(green)) ///
	(lfit weight height, lcolor(red)), ///
	name(fitted1, replace) ///
	title("Weight vs Height") xtitle("Height") ytitle("Weight")	
	
/*	5. Copy and paste your plot from (4), but add a best fit line that fits 
	all points except the two outliers. Choose a new color for this line and
	add a legend that tells which line is which. Give this plot a new name. */
	twoway (scatter weight height, color(green)) ///
	(lfit weight height, lcolor(red)) ///
	(lfit weight height if weight < 300 & height > 40, lcolor(blue)), ///
	name(fitted2, replace) ///
	title("Weight vs Height") xtitle("Height") ytitle("Weight") ///
	legend(order(2 "With Outliers" 3 "Outliers Removed"))
	
/*	6. Now we will figure out the difference in slope between these two best 
	fit lines. Use 'regress' to determine the slope of each line, and report 
	the difference. Interpret both coefficient estimates for the steeper 
	best fit line. */
	regress weight height
	regress weight height if weight < 300 & height > 40
	di "The difference in slope is 5.3 - 2.5 = 2.8." 
	di "Interpretation of the coefficient on height: a person's weight increases by 5.3 pounds for each inch they are taller on average, all else equal."
	di "Interpretation of the intercept: a person who is zero inches tall weights -194 pounds on average, all else equal." 
	
/*	7. BONUS: Suppose we want to predict a person's weight using height but 
	controlling for age and % bodyfat. Run a regression and predict the 
	weight of a person 75 inches tall who is 30 years old and 20% bodyfat. */
	reg weight height age bodyfat
	di "The person is predicted to weigh " (-47.7 + 2.75*75 + -0.3562*30 + 2.61*20) " pounds"
	

capture log close
