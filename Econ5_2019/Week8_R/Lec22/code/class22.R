# Econ 5/Poli 5D, Class 22
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
# Pre Class Exercise: background for plotting in R
################################################################################

## Set working directory
setwd("")
getwd()

# Load afghan.csv
afghan <- read.csv("afghan.csv")

# Explore data (data frame dimensions, variable names, summary stats, etc.)
dim(afghan)
names(afghan)
summary(afghan)

# Generate a table to compare levels of afghan$violent.exp.ISAF
ISAF.table <- table(afghan$violent.exp.ISAF, 
                    exclude = NULL)
ISAF.table

# Now generate a table using prop.table(). 
# How is it different from using table()?
ISAF.ptable <- prop.table(table(afghan$violent.exp.ISAF,
                                exclude = NULL))
ISAF.ptable




################################################################################
# In Class Activity: plotting in R
################################################################################

# Helpful plotting commands: table/proptable, barplot, hist, boxplot, plot
# Helpful formatting options: names.arg, main, xlab, ylab, abline, lines,
#       freq, breaks

# Fill in the blanks below as we cover content in class.

#-----------------------------------------------------------------------

## 1. barplot()

# What proportion of Afghanis have experienced violence by the ISAF?

# We want to visualize our findings as a barplot.
# Be sure to specify a title and axis labels.
barplot(___,
         __ = c("No harm", "Harm", "Nonresponse"), 
         __ = "Civilian victimization by the ISAF",
         __ = "Response category",
         __ = "Proportion of the respondents", 
         __ = c(0, 0.7) )


# Your turn!
# Repeat the exercise for the victimization by Taliban 
#       (that is, use afghan$violent.exp.taliban)
Taliban.ptable <- prop.table(table(___))

barplot(Taliban.ptable,
        __ = c("No harm", "Harm", "Nonresponse"), 
        __ = "Civilian victimization by the Taliban",
        __ = "Response category",
        __ = "Proportion of the respondents", 
        __ = c(0, 0.7) ) 

#------------------------------------------------------------------------
## 2. hist()
# Create a histogram of respondent ages, and add a title + axes labels
hist(__, freq = FALSE, 
      __ = c(0, 0.04), 
      __ = "Age", 
      __ = "Percent",
      __ = "Distribution of Respondent Age")


# Your turn! Create a histogram of education. Use `breaks' to choose bins. 
hist(__, freq = TRUE, 
     breaks = seq(from = -0.5, to = 18.5, by = 1),
      __ = "Years of Education", 
      __ = "Frequency",
      __ = "Distribution of Respondent Education")

# Add a vertical line at the median education level using abline()
abline(v = median(__))

# Add a text label "median" at (x, y) = (3, 0.5)
text(__, __, __)

# Add a vertical line at the mean using lines()
lines(x = rep(mean(__), 2), 
      y = c(-100, 1500))

# Add a text label "mean" at the appropriate place
text(__, __, __)


# Can we create a histrogram for afghan$income? Why or why not?
#       Hint: check class(afghan$income)



#------------------------------------------------------------------------
## 3. boxplot()
# Make a box plot of years of education separated by province
boxplot(__, 
        __ = afghan, 
        __ = "Education by Province", 
        __ = "Province",
        __ = "Years of Education")

# Which provinces are the most educated? Which ones have median education == 0?


# Your turn! Make a boxplot of age separated by each district.
boxplot(__, 
         __ = afghan, 
         __ = "Age by District", 
         __ = "District",
         __ = "Age in Years")


#------------------------------------------------------------------------
## 4. plot() - scatterplot
# First, load the new data and explore a bit
congress <- read.csv("congress.csv")
head(congress, 10)
summary(congress)

# Subset the data by party
rep <- subset(congress, subset = (party == "Republican"))
dem <- congress[congress$party == "Democrat", ] # alternative method

# Further subset the data by party and by 80th and 112th congress
rep80 <- subset(rep, subset = (congress == 80))
dem80 <- subset(dem, subset = (congress == 80))
rep112 <- subset(rep, subset = (congress == 112))
dem112 <- subset(dem, subset = (congress == 112))

# Assign axis labels and limits to avoid repetition
xlab <- "Economic liberalism/conservatism"
ylab <- "Racial liberalism/conservatism"
lim <- c(-1.5, 1.5)

# Create a scatterplot for the 80th Congress of ideological leanings.
plot(__, type = "n", # Type "n" specifies no plotting
     __ = lim, 
     __ = lim, 
     __ = xlab, 
     __ = ylab,
     __ = "80th Congress")
points(__, __, = 16, __ = "blue") # democrats
points(__, __, = 17, __ = "red") # republicans
text(-0.75, 1, "Democrats")
text(1, -1, "Republicans")


# Your turn! Create a similar scatterplot for the 112th Congress
plot(__, type = "n", # Type "n" specifies no plotting
     __ = lim, 
     __ = lim, 
     __ = xlab, 
     __ = ylab,
     __ = "112th Congress")
points(__, __, = 16, __ = "blue") # democrats
points(__, __, = 17, __ = "red") # republicans
text(-0.75, 1, "Democrats")
text(1, -1, "Republicans")

#------------------------------------------------------------------------
## 5. plot() - line plot

# Calculate party median for each congress (done for you)
dem.median <- tapply(dem$dwnom1, dem$congress, median)
rep.median <- tapply(rep$dwnom1, rep$congress, median)

# Plot line graphs of party ideological median over time
# First we'll plot democrats
plot(__, __, 
      __ = "blue", 
      __ = "l", # type "l" for line
      __ = c(80, 115), 
      __ = c(-1, 1), 
      __ = "Congress",
      __ = "Median ideological leaning of party")
# Add Republicans
lines(__, __, 
      __ = "red")
text(110, -0.6, "Democratic\n Party")
text(110, 0.85, "Republican\n Party")

