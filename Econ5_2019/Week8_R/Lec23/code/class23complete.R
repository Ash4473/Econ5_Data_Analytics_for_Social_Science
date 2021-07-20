# Econ 5/Poli 5D, Class 23
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
# Pre Class Exercise: setup for regression in R
################################################################################

# Change directory and check
setwd()
getwd()

# Load data
nba <- read.csv("nba.csv")
florida <- read.csv("florida.csv")
face <- read.csv("face.csv")

# Make scatter plot
plot(nba$height, nba$blocks,
     xlab = "Height",
     ylab = "Blocks",
     pch = 16,
     main = "Height of NBA Players and Blocks")


################################################################################
# In Class Activity
################################################################################

## First class example: NBA

# What is the correlation between height and blocks?
cor(nba$height, nba$blocks)

# Fit a regression line of the form:
#   blocks = b0 + b1 * height
fit <- lm(blocks ~ height, data=nba)

# Check the results
summary(fit)

# Now add the best fit line to the plot. 
abline(fit)

# Now add the players' names to the plot. 
text(nba$height, nba$blocks+.1, nba$name, cex=0.4)


#---------------------------------------------------------------------
## Second example: florida
head(florida)

# Make a scatterplot of florida$Perot96 vs florida$Buchanan00
#     and label appropriately.
plot(florida$Perot96, florida$Buchanan00, 
    xlab = "Perot's votes in 1996",
    ylab = "Buchanan's votes in 2000", 
    main = "Third Party Vote in Florida, 1996 & 2000",
     pch = 16)

# Fit a best fit line following the model:
#     florida$Buchanan00 = b0 + b1 * florida$Perot96
fit2 <- lm(florida$Buchanan00 ~ florida$Perot9 )
summary(fit2)
# Add the trendline to your plot.
abline(fit2)

# Which county is furthest from the trendline?
#     hint: use max(resid()) to find the greatest residual
florida$county[resid(fit2) == max(resid(fit2))]
outliers <- data.frame(florida$county[resid(fit2) == max(resid(fit2))])

florida$county[resid(fit2) == max(resid(fit2))] -> "NULL"

florida.2 <- florida[c(1:49, 51:67),]
#---------------------------------------------------------------------
## Third example: face experiment
head(face)

# Define vote share for Dems and Reps
face$d.share <- face$d.votes/(face$d.votes + face$r.votes)
face$r.share <- face$r.votes/(face$d.votes + face$r.votes)
face$diff.share <- face$d.share - face$r.share

# Plot vote margin in favor of the Democratic candidate as a function of her competence score
face$w.party <- as.character(face$w.party) # change class of winning party letter to character from factor
plot(face$d.comp, face$diff.share, 
     pch = face$w.party, 
     col = ifelse(face$w.party == "R", "red", "blue"), 
     xlim = c(0,1), 
     ylim = c(-1,1),
     xlab = "Competence scores for Democrats",
     ylab = "Democratic margin in vote share",
     main = "Facial Competence in Vote Share")

# Regress the model diff.share = beta0 + beta1 * d.comp
fit3 <- lm(face$diff.share ~ face$d.comp)

# Add a trendline to your plot
abline(fit3)

# Interpret the coefficients. Is there a causal effect of appearance on outcome?
  
  
  
  