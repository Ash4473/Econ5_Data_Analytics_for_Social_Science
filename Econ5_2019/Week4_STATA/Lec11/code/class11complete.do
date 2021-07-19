/*	
Econ 5/Poli 5D, Class 11
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

********************************************************************************
* Pre Class Exercise
********************************************************************************

*	Change your directory
	cd "Data"

/*	Start a log called LastName_class11.txt.*/
	log using LastName_class11.txt, text replace
	
/*	Fill in the blank based on what the video said:
	(https://hbr.org/video/5299994733001/the-refresher-regression-analysis): */
	display "Correlation is not causation...Unless we're selling ______, " ///
		"it's difficult to prove cause and effect." 

*	Open the nba.dta dataset
	use nba.dta

/*	Explore the dataset a bit - check out what variables are present, what 
	values they take, how many observations, etc.*/
	describe
	sum
	
/*	A good first step is to plot. Create a scatterplot of blocks versus height
	with height on the x-axis. Plot a tendline using the command "lfit" followed
	by the y variable and then the x variable. HINT: to plot twice, put each 
	plot in parentheses following the "twoway" command.*/
	graph twoway (scatter blocks height) (lfit blocks height), ///
		name(blocks, replace)
	
********************************************************************************
* In Class Activity
********************************************************************************
	
/*	1. Now you want to see the coefficient estimates from regressing blocks on 
	height and a constant. Use "regress" to determine the coefficient estimates 
	from the regression.*/
	regress blocks height

/*	2. Use "predict" to generate the predicted blocks in a variable called yhat.
	Plot both predicted and actual blocks in the same scatter plot with 
	height on the x-axis. */
	predict yhat
	scatter yhat blocks height
	
/*	3. A fundemental assumption of OLS is that the error term is normally
	distributed with mean zero. Let's use "predict" to generate the residuals 
	and plot them in a histogram. */
	predict resid, residual
	histogram resid, width(0.1) normal name(hist, replace) frequency
	
/*	4. If time, try regressing blocks on height only for players > 78" tall and 
	for those <= 78" tall spearately. Compare the coefficients. Bonus: Try 
	plotting both trendlines in the same graph, and clean up the legend.*/
	regress blocks height if height > 78
	regress blocks height if height <= 78
	graph twoway (scatter blocks height) (lfit blocks height if height >= 78) ///
	(lfit blocks height if height <= 78), ///
	legend(order(1 "Blocks per game" 2 "Short best fit" 3 "Tall best fit")) ///
	name(doublereg, replace)
	
*	Close log
	capture log close
	
