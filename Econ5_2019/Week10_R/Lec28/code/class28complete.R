# Econ 5/Poli 5D, Class 28
# In-class Activity
# 
# Instructions: Below is some partially completed code. Using the comments as a 
# guide, finish the code. Remember to use help() if you cannot remember how a 
# function works, for example, help("mean"). Feel free to ask questions and
# help your classmates. 
################################################################################

################################################################################
# Pre Class Exercise
################################################################################


# Clear everything in memory
rm(list=ls())

# Change directory
setwd()

# Install packages. You only need to install a package ONCE. After it's installed, you
# need not run these commands again if you continue to use a computer on which you
# previously installed the packages. 
# install.packages("readxl")
# install.packages("dplyr")
# install.packages("ggplot2")

# Load packages into workspace. You DO need to run these once per session to bring 
# the associated functions into your workspace. 
library(readxl)
library(dplyr)

# Read in college data using read_xlsx from the readxl package
salary <- read_xlsx("colleges_salary.xlsx")
region <- read_xlsx("colleges_region.xlsx")
type <- read_xlsx("colleges_type.xlsx")

## Now we will learn how to use the piping operator, '%>%', which is loaded when
#   we ran library(dplyr).
# First, run head(salary) to examine the output:
head(salary)

# Now, run salary %>% head(), which is the same as head(salary). The '%>%' pipes 
# the object on the left into the function on the right. 
salary %>% head()

# Now try to create a table of region$region using piping:
region$region %>% table()


################################################################################
# In Class Activity: dplyr
################################################################################

## 1. Creating variables with mutate()
# Create a variable region$california_ = TRUE if region$region == "California", FALSE otherwise, using:
#     a) the old fashioned way
#     b) the dpylr command 'mutate'

# a)
region$california_a <- region$region == "California"

# b)
region <- region %>% mutate(california_b = region == "California")

# compare the two:
table(region$california_a, region$california_b)

# Your turn:
#   Add the variable salary$high = 1 if salary_start_median > 50000, 0 otherwise using mutate()
salary <- salary %>% mutate(high = as.numeric(salary_start_median > 50000))
head(salary)

#--------------------------------------------------------------------
## 2. Multiple functions at once with piping
# One cool aspect of piping is the ability to apply multiple functions at once. 
# Below we apply two functons to the data frame 'salary':
#     a) First, we add a variable salary_thousands = salary_start_median / 1000
#     b) Second, we rename the variable 'salary_midcareer_90th' to 'salary_90'
salary <- salary %>%
  mutate(salary_thousands = salary_start_median/1000) %>%
  rename(salary_90 = salary_midcareer_90th)



# When reading code that uses piping, it's often helpful to read the "%>%"s as "and then". 
# For example, the code above reads as:
#   Start with the object 'salary', and then
#     mutate (create) the variable..., and then
#     rename the variable. 

# Your turn:
#   Rename the variable salary$high to salary$salary_high
salary <- salary %>% rename(salary_high = high)

#--------------------------------------------------------------------
## 3. Keeping certain observations
# Sometimes we want to subset a data frame that only includes certain 
# observations. filter() and distinct() are our friends here.
#   a) filter() keeps observations that meet logical criteria
#   b) distinct() removes observations with duplicate values

# a)
state_schools <- type %>% filter(type == "State")
head(state_schools)

# b)
unique_regions <- region %>% distinct(region)
head(unique_regions)

# Your turn:
#   1) Create a table called 'rich.grads' that contains all observations within
#       'salary' where salary_90 > 200000. Use filter(). 
#   2) Create a table called 'unique_types' that contains one observation per 
#       'type' in the data frame 'type'.
rich.grads <- salary %>% filter(salary_90 > 200000)
head(rich.grads)
unique_types <- type %>% distinct(type)
unique_types


#--------------------------------------------------------------------
## 4. Keeping certain variables
# Other times we want to create a data frame that only includes some selected 
# variables. Two commands can help us: select() and transmute().
#   a) select() keeps only the variables desired. 
#   b) transmute() keeps only variables desired and allows creation of new variables. 

