# Econ 5/Poli 5D, Lab 7
# In-class Activity
# 
# Instructions: Below is some partially completed code. Using the comments as a 
# guide, finish the code. Remember to use help() if you cannot remember how a 
# function works, for example, help("mean"). Feel free to ask questions and
# help your classmates. 
################################################################################

## Change directory, read in social.csv, and explore
rm(list = ls())
setwd("")
social <- read.csv("social.csv")
summary(social)

## Some background:
# The data come from Gerber, Green, and Larimer (2008). They sent mailers to registered
# Michigan voters 11 days before the 2006 primary election with one of the following messages:
# Civic Duty: "DO YOUR CIVIC DUTY-VOTE!"
# Hawthorne: "YOU ARE BEING STUDIED!"
# Self: "WHO VOTES IS PUBLIC INFORMATION!", plus the recipient's voting record
#   from the 2004 primary and 2004 general elections
# Neighbors: "WHAT IF YOUR NEIGHBORS KNEW WHETHER YOU VOTED?", plus the voting
#   records of the recipient's neighbors, plus a promise to send an updated
#   chart after the election.  
#
# Households in the control group recieved no mailer. You can see examples of the 
#   actual mailers sent in the appendix of the paper. 
#
# 'voted' is the dependent variable of interest - whether the recipient voted 
#   in the 2006 primary election.

#----------------------------------------------------------------------------------
## Part 1: Plotting

# First we will check that groups are simliar across observable characteristics. 
# 1. Create boxplots for age separated by treatment group. Label as appropriate.
boxplot()

# 2. Create a barplot that depicts the % recipients that are female within each 
#     treatment group with one bar per group (5 bars total). Add labels. 
female.table <- table(social$treatment[social$sex == "female"])/table(social$treatment)
barplot()

# 3. Create a barplot that depicts the voting rate within each treatment group
#     with one bar per treatment group (5 bars total). Add labels. 
voted.table <- table(social$treatment[social$voted == "Yes"])/table(social$treatment)
barplot()

#----------------------------------------------------------------------------------
## Part 2: Regression

# 1. Create indicator variables for each treatment. 
#   For example, social$control = 1 if social$treatment == 1, 0 otherwise. 
social$control <- as.integer(social$treatment == "Control")
social$civicduty <- as.integer(social$treatment == "CivicDuty")
social$hawthorne <- as.integer(social$treatment == "Hawthorne")
social$self <- as.integer(social$treatment == "Self")
social$neighbors <- as.integer(social$treatment == "Neighbors")
social$voted <- as.integer(social$voted == "Yes")

# 2. Fit a linear model in which you predict voting in the 2006 primary using
#   the indicator variables you just created. 
#   Omit social$control (because of perfect multicolinearity).
model1 <- lm()
summary(model1)

# Interpret the coefficient estimates. How likely was someone to vote in 
#   the 2006 primary if they recieved the "neighbors" treatment? 
#   Be careful - the intercept matters!


# 3. Fit a linear model without the intercept term, and use the "treatment"
#   factor variable as your independent variable (this has been done for you).
#   Observe how the coefficients are different.
model2 <- lm()
summary(model2)

#----------------------------------------------------------------------------------
## Part 3: Heterogeneous treatment effects

# In this section we will work with a subset of the data: those in the control
#   and those who received the "Neighbors" treatment. We'll store that subset
#   as df (completed for you):
df <- subset(social, subset = (treatment == "Control" | treatment == "Neighbors"),
             select = c("voted", "control", "neighbors", "p2004", "age"))
df$voted04 <- as.integer(df$p2004 == "Yes")
summary(df)

# 1. Let's see if treatment was greater or lesser for those who voted in the 
#   2004 primary. Fit a linear model that predicts voting in the 2006 primary
#   using:
#     1) whether the person voted in the 2004 primary (voted04), 
#     2) whether the person recieved the "neighbors" treatment, and
#     3) whether the person BOTH voted in the 2004 primary AND recieved treatment.
model3 <- lm()
summary(model3)

# Was the treatment effect larger or smaller who those who voted in the 
#   previous primary election?


# 2. Now we will see if the treatment effect differs by age. Fit the following
#   linear model: 
#   voted = intercept + neighbors + age + age^2 + neighbors*age +
#           neighbors*age^2 + error
#   You can include squared terms with I(age^2)
model4 <- lm()
summary(model4)

# Next we will predict voting behavior by age using our fitted model:
predict.control <- predict(model4, newdata = data.frame(age = 25:85, neighbors = 0))
predict.treat <- predict(model4, newdata = data.frame(age = 25:85, neighbors = 1))

# Now plot a line plot of predicted control vs treated:
plot(x = 25:85, y = _,
     _ = "l", 
     _ = c(20, 90), 
     _ = c(0, 0.5),
     _ = "Age", 
     _ = "Predicted turnout rate")
lines(x = 25:85, y = _, lty = "dashed")
text(40, 0.45, "Neighbors condition")
text(45, 0.15, "Control condition")

# Next, take the difference in predicted turnout rates by age to determine the 
#   average treatment effect by age.
plot(x = 25:85, y = _ - _,
     _ = "l", 
     _ = c(20, 90),
     _ = c(0, 0.1), 
     _ = "Age",
     _ = "Estimated average treatment effect")



