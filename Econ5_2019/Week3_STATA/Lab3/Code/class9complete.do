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
	cd 

*   Start a log called 'LastName_class9.txt'.
	log using LastName_class9.txt, text replace

*	Download diamonds.dta from TritonEd and open in Stata.
	use diamonds.dta

/*	It's a good idea when working with a new dataset to explore a bit and see
	what type each variable is and what values they take. For each of the 
	following questions, first write the necessary command to answer the 
	question, and then fill in the blank with the answer to the question. 
	The first is done for you as an example. */

	*	1. How many variables and observations are there?
	describe
	display "There are 10 variables and 2,000 observations."

	*	2. How many numerical variables are there? Cateogrical variables?
	desc
	display "There are 7 numerical variables and 3 categorical variables."

	*	3. What is the mean carat of the diamonds? What is the max price?
	sum
	display "The mean carat is 0.799 and the max price is $18,686."	

	*	4. How many categories does "cut" contain? Which "cut" category has the 
	*	most observations?
	tab cut
	display "Cut contains 5 categories, and 'Ideal' has the most observations."
	
	
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
	mean price if carat > 1 & color == "D"
	display "The average price is $8,102."
	
	*	2. What is the most common clarity if color does NOT equal "G" or "H"? 
	tab clarity if color != "G" | color != "H"
	display "The most common clarity is SI1."


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
	egen avgPPC = mean(PricePerCarat)
	label var avgPPC "Mean price per carat of each diamond"	
	
	/*	3. Generate a new variable called "PPC_demean" that takes a value
		equal to PricePerCarat minus avgPPC. Add a label. */
	gen PPC_demean = PricePerCarat - avgPPC
	label var PPC_demean "The demeaned price per carat of each diamond"	
	
	/*	4. Generate a new variable called "expensive" that takes a value of
		1 if PPC_demean is > 0, and 0 otherwise. Add a label. */
	gen expensive = PPC_demean > 0
	label var expensive "1 if PPC_demean > 0, 0 otherwise"	
	
	* Check your work with the following code:
	sort PricePerCarat
	browse PricePerCarat avgPPC PPC_demean expensive

	*	5. Now remove avgPPC from memory since we no longer need it.
	drop avgPPC

	/* 	6. You want to know how many diamonds are classified as expensive. Find 
		out using two different functions (hint: one we've already covered, and 
		the other uses 'count' (use 'help' if needed!)). */
	tab expensive
	count if expensive == 1
	display "822 diamonds are classified as expensive."
	
* close log
log close
