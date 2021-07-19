
########################
### ECON 5 / POLI 5D ###
###  Problem Set 3   ###
########################



# Total points possible: 50


### Question 1: Data ###

### 1A: Reading in the data (1 point)
Congress <- read.csv("https://raw.githubusercontent.com/cjsells/ECON-5-POLI-5D-HW3-Data/master/MexicanCongress.csv")
Africa <- read.csv("https://raw.githubusercontent.com/cjsells/ECON-5-POLI-5D-HW3-Data/master/AfricaDemocracy.csv")


### 1B: Which dataset is in long format, and which is in wide format? (1 point)

"The Mexican Congress dataset is in long format, and the African Democracy dataset is in wide format" 


### 1C: Using the Africa dataset, convert the variable "Country" into a character variable; 
# display the names of the first 10 countries in the dataset (2 points)

Africa$Country <- as.character(Africa$Country)
head(Africa$Country, 10)


### 1D: Use the Mexican Congress dataset and subsetting to create a new dataframe
###     that contains only observations whose party is the PRI.
###     Store this dataframe as an object called pri. (2 points)

pri <- Congress[Congress$Party == "PRI",]



### 1E: Add a new variable to the pri dataset called PRI.Majority that equals TRUE 
#       if the PRI held at least 50% of the seats, and equals FALSE otherwise.
#       In which year did the PRI lose its congressional majority? (4 points)

pri$PRI.Majority <- pri$Seat.Share >= 50

min(pri$Year[!pri$PRI.Majority])
"The PRI lost its congressional majority in 1997" 



### Question 2: Subsetting ###
# (Use the Africa dataset)

# For these questions, you are going to write the R code that produces the answer to these questions.
# When we run that code, the output should be the correct answer and only that answer.

# Example: Which countries in the dataset were not colonized by any European country?

# To answer this question, I could write just
Africa$Country[Africa$Colonizer == "None"]

# That produces the output "Ethiopia" "Liberia",  which is the correct answer to the question. 
# You do not need to write down the output; just the code that produces it is fine.


### 2A: Which countries in the dataset were former British colonies? (4 points)
Africa$Country[Africa$Colonizer == "UK"]


### 2B: Which countries had a democracy score of -9 in the 1970s? (4 points)
Africa$Country[Africa$Democracy.1970s == -9]


### 2C: Which former French colonies had a positive (greater than 0) democracy score in the 1990s? (4 points)
Africa$Country[Africa$Colonizer == "France" & Africa$Democracy.1990s > 0]


### 2D: Which country had the highest democracy score in the 1980s? (4 points)
Africa$Country[Africa$Democracy.1980s == max(Africa$Democracy.1980s)]


### 2E: Which countries were more democratic in the 1990s compared to the 1980s? (4 points)
Africa$Country[Africa$Democracy.1990s > Africa$Democracy.1980s]


### 2F: Which countries had a democracy score less than -5 in the 1980s AND a democracy score greater than +5 in the 1990s  (4 points)
Africa$Country[Africa$Democracy.1980s < -5 & Africa$Democracy.1990s > 5]


### 2G: What was the average democracy score among former French colonies in the 1990s?  (4 points)
mean(Africa$Democracy.1990s[Africa$Colonizer == "France"])





### Question 3: Loops ### (5 points)
# (Use the Congress dataset)

# The following loop iterates through each election year.
# You are going to adapt this loop to count up the number of parties that
# won seats in each election. The *only* thing that you need to do is replace
# the YOURCODEHERE with some code that will count up the number of parties in year y.

years <- seq(1964, 2018, by=3)
for(y in years){
  n <- sum(Congress$Year == y) 
  n <- nrow(Congress[Congress$Year == y,]) 
  n <- length(Congress$Party[Congress$Year == y])
  print(paste("There were ", n, " parties in Congress in ", y, sep=""))
}



### Question 4: Variables for the Final Project ###

### 4A: (1 point)
# Unit of analysis:


### 4B: (1 point)
# Number of Observations:
# Number of Variables:

# Write your code here


### 4C: (1 points)
# Research Question:
# Hypothesis:


### 4D: (2 points)
# Dependent Variable:
# Main Independent Variable:
# (Optional:) Other Independent Variables:


### 4E: (2 points)

# Write your code here

