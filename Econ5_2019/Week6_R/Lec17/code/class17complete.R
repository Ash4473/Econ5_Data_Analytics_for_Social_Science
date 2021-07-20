# Introduction to Social Data Analytics
# Zack Goodman
# Lecture 12 Group Activity
########################################
seq(10,20, length.out =6)

# Tips:
# The reading will be very helpful in completing this script.
# Remember to use help() if you cannot remember how a function works,
#     for example, help("mean")

#1: classes
# Create a vector containing a number and a string. What is its class?
vec.1 <- c(1, "string")
class(vec.1)

# What is the class of the empty string, "" ? 
class("")

# What is the class of the empty vector, c() ? 
class(c())

#2: more classes
a <- c(0.5, 1.75, 2.15)
# There's a command: as.integer(). 
# What happens if you apply it to a vector "a", which contains decimals?
as.integer(a)

# What is the class of a?
class(a)

# Overwrite the third element of "a" as a text string (character).
a[3] <- "2.15"

# What is the class of a now?
class(a)
a

# Now make the third element of "a" a number again. What is the class of a now?
a[3] <- 2.15
class(a)
a

#3: logicals
logic1 = c(TRUE, TRUE, FALSE, TRUE)
logic2 = c(TRUE, FALSE, FALSE, FALSE)
# a) Evaluate logic1 | logic2 
logic1 | logic2

# b) Evaluate logic1 & logic2 
logic1 & logic2

# What do TRUE and FALSE translate into for integers?
as.integer(TRUE)
as.integer(FALSE)

# Is TRUE > FALSE? Why or why not? (hint: coercion)
TRUE > FALSE

# Coerce a) and b) to integers, sum, and take the difference, that is
#   compute sum(a) - sum(b). (hint: use as.integer())
logic.a <- logic1 | logic2
logic.b <- logic1 & logic2
sum(logic.a) - sum(logic.b)
# or
as.integer(logic.a)
as.integer(logic.b)

# Is 5 < "a" ? Is 5 < "5" ? Why?
5 < "a"
5 < "5"
# R interprets these as "5" < "a" and 5 < 5, respectively, via coercion.
# Within the character class, > checks alphabetical order with preference
# given first to capitalized letters, then lowercase letters, then numbers, so
# "A" > "Z" and "Z" > "a" and "a" > "z" and "z" > "9" and "9" > "0".

#4: subsetting
resume <- read.csv("resume.csv")
# Use summary() to explore the data. How many variables are there?
summary(resume)
# There are four variables (note that "X" is an ID)

# Generate a table using table() of resume$race vs resume$call - 
#     first row should have 2278 157. 
# Add margins to the table with the addmargins() function.
table.1 <- table(resume$race, resume$call)
table.1
table.1 <- addmargins(table.1)
table.1

# Calculate the mean call rates for blacks and whites using mean() and
#     logical operators. (hint: use [] to subset data.)
mean(resume$call[resume$race == "black"])
mean(resume$call[resume$race == "white"])

# Create a subset of the resume dataframe using subset() that is the
#     names and calls for only the white females. Do the same
#     for black females. You should have 1860 white females and 
#     1886 black females. (hint: use dim() to get size of dataframes.)
WhiteFemale <- subset(resume, resume$race == "white" & resume$sex == "female", 
                      select = c("firstname", "call"))
dim(WhiteFemale)
BlackFemale <- subset(resume, resume$race == "black" & resume$sex == "female", 
                      select = c("firstname", "call"))
dim(BlackFemale)

# Use mean() to compare the call rates for white and black females. You 
#     should find a difference of 0.3264.
mean(WhiteFemale$call) - mean(BlackFemale$call)

# If time, complete the same calculations for white/black males.
WhiteMale <- subset(resume, resume$race == "white" & resume$sex == "male", 
                      select = c("firstname", "call"))
BlackMale <- subset(resume, resume$race == "black" & resume$sex == "male", 
                      select = c("firstname", "call"))
mean(WhiteMale$call) - mean(BlackMale$call)
