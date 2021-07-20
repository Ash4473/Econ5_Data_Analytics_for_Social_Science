# Econ 5/Poli 5D, Class 19
# 
# Instructions: Below is some partially completed code. Using the comments as a 
# guide, finish the code. Remember to use help() if you cannot remember how a 
# function works, for example, help("mean"). Feel free to ask questions and
# help your classmates. 
################################################################################

# Start-up commands
rm(list = ls())

################################################################################
# Pre Class Exercise
################################################################################

# 0. Here is the baseline for loop - run the code and see what happens. 
x <- 0  
for(i in 1:5){ 
  x <- x + i
}
print(x)

# 1. Change the baseline loop so that x is printed during every iteration of the loop.
x <- 0  
for(i in 1:5){ 
  x <- x + i
}
print(x)

# 2. Change the baseline loop so that the sum of integers from 5 to 10 is printed.
x <- 0  
for(i in 1:5){ 
  x <- x + i
}
print(x)

# 3. Change the baseline loop so that the sum of even integers from 2 to 10 is printed. 
# Hint: this can be accomplished in a variety of ways. For a challenge, try to figure 
# out more than one method that works. 
x <- 0  
for(i in 1:5){ 
  x <- x + i
}
print(x)

if (3==2) {
  "2+2"
}

x <- sample(-1:1, 1) # random draw from {-1, 0, 1} 
x
if (x > 0) {
  print("x is positive")
} else {
  print("x is non-positive")
}
# 4. Change the baseline loop to store the value of x after each iteration of the loop in the 
# vector 'y' (created for you). The value of x after the first iteration of the loop 
# should be stored as the first element of y, the value of x after the second iteration 
# should be stored as the second element of y, and so on. 
y <- rep(NA, 5)
x <- 0
for(i in 1:5){ 
  x <- x + i
  # YOUR CODE HERE
}
z <- c(1, 3, 6, 10, 15)
y == z # This should produce a vector of TRUEs if you coded correctly. 

################################################################################
# In Class Activity
################################################################################

## 1. if/else
data(mtcars)
summary(mtcars)
# Write a loop that assigns a new vector 'effiency' to be:
#     "very low" if mpg is under 15
#     "low" if mpg is >= 15 and < 20
#     "medium" if >= 20 and < 25
#     "high" if >= 25 and < 30
#     "very high" if >= 30
# Remember: you will want to preallocate 'efficiency' BEFORE entering the loop for speed.
#     (hint: use length() to ensure 'efficiency' is the correct size.)
# Create a table to dislay how many of each efficiency class there are.
n <- length(mtcars$mpg)


# BONUS: How might you do this without a loop? Try it (after finishing the other problems)

#----------------------------------------------------------------------------------
## 2. for loops

# 2a. Write a for loop which squares each entry in list.1 and prints the output
list.1 = 1:10


# Fibonnaci sequence
# Using a loop, create a vector 'fibs' that stores the first 20 digits of 
#   the Fibonnaci sequence, whose nth element is the sum of the two preceding 
#   elements, that is: fibs[i] = fibs[i-1] + fibs[i-2].
#   Assume fibs[1] == 1 and fibs[2] == 1. 
#   Display the vector after your loop to check. Should be 1 1 2 3 5 8 etc.
#   Hint: you will NOT start looping at i == 1.
iterations <- 20
fibs <- rep(NA, iterations)

  # YOUR CODE HERE

fibs

