## Week 6: class 12

## Basic Logical Operations in R
"Triton" != "triton"

# | is the or sign in R
5<3 | FALSE

vec1 <- c(TRUE, TRUE, FALSE, TRUE)


sum(vec1)

## Logical Operations on vectors
sum(vec1) >3

list1 <- c(1,2,3,4,5)
list1 <- 1:5
list1

list1>3

(list1 >1) & (list1 <5)


## Generating sequences
seq1 <- seq(1,5,0.5)
seq1

(seq1 >1) & (seq1 <5)

seq2 <- seq(10,20,length.out = 6)
# Or seq2 <- seq(10,20,2)
seq2


## How to determine the class of an object?
x=5
class(x)

y= "my name is King Triton"
class(y)

z=TRUE
class(z)

## Treating object of one class as another?
z.str <- c("1", "2", "602")
z.num <- as.numeric(z.str)
z.str

z.num

z.num + c(1,1,1)
z.str + c(1,1,1)

a_num <- c(1,2,3, 3498)
a_str <- as.character(a_num)
a_num

a_str

a_num + c(1,1,1,1)
a_str + c(1,1,1,1)

## Alternate way of determing class
is.character(z.num)

is.character(z.str)

is.numeric(a_num)

is.numeric(a_str)

is.na(a_num) # na checks for missing values

isTRUE(TRUE)

isTRUE(FALSE)


## Some anomalies
isTRUE(T)

isTRUE(1)

as.integer(TRUE)

T<- 1
isTRUE(T)


## Using in-built logical function as vector
logic <- c(TRUE, TRUE, FALSE, TRUE)
mean(logic)

sum(logic)


## Coercion
vec2 <- c(1,2,3)
vec2

typeof(vec2)
class(vec2)

vec2[1] = "text"
class(vec2)

vec2

TRUE == "TRUE"

## Subsetting data
setwd("/Users/arushikaushik/Desktop/Teaching/Poli:Econ5/2020/Week6/Class12")
resume <- read.csv("resume.csv")

resume$race[1:5]

resume[,"race"]

## Applying conditional subsetting

black1 <- resume$call[resume$race== "black"]

black2 <- subset (resume, select= c("firstname", "sex", "call"), subset= (race=="black"))

## Calculating mean call back rate for blacks
mean(black2$call)
mean(black1)

mean(resume$call[resume$race== "black"])

