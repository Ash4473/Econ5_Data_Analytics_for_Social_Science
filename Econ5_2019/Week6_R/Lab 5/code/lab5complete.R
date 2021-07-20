# Econ 5/Poli 5D, Lab 5
# In-class Activity
#
# Please complete the code below. You can help each other. There is most
# likely too much to finish in one section - what you don't finish is here for 
# additional practice to build your skills. 
#
# Some helpful commands/operators from class 16: <- c() length() max() min() 
# range() mean() sum() setwd() getwd() read.csv() load() names() nrow() ncol() 
# dim() summary() write.csv() save() 
#
# Some helpful commands/operators from class 17: & | ! TRUE FALSE seq() class() 
# as.numeric() is.character() typeof() subset() 
#
# Remember that you can use help() if you forget the syntax for a command.
################################################################################

# remove all objects from current environment 
rm(list = ls())

## Part 0: Save the script as LastName_lab5.R, which you'll submit for attendance credit.

## Part 1: Importing and exploring data
# Set your working directory to the location of resume.csv, and import the data frame (remember to *assign* it.)
setwd("")
getwd()
resume <- read.csv("resume.csv")

# Check the dimensions of the data frame, and view the variables names using the appropriate functions.
dim(resume)
names(resume)

# Display the first three observations of the data frame. (Bonus: use the head() command to do the same thing.)
resume[1:3,]
head(resume, 3)

# Display the last three observations of the data frame. (Bonus: use the tail() command to do the same thing.)
nrow(resume)
resume[4868:4870,]
tail(resume, 3)

# Display summary statistics of the entire data set. Give a summary of the call column.
summary(resume)
summary(resume$call)

# What is the class of the 'sex' column? What are the levels of the 'sex' column? (hint: use levels())
class(resume$sex)
levels(resume$sex)


## Part 2: There's more than one way to skin a cat
# Below is an example of the difference between [] and [[]]. It's very subtle, so be careful.
# What is the difference? (hint: use class().)
head(resume[["call"]], 10)  # Double bracket
head(resume["call"], 10)  # Single bracket
# The difference is that the first produces the integer values of "call" as a vector whereas 
#     the second produces the values of "call" as a data frame.

# If we use the $, what class of object is the following? Which of the above two objects does it resemble?
head(resume$call, 10)
# The class is again integer, same as the double bracket above.

# which() returns the position of elements in a logical vector that are TRUE. Is there any difference between the following?
tail(resume$call[which(resume$race == "black")], 10)
tail(resume$call[resume$race == "black"], 10)
# No difference!

# But! Is there difference between a and b?
a <- which(resume$race == "black")
b <- resume$race == "black"
head(a, 10)
head(b, 10)
# Yes - a is returning positions of each TRUE whereas the b is returning whether each entry of resume$race is TRUE or FALSE
# Observe that the position of each TRUE in b is listed in a, that is, 
#     entries 3, 4, 8, etc. of b is TRUE, and a has values 3, 4, 8, etc.


## Part 3: Working with data
# Create a new variable, called callB, which is the mean of "call" for those with race = "black"
callB <- mean(resume$call[resume$race == "black"])

# Create a new variable, called callW, which is the mean of "call" for those with race = "white"
callW <- mean(resume$call[resume$race == "white"])

# Calculate the difference of call rates for White minus Black names. You should get about 0.032.
callW - callB

# Often we will want to subset the data to perform analysis on subgroups.
# Create an object BlackMale that contains all data for those in resume with race = "black" and sex = "male". 
#     You can use either [] methods or subset() to complete this portion.
BlackMale <- resume[resume$race == "black" & resume$sex == "male",]

# Similarly, create objects BlackFemale, WhiteMale, and WhiteFemale. 
BlackFemale <- subset(resume, subset = (race == "black" & sex == "female"))
WhiteMale <- resume[resume$race == "white" & resume$sex == "male",]
WhiteFemale <- subset(resume, subset = (race == "white" & sex == "female"))

# Now let's do a comparison across genders.
# Calculate the difference in mean call rates between White/Black males, and between White/Black females. 
# Is there any gender-specific trend?
mean(WhiteMale$call) - mean(BlackMale$call)
mean(WhiteFemale$call) - mean(BlackFemale$call)