# a)
salary_median <- salary %>% 
  select(name, salary_start_median, salary_midcareer_median)
head(salary_median)

# b)
salary_median_thous <- salary %>% 
  transmute(name = name, salary_start_thous = salary_start_median/1000, 
            salary_midcareer_thous = salary_midcareer_median/1000)
head(salary_median_thous)

# Your turn:
#   Overwrite the table 'rich.grads' to only contain the variables 
#     'name' and 'salary_90_thous', which equals salary_90/1000.
rich.grads <- rich.grads %>% 
  transmute(name = name, salary_90_thous = salary_90/1000)
rich.grads


#--------------------------------------------------------------------
## 5. Sorting data
# Suppose we want to sort the data table by starting salary. 
# We can do that using arrange().
salary <- salary %>% arrange(salary_start_median)
head(salary) # lowest to highest

salary <- salary %>% arrange(desc(salary_start_median))
head(salary) # highest to lowest

# Your turn:
#   Sort rich.grads to go from highest 90th percentile salary to lowest.
rich.grads <- rich.grads %>% arrange(desc(salary_90_thous))
options(tibble.print_max = Inf) # allows you to see more rows
rich.grads # highest to lowest

#--------------------------------------------------------------------
## 6. Merging data
# We can "join" data tables using a common identifier, in our case "name". 
# First, restore your tables to their originals:
rm(list = ls())
salary <- read_xlsx("colleges_salary.xlsx")
region <- read_xlsx("colleges_region.xlsx")
type <- read_xlsx("colleges_type.xlsx")

# Next, combine 'salary' and 'region' with a left join into an object 'df':
# (left join because we only want to keep schools that have salary info)
df <- salary %>% left_join(region, by = "name")
head(df)

# After that, we will left join 'type':
df <- df %>% left_join(type, by = "name")
head(df)

# Note that we could have done both joins in one step:
df <- salary %>% left_join(region, by = "name") %>% left_join(type, by = "name")
head(df)


#--------------------------------------------------------------------
## 7. Group-wise operations
# Suppose I want to see the average median starting and mid career
#   salaries by region. 
# We can apply functions after using the group_by() function:
df_region <- df %>% 
  group_by(region) %>% 
  summarise(mean_start = mean(salary_start_median), 
            mean_mid = mean(salary_midcareer_median))
df_region

# What's the new unit of analysis?

# Your turn: 
#   Create df_type that creates a data frame at the type-level
#   and contains the average starting and mid career salaries 
#   by univeristy type.
df_type <- df %>% 
  group_by(type) %>% 
  summarise(mean_start = mean(salary_start_median), 
            mean_mid = mean(salary_midcareer_median))
df_type


#--------------------------------------------------------------------
## 8. Reshaping
# The data in df are currently wide (one observation per school).
# Instead, I may want long data with one observation per school-salary-percentile.
# I can adjust this using gather() from tidyr.

# First, install and load tidyr.
 install.packages("tidyr")
library(tidyr)

# Second, rename and order your variables. 
df <- df %>% rename(p10 = salary_midcareer_10th, 
                         p25 = salary_midcareer_25th,
                         p50 = salary_midcareer_median,
                         p75 = salary_midcareer_75th, 
                         p90 = salary_midcareer_90th) %>%
  select(name, salary_start_median, p10, p25, p50, p75, p90, everything()) 
head(df)

# Third, use gather() to reshape your data and arrange() to sort.
df_long <- df %>%
  gather("percentile", "salary", p10:p90) %>% arrange(name, percentile)
head(df_long, 10)

# Alternate without renaming
df_long <- df %>%
  gather("percentile", "salary", salary_midcareer_10th:salary_midcareer_90th) %>% arrange(name, percentile)
head(df_long, 10)

# To return to wide, use spread() (also from tidyr):
df_wide <- df_long %>%
  spread("percentile", "salary")
head(df_wide)
