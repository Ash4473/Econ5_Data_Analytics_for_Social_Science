# Econ 5/Poli 5D, Class 16
# In-class Activity
#
################################################################################

# Start-up commands
rm(list = ls())

################################################################################
# Pre Class Exercise: commenting and running R code
################################################################################

# Save this script as LastName_class16.R. We will use this script in class, so 
# save it somewhere you can find it easily. Put resume.csv in that same directory.

# 1. To begin, this is how you comment. Use a # to begin a comment.
# This is the only way to comment in R. It does not have the variety like Stata.
# Add a comment below this line that reads "My name is X" where X is your name. 


# 2. Now we will learn to use R like a calculator. To run a line of code in a script, 
# simply have your cursor on the line and press ctrl + enter. 
# Run the next line of code and view the output in the Console below. 
4 + 6 - 3

# 3. Suppose we want to run multiple lines of code at once. Highlight the entirety
# of the following two lines of code and view the output in the Console below.
# Also try highlighting only part of each line, pressing ctrl + enter, and see 
# what happens. 
8*3 + 1
8*(3 + 1)

# 4. Now click down in the *Console* below and type some simple math equation 
# of your choice (e.g. 2 + 3) and press enter. Observe that the output is 
# displayed. Now while still in the Console, press the up arrow until
# your code from 3. is displayed, and press enter. 

# 5. Submit LastName_class16.R via TritonEd. 

################################################################################
# In Class Activity: assigning values, using functions
################################################################################

# Follow along with the slides and complete the code below.

## 1. Let's create some objects. 
# a number
object_1 <- 5 + 3
object_1

# overwrite object_1
object_1 <- 5 - 3
object_1

# a text string
MySchool <- "UCSD"
MySchool

# a vector of numbers
vector.1 <- c(93, 92, 83, 99, 96, 97)
vector.1
vector.1[2]
vector.1[c(2,4)]
vector.1[-4]
vector.1*1000

# element-corresponding operations
vec1 (1, 2, 3)
vec2 (3, 3, 3)
vec1 + vec2
vec1*vec2
vec1/vec2

## 2. Let's use some functions.
# Try the six given statistical functions with vector.1:
length(vector.1)
min(vector.1)
max(vector.1)
range(vector.1)
mean(vector.1)
sum(vector.1)

## 3. Directories and loading data
# a) Change your directory to the location of this script and resume.csv:
setwd()
# b) Check your current working directory.
getwd()
# c) Load resume.csv and store it as an object named "resume".
resume <- read.csv("resume.csv")

## 4. Functions with data frames
# Try the seven given functions with the data frame "resume":
nrow(resume)
ncol(resume)
dim(resume)
summary(resume)
head(resume)
tail(resume)


## 5. Accessing certain observations and variables in a data frame
# Display the first three observations of the variable "firstname"
# using the three provided methods:
resume[1:3, "firstname"]
resume[1:3, 2]
head(resume$firstname, 3)

## 6. Saving data
# Export your data frame as RData. 
write.csv(resume, file = "resume.csv")
save(resume, file = "resume.RData")

resume <- load("resume.RData")
