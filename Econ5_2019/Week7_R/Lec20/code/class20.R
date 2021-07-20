# Econ 5/Poli 5D, Class 20
# 
# Instructions: Below is some partially completed code. Using the comments as a 
# guide, finish the code. Remember to use help() if you cannot remember how a 
# function works, for example, help("mean"). Feel free to ask questions and
# help your classmates. 
################################################################################

# Start-up commands
rm(list = ls())

################################################################################
# Pre Class Exercise: using the 'counter'
################################################################################

data(uspop)
summary(uspop)
n <- length(uspop)

# Step 0: baseline
# This is an example to help you get started. 
for(i in 1:n) {
  print(i)
}


# Step 1: use i as a number itself
# Edit the loop to prints the years from 1790 to 1970 by 10s, e.g. 1790, 1800, 1810...
for(i in 1:n) {
  print(i)
}


# Step 2: use i to subset data
# Copy your previous answer below (where it says YOUR CODE HERE). Edit the loop to 
# store the printed year in the corresponding position in the vector 'year', one 
# value per iteration. When you are finished, 'year' should be identical to year2 
# but created with a loop.
year <- rep(NA, n)

  # YOUR CODE HERE

year2 <- seq(1790, 1970, 10)
year == year2


# Step 3a: use i as an element of a vector
# This code is already completed for you. Observe that the loop is iterating 
# through all possible values of the vector 'objects'. 
objects <- c("keys", "wallet", "backpack", "phone")
for(i in objects) {
  print(i)
}


# Step 3b: use i as an element of a vector
# Your goal is to print the years from 1790 to 1970 by looping over the 
# vector 'year.str'. Loop using 'i' as an element of the vector
# 'year.str', NOT a number. 
year.str <- as.character(year2)
  # YOUR CODE HERE


################################################################################
# In Class Activity
################################################################################

## 1. Putting together for, if, else, and while
# Recall: %% is the remainder function
# So 5%%2 = 1 since dividing 5 by 2 equals 2 with a remainder of 1.
#    7%%5 = 2 since 7/5 = 1 with a remainder of 2.

# Step 1: Suppose we have some number i (provided).
#   If it is even, output "i is even" where i is the actual number.
#   If it is odd, output "i is odd" where i is the actual number.
#   Hint: use paste() to print both i and "is ___" on the same line.
#       For example, try paste(1,"is a number.")
i <- sample(1:10, 1)

  
# Step 2: Now write a for loop to complete the above for all numbers in 1:10.




# Step 3: Now accomplish the same feat using a while loop.




#----------------------------------------------------------------------------------
## 2. While loops

# Suppose you are "flying" a model airplane. "Flying" is in quotes because, sadly, 
#   you have zero control over the elevation of the aircraft. We will model this 
#   behavior using a loop. Your plane's elevation starts at 5, and every period
#   (iteration) the plane goes up or down by one unit. Use a while loop to model
#   this behavior, keep track of iterations using the variable 'time', and print 
#   "CRASH! You lasted 't' periods." when the elevation hits zero.

# Hint: every period, add (sample(0:1, 1)*2 - 1) to the current elevation.

elevation <- 5
time <- 0
position <- NA

  # YOUR CODE HERE

print(paste("CRASH! You lasted", time, "periods."))



# Bonus: Store the plane's elevation every period in a new vector called 'position'
# using 'time' as your index, and run the following code:
plot(1:time, position)



#----------------------------------------------------------------------------------
## 3. for/while loops with conditional statements

# This is a challenge. Essentially, you will calculate the sum of the 
# sequence: 4/1 - 4/3 + 4/5 - 4/7 + 4/9 - 4/11...
# Use one for loop and two if statements:
#   1. Iterate from 1:iterations (you can increase 'iterations' later)
#   2. Check if the iteration is odd
#   3. If odd (i %% 2 == 1), check if the 'add' variable is one.
#       3a. If add == 1, add 4/i to seq, make add 0
#       3b. else subtract 4/i from seq, make add 1
# After your loop works, try iterations = 10^7. Try accomplishing the same task
#   using a while loop instead of a for loop.   

iterations <- 100
seq <- 0
add <- 1
for(i in 1:iterations){
  
  # YOUR CODE HERE
  
}
seq








