# Econ 5/Poli 5D, Class 17
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
# Pre Class Exercise: logic in R
################################################################################

# The purpose of this exercise is to take your existing knowledge of Boolean
# logic and apply it to R as well as try subsetting. 

# 0. Recall that you can use the help command to check the syntax of any 
# command. For example, if you forget how to set your working directory, 
# run help("setwd") 

# 1. Set your working directory to the same location as resume.csv. Save
# this script as LastName_class17.R. Load resume.csv as an object "resume". 
setwd()
resume <- 

# 2. Run the following 7 lines of code to observe some logical tests in R.
# Remember, you can run each line sequentially by pressing ctrl + enter.
vec <- c(TRUE, TRUE, FALSE, TRUE)
sum(vec)
TRUE == FALSE
5 < 3
5 < 3 | 2 < 3
5 < 3 & 2 < 3
"Triton" != "triton"

# 3. Generate a sequence of numbers going from 1 to 6 in increments of 1. 
# Store this sequence as vec1. Hint: use the ":" operator.
# Run help(":") if you are stuck!
vec1
vec1

# 4. Generate a sequence of numbers going from 0 to 10 in increments of 2.
# Store this sequence as vec2. Hint: use the "seq()" command.
# Run help("seq") if you are stuck!. 
vec2
vec2

# 5. Test if vec1 > vec2 (i.e. run the next line of code).
vec1 > vec2

# 6a. Practice with brackets
# Remember, we can use brackets to access the [row, column] within an object.
# For column vectors, we only need to specify the row because there is only one column.
# Display the third element of vec1 (run the next line):
vec1[3]
# Display the second and third elements of vec2 (run the next line):
vec2[2:3]

# 6b. Your turn: create a vector vec3 whose first three elements are the first three
# elements of vec1 and whose second three elements are the last three elements 
# of vec2. We will accomplish this in two steps.
# Step 1: create vec3 as the first three elements of vec1. 
vec3 
# Step 2: add the last three elements of vec2 to rows 4:6 of vec3 
# (hint: use brackets for BOTH vec3 and vec2!)
vec3

################################################################################
# In Class Activity: 
################################################################################

#1: classes
# Create a vector containing a number and a string. What is its class?
# What is the class of the empty string, "" ? 
# What is the class of the empty vector, c() ? 

#2: more classes
a <- c(0.5, 1.75, 2.15)
# There's a command: as.integer(). 
# What happens if you apply it to a vector "a", which contains decimals?
# What is the class of a?
# Overwrite the third element of "a" as a text string (character).
# What is the class of a now?
# Now make the third element of "a" a number again. What is the class of a now?

#3: logicals
logic1 = c(TRUE, TRUE, FALSE, TRUE)
logic2 = c(TRUE, FALSE, FALSE, FALSE)
# a) Evaluate logic1 | logic2 
# b) Evaluate logic1 & logic2 
# What do TRUE and FALSE translate into for integers?
# Is TRUE > FALSE? Why or why not? (hint: coercion)
# Coerce a) and b) to integers, sum, and take the difference, that is
#   compute sum(a) - sum(b). (hint: use as.integer())
# Is 5 < "a" ? Is 5 < "5" ? Why?

#4: subsetting
# Make sure you've read in resume.csv as a data frame object called 'resume'. 
# What does resume$race[1:5] give us?
# What does resume[,"race"] give us?
# How about mean(resume$call[resume$race == "black"])?
# Try creating a subset using the subset function.
