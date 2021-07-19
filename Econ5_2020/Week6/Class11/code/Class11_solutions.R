## Week6: Class11
## Introducing basic operations in R


## Submit the completed R-script. Write your name and PID on the top of the script.
## Save it as LastName_FirstName.R

## Arithmetic Operations
5+3
5/3
5^3

## Assigning values
object_1 <- 5+3
object_1
print(object_1)
## Class of a variable
class(object_1)

## Overwriting values
object_1 <- 5-3
object_1
print(object_1)

## Creating string values
MySchool <- "UCSD"
MySchool
class(MySchool)

## Creating vectors
vector.1 <- c(93,92,83,99,96,97)
vector.1
class(vector.1)

## Indexing
vector.1[3]

vector.1[c(1,3,4)]

## removing elements of a vector
vector.1[-3]

## Vector operations
vector.1*100

vec1 <- c(1,2,3)
vec2 <- c(3,3,3)

vec1 +vec2

vec1*vec2

vec1/vec2

## Functions
length(vector.1)
min(vector.1)
max(vector.1)
range(vector.1)
mean(vector.1)
sum(vector.1)


## Working with data
getwd()

setwd("")
getwd()

load("resume.RData")

resume <- read.csv("resume.csv")

## Basic summary statistics with data
names(resume)
nrow(resume)
ncol(resume)
dim(resume)
summary(resume)
head(resume)
tail(resume)


## Subsetting data
resume[1:3, "firstname"]

resume[1:3, 2]

head(resume$firstname, 4)

## Saving Data

write.csv(resume, file= "resume.csv")

save(resume, file= "resume.RData")

## Exercises

#================================================================================#
## 1. Run the folowing commands and write the output as comment in this R-script
#================================================================================#

#a. paste command is used for joining string values.
paste("2+2=", 2+2 )
# "2+2= 4"

#b. Equal to sign is another way to assign values to objects.
instructor= "Arushi"
paste("The instructor of this class is", instructor)
# "The instructor of this class is Arushi"

#================================================================================#
## 2. You can treat a variable in a dataset as vector and 
##     run all the vector functions we learnt in this class on it.
#================================================================================#


#a. 
max(resume$call)
## 1
min(resume$call)
## 0
range(resume$X)
## 1, 4870

#b. Calculate the mean of the variable X in dataset resume. Give both the command and the output.
mean(resume$X)
# 2435.5

#c. How many people received a call in the dataset resume?
##  Give both the command and the output.
sum(resume$call)
# 392


#================================================================================#
## 3. Suppose the dimensions of a dataset are 300 X 4. Let school be one of the 
##    variables in this dataset. Then what would be the output of the command
##    length(dataset$school)?
#================================================================================#

#  300


