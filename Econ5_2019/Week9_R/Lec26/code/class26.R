# Econ 5/Poli 5D, Class 26
# In-class Activity
# 
# Instructions: Below is some partially completed code. Using the comments as a 
# guide, finish the code. Remember to use help() if you cannot remember how a 
# function works, for example, help("mean"). Feel free to ask questions and
# help your classmates. 
################################################################################

# Start-up commands
rm(list = ls())

################################################################################
# Pre Class Exercise
################################################################################


# Clear everything in memory
rm(list=ls())

# Change directory
setwd("")

# Read in Time use data
load("AmericanTimeUse.RData")
dim(time)
names(time)
summary(time)
# Documentation for data is:
# https://www.bls.gov/tus/lexiconnoex0315.pdf
# https://www.bls.gov/tus/atusintcodebk0315.pdf

## Variables we are dealing with today
# Gender: TESEX
# Age: TEAGE
# Employed: TELFS
# Number of Children: TRCHILDNUM

# 1. Caluclate the mean minutes/day spent doing household chores (time$household)
# for men (TESEX == 1) and women.
male.household <- # YOUR CODE HERE
female.household <- # YOUR CODE HERE
  
# 2. Now calculate the mean for a randomly selected gender:
gender <- sample(1:2, 1)
random.household <- # YOUR CODE HERE
  
# 3. Now we will create a function "gender.mean" the produces the mean of
# time$household for a specified gender. 
# Everything has been completed for you except for where it says 
# YOUR CODE HERE, where you should copy your answer from #2 above. 
gender.mean <- function(gender) {
  return(# YOUR CODE HERE)
}

# 4. After you've created your function, you can run it with the following:
gender.mean(1)
gender.mean(2)


################################################################################
# In Class Activity: Functions in R
################################################################################

## Part 1: Creating Functions

# Let's first go over a basic function to create a mean
my.mean <- function(){
   <-
  return()
}

my.mean(time$household)
mean(time$household)


# Suppose we want to allow the user to select which activity to enter 
#   into the function
my.mean <- function(){
    <-
  return()
}
my.mean("household", time)
my.mean("children", time)


# Your turn!
# Write a function called 'gender.mean' that takes 3 inputs 
#   variable, dataframe, gender and outputs the mean
#   of that variable in the dataframe for that gender.
gender.mean <- function

gender.mean("household", time, 1)
gender.mean("household", time, 2)

gender.mean("work", time, 1)
gender.mean("work", time, 2)

# Whats the difference in time spent working for men vs women?


# Now let's construct a function 'gender.age.mean' that takes inputs of 
#   variable, dataframe, gender, and age, and calculates the mean of that variable
#   in that dataframe for the given gender and age. Basically same as above
#   but adding 'age' as an input.

# Explore the distribution of values of TEAGE
table(time$TEAGE)
hist(time$TEAGE)

# Now construct the function, adding age as an input.
gender.age.mean <- 
  
gender.age.mean("household", time, 1, 20)
gender.age.mean("household", time, 2, 20)

gender.age.mean("household", time, 1, 30)
gender.age.mean("household", time, 2, 30)

# How does the gender work gap vary by age?

#--------------------------------------------------------------------
## Part 2: Plotting within functions
# Your job is to construct a function 'plot.by.age' that takes inputs 'variable' and 'dataframe'
#   and outputs a plot with age on the x axis and mean('variable') for each age on the y-axis.
#   Plot both the means separately for men and women (two sets of points). 
# Note: the solution uses the function gender.age.mean() from part 3.

plot.by.age <- function(_, _){
  # First, let's create a blank plot
  plot(1, type = "n", # Recall we use this syntax to produce a blank plot
      _ = c(15,90), 
      _ = c(0,4), 
      _ = paste("Hours spent on", variable, "activities"),
      _ = "Age")
  # Second, we'll add the data series separately for men and women within each age bin
  for(i in 15:85){
    men <- gender.age.mean(_, _, _, _)
    women <- gender.age.mean(_, _, _, _)
    points(_, _, pch=15, col="blue")
    points(_, _, pch=16, col="red")
  }
  legend("topright", c("Men", "Women"), col=c("blue", "red"), pch=c(15,16))
}

# After you've written the function plot.by.age, try it with the following commands:
# Plot household time
plot.by.age("household", time)

# Plot household time only for employed folk (TELFS == 1)
plot.by.age("household", time[time$TELFS==1,])

# Plot household time only for employed folk with children (TRCHILDNUM > 0)
plot.by.age("household", time[time$TELFS==1 & time$TRCHILDNUM>0,])

# Plot for a different activity
plot.by.age("children", time[time$TRCHILDNUM>0,])

