*******************************************************
           * Lab assignment for Week5
*******************************************************

** Submit a completed do-file and a log file, named as LastName_FirstName. Please mention your PID and 
*   Name at the beginning of your do-file.




/* Suppose you are interested in studying the determinants of child mortality, i.e, whether female children or twins are more prone to mortaility or if younger siblings are more prone to mortality. How does mother characteristics like total no. of children born to her, education (edu), smoking and drinking habits affect survival probability for kids? How do household (hh) characteristics like hh income/wealth, residential location (rural/urban) affect survival chances for the kids?


   Specifically, you want to run the following regression to answer this question:
   Whether_Child_is_Alive= beta_0 + beta_1 * child_is_female + beta_2 * whether_child_is_twin
                           + beta_3 * birth_order_of_child + beta_4 * no._of_children_to_mother+ 
						   beta_5 * mother's_edu + beta_6 * mother_smokes 
						   + beta_7* mother_drinks + beta_8 * hh_wealth + beta_9 * whether_hh_is_rural + e
   
   
   For this purpose, you are given datsets from Demographic Health Surveys (https://dhsprogram.com). 
   You are given two datasets for children (child_data_AP.dta and child_data_Rajasthan.dta), 
   one for mothers (mother_data.dta) and one for the hh variables (hh_data.dta).
   
   
   The datasets belong to two states of India- Andhra Pradesh (AP) and Rajasthan for the year 2015-16.
   
   
   Your task is to clean up the data and then run the above regression. 
   
   Follow the steps outlined below to accomplish this objective:  */
   
   
* 1. Load the dataset child_data_AP.dta

 
*2.  Append the other dataset from Rajasthan (child_data_Rajasthan)to this data.


	 
	 /* Notice that the unit of analysis is mother in this dataset. There could be multiple mothers 
	 within the same hh. The dataset provides the entire birth history of mothers, recording the data 
	 for upto 20 births. The variables starting with bord, twin, birthmonth, birthyear, female, and 
	 Alive capture the data for these potentially 20 children. They respectively, capture, the 
	 birth order of the child, whether the child is twin or not, birth month of the child, birth year of 
	 the child, gender of the child, and whether the child is still alive or not */
 
/*3.  To run the regression given above, you need children as the unit of analysis. Reshape the data 
      to long format to convert the unit of anlysis from mothers to children. */


	  
	  
/* 4.  Next you need to create a variable that can capture the total no. of children born to a mother.	
       Hint you can either use collapse command combined with merge to do this or use bysort command. */ 
        
	  
	  
	  
*5.   Save the dataset as "children_data.dta"
      
	  
	  
      /* Now you already have all the child-related variables in this dataset. Next you need to 
	  merge mothers' and hh dataset to this children's dataset. */
	  
/*6.  Merge mother's dataset (mother_data.dta) to this dataset. Use caseid as the unique identifier 
      for merging the datasets. Be careful about the unit of analysis of the two datasets. */
	  
	  
	  
	  
/*7.   Next merge the hh.dta data to this. cluster_id and hh_id are unique identifiers in hh_data. Again 
      be careful about the unit of analysis. */
      
	  
	  
	  
*8.   Save the dataset as "master_data.dta".
     
	  
	  
	  

*9.   Run the regression specified at the top.

        
      
      
	  
	  
   
