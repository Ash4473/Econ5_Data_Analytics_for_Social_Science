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
setwd()

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
male.household <- mean(time$household[time$TESEX == 1])
female.household <- mean(time$household[time$TESEX == 2])
male.household
female.household
  
# 2. Now calculate the mean for a randomly selected gender:
gender <- sample(1:2, 1)
random.household <-  mean(time$household[time$TESEX == gender])
gender
random.household

# 3. Now we will create a function "gender.mean" the produces the mean of
# time$household for a specified gender. 
# Everything has been completed for you except for where it says 
# YOUR CODE HERE, where you should copy your answer from #2 above. 
gender.mean <- function(gender) {
  return(mean(time$household[time$TESEX == gender]))
}

# 4. After you've created your function, you can run it with the following:
gender.mean(1)
gender.mean(2)


################################################################################
# In Class Activity: Functions in R
################################################################################

## Part 1: Creating Functions

# Let's first go over a basic function to create a mean
my.mean <- function(vector){
  mu <- sum(vector)/length(vector)
  return(mu)
}

my.mean(time$household)
mean(time$household)

# Say we wanted to allow the user to select which activity to 
# enter into the function
my.mean <- function(variable, data){
  mu <- mean(data[,variable])
  return(mu)
}
my.mean("household", time)
my.mean("children", time)

# Household work by gender
# Say we wanted to calculate the mean for men/women separately.
# This is how we would do it outside of a function
table(time$TESEX) # 1 is male; 2 is female
mean(time$household[time$TESEX==1]) # men
mean(time$household[time$TESEX==2]) # women


# How much longer to women spend doing household work?


## Your turn!
# Write a function called 'gender.mean' that takes inputs 
#   variable, dataframe, gender and outputs the mean
#   of that variable in the dataframe for that gender.
gender.mean <- function(variable, data, gender){
    mu <- mean(data[data$TESEX == gender,variable])
    return(mu)
}
gender.mean("household", time, 1)
gender.mean("household", time, 2)

gender.mean("work", time, 1)
gender.mean("work", time, 2)

# Whats the difference in time spent working for men vs women?


# Next, construct a function 'gender.age.mean' that takes inputs of 
#   variable, dataframe, gender, and age, and calculates the mean of that variable
#   in that dataframe for the given gender and age. Basically same as above
#   but adding the age input.

# Explore the distribution of values of TEAGE
table(time$TEAGE)
hist(time$TEAGE)

# Now construct the function
gender.age.mean <- function(variable, data, gender, age){
    mu <- mean(data[data$TESEX == gender & 
                      data$TEAGE == age, variable])/60 # for hours
    return(mu)
  }
gender.age.mean("work", time, 1, 20)
gender.age.mean("work", time, 2, 20)

gender.age.mean("work", time, 1, 30)
gender.age.mean("work", time, 2, 30)

# How does the gender work gap vary by age?

#--------------------------------------------------------------------
## Part 2: Plotting within functions
# Your job is to construct a function 'plot.by.age' that takes inputs variable, dataframe
#   and outputs a plot with age on the x axis and mean(variable) for each age on the y-axis.
#   As a bonus challenge, plot both the means separately for men and women in the dataframe.

plot.by.age <- function(variable, df){
  #First, let's create a blank plot
  plot(1, type = "n", 
       xlim=c(15,90), 
       ylim=c(0,4), 
       ylab=paste("Hours spent on", variable, "activities"),
       xlab="Age")
  # Second, we'll add the data series separately for men and women within each age bin
  for(i in 15:85){
    men <- gender.age.mean(variable, df, 1, i)
    women <- gender.age.mean(variable, df, 2, i)
    points(i, men, pch=15, col="blue")
    points(i, women, pch=16, col="red")
  }
  legend("topright", c("Men", "Women"), col=c("blue", "red"), pch=c(15,16))
}

# Plot household time
plot.by.age("household", time)

# as pdf file
pdf("/Users/arushikaushik/Desktop/Poli:Econ5/2019/26/graph1.pdf")
plot.by.age("household", time)
dev.off()

# as png file
png("/Users/arushikaushik/Desktop/Poli:Econ5/2019/26/graph1.png")
plot.by.age("household", time)
dev.off()

# Plot household time only for employed folk (TELFS == 1)
plot.by.age("household", time[time$TELFS==1,])

# Plot household time only for employed folk with children (TRCHILDNUM > 0)
plot.by.age("household", time[time$TELFS==1 & time$TRCHILDNUM>0,])

# Plot for a different activity
plot.by.age("children", time[time$TRCHILDNUM>0,])

