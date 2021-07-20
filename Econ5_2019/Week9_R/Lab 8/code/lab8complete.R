# Econ 5/Poli 5D, Lab 8
# In-class Activity
# 
# Instructions: Below is some partially completed code. Using the comments as a 
# guide, finish the code. Remember to use help() if you cannot remember how a 
# function works, for example, help("mean"). Feel free to ask questions and
# help your classmates. 
################################################################################

# Clear everything in memory
rm(list=ls())

# Change directory
setwd()

# Read in Time use data
load("AmericanTimeUse.RData")

#--------------------------------------------------------------------
## Part 1: Create a basic calculator
# Your job is to construct a function 'do.math' with inputs operation, number1, number2.
#     do.math takes number1 and applies operation to number2 and outputs the result.
#     For example, do.math("add", 3, 4) should output 7,
#     and do.math("multiply", 3, 4) should output 12. Other operation values can be "subtract"
#     or "divide". Hint: you will need to use if statements.
do.math <- function(operation, number1, number2){
  if(operation == "add"){
    result <- number1 + number2
  } else if(operation == "subtract"){
    result <- number1 - number2
  } else if(operation == "multiply"){
    result <- number1 * number2
  } else if(operation == "divide"){
    result <- number1 / number2
  } else {
    result <- "error: unrecognized operation"
  }
  return(result)
}

do.math("add", 3, 4)
do.math("subtract", 3, 4)
do.math("multiply", 3, 4)
do.math("divide", 3, 4)
do.math("other", 3, 4)


#--------------------------------------------------------------------
## Part 2: Functions with defaults
# You can set a default value for function inputs. Check out function.example
#   below, which sets a default value for c. When someone runs
#   function.example(1, 2), which does not specify a value for c, then
#   the function sets c to zero. However, if someone runs
#   function.example(1, 2, 3), then the function would set c to 3.
function.example <- function(a, b, c = 0){
  result <- a + b - c
  return(result)
}

function.example(1, 2)
function.example(1, 2, 3)


# Your job is to construct a new function 'do.math2' that is the same as 
#   'do.math' except it assumes the user wants to do addition if the 
#   operation is unspecified. Copy your answer from above below and make
#   changes as necessary. Hint: you'll need to change the order of your inputs!
do.math2 <- function(number1, number2, operation = "add"){
  if(operation == "add"){
    result <- number1 + number2
  } else if(operation == "subtract"){
    result <- number1 - number2
  } else if(operation == "multiply"){
    result <- number1 * number2
  } else if(operation == "divide"){
    result <- number1 / number2
  } else {
    result <- "error: unrecognized operation"
  }
  return(result)
}

do.math2(3, 4)
do.math2(operation = "subtract", 3, 4)
do.math2("subtract", 3, 4)
do.math2(3, 4, "subtract")

#--------------------------------------------------------------------
## Part 3: Functions with data
# Your job is to construct a function 'mean.day' that takes inputs variable, data, and days.of.week.
#     'mean.day' outputs the mean(data$variable) for the specified days of week. However, the 
#     day of week is not required, so if days.of.week is omitted, the function should produce 
#     the mean(data$variable) for all seven days of the week.
# Note: days.of.week should be a number in the range 1:7 (1 is Sunday and 7 is Saturday)
# Note: 'TUDIARYDAY' is the relevant day of week variable in the data frame 'time'.
# Hint: You can set a default value to missing and check if something is missing with is.na().
mean.day <- function(variable, data, days.of.week = NA){
  if(is.na(days.of.week) == TRUE){
    result <- mean(data[, variable])
  } else{
    result <- mean(data[data$TUDIARYDAY == days.of.week, variable])
  }
  return(result)
}

mean.day("work", time)
mean.day("work", time, 1)
mean.day("work", time, 2)
mean.day("work", time, 6)
mean.day("work", time, 7)


# BONUS: Adjust your function 'mean.day' to permit days.of.week to be a vector, and take the 
#     mean over all days specified in that vector. So, if I wanted to calculate the mean of 
#     hours worked Monday through Friday, I'd use mean.day.2("work", time, 2:6).
# Hint: use a for loop, and use length(days.of.week) to know how many iterations to include.

mean.day.2 <- function(variable, data, days.of.week = NULL){
if(is.null(days.of.week) == TRUE){
  result <- mean(data[, variable])
} else{
  n <- length(days.of.week)
  sub <- rep(0,n)
  obs <- rep(0,n)
  for(i in 1:n){
    sub[i] <- mean(data[data$TUDIARYDAY == days.of.week[i], variable])
    obs[i] <- sum(is.finite(data[data$TUDIARYDAY == days.of.week[i], variable]))
  }
  result <- sum(sub*obs)/sum(obs)
}
return(result)
}

mean.day.2("work", time)
mean.day.2("work", time, 1)
mean.day.2("work", time, 2)
mean.day.2("work", time, 2:6)
mean.day.2("work", time, c(1, 7))
mean.day.2("work", time, 1:7)
