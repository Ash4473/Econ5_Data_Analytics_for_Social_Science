/*	
Econ 5/Poli 5D, Class 9
In-class Activity

Instructions:
Below is some partially completed code. Using the comments as a guide,
complete the code. Remember to use the "help" command when needed. You may ask 
questions and help others around you.
*******************************************************************************/

// Start-up commands
capture log close
clear all

********************************************************************************
* Part 1: Set-up and exploring the data
********************************************************************************
*	Change your directory.


*   Start a log called 'LastName_class9.txt'.


*	Download diamonds.dta from TritonEd and open in Stata.


/*	It's a good idea when working with a new dataset to explore a bit and see
	what type each variable is and what values they take. For each of the 
	following questions, first write the necessary command to answer the 
	question, and then fill in the blank with the answer to the question. 
	The first is done for you as an example. */

	*	1. How many variables and observations are there?
	describe //<- your code here
	display "There are 10 variables and 2,000 observations."

	*	2. How many numerical variables are there? Cateogrical variables?
			//<- your code here
	display "There are ____ numerical variables and ____ categorical variables."

	*	3. What is the mean carat of the diamonds? What is the max price?
			//<- your code here
	display "The mean carat is ____ and the max price is $_____."	

	/*	4. How many categories does "cut" contain? Which "cut" category has the 
		most observations? */
			//<- your code here
	display "Cut contains ____ categories, and ____ has the most observations."
	
	
********************************************************************************
* Part 2: Logic in Stata
********************************************************************************
/*	Recall: if statements in Stata
	& means AND 
	| means OR
	! means NOT
Determine the following using commands & logical operators & fill in the blank. 
*/
	*	1. What is the average price if carat > 1 and color = "D"?
			//<- your code here
	display "The average price is $____."
	
	*	2. What is the most common clarity if color does NOT equal "G" or "H"? 
			//<- your code here
	display "The most common clarity is ____."


********************************************************************************
* Part 3: Variable manipulation
********************************************************************************
/*	Remember that to create new variables, we use either gen or egen depending
	on the circumstance. Can you remember the difference? 
	Remember to label your variables. The first has been completed for you.*/
	
	/*	1. Generate a new variable called "PricePerCarat" whose value is the 
		price per carat for each observation. Add a label. */
	gen PricePerCarat = price/carat
	label var PricePerCarat "The price in dollars per carat of each diamond"
	
	/*	2. Generate a new variable called "avgPPC" that is the mean of 
		PricePerCarat. Add a label. */
	
	
	
	/*	3. Generate a new variable called "PPC_demean" that takes a value
		equal to PricePerCarat minus avgPPC. Add a label. */
	
	
	
	/*	4. Generate a new variable called "expensive" that takes a value of
		1 if PPC_demean is > 0, and 0 otherwise. Add a label. */
	
	
	
	* Check your work with the following code:
	sort PricePerCarat
	browse PricePerCarat avgPPC PPC_demean expensive

	*	5. Now remove avgPPC from memory since we no longer need it.
	

	/* 	6. You want to know how many diamonds are classified as expensive. Find 
		out using two different functions (hint: one we've already covered, and 
		the other uses 'count' (use 'help' if needed!)). */
	
	count
	display "____ diamonds are classified as expensive."
	
* close log
log close
