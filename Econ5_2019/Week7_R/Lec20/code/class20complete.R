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
uspop
n <- length(uspop)

# Step 1: use i as a number itself
for(i in 1:n){
  print(1780 + 10*i)
}

# Step 2: use i to subset data
year <- rep(0, n)
for(i in 1:n){
  year[i] <- 1780 + 10*i
  print(year[i])
}

# Step 3: use i as an element of a vector
sequence1 <- seq(1790, 1970, 10)
for(i in sequence1){
  print(i)
}


# Step 3b: use i as an element of a vector
# Your goal is to print the years from 1790 to 1970 by looping over the 
# vector 'year.str'. Loop using 'i' as an element of the vector
# 'year.str', NOT a number. 
year.str <- as.character(year2)
for(i in year.str){
  print(i)
}


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
if(i %% 2 == 0){ 
  print(paste(i,"is even."))
} else {
  print(paste(i,"is odd."))
} 

# Step 2: Now write a for loop to complete the above for all numbers in 1:10.
for(i in 1:10){
  if(i %% 2 == 0){ 
    print(paste(i,"is even."))
  } else {
    print(paste(i,"is odd."))
  } 
}


# Step 3: Now accomplish the same feat using a while loop.
while(i <= 10){
  if(i %% 2 == 0){ 
    print(paste(i,"is even."))
  } else {
    print(paste(i,"is odd."))
  } 
}



#----------------------------------------------------------------------------------
## 2. While loops

# Suppose you are "flying" a model airplane. "Flying" is in quotes because, sadly, 
#   you have zero control over the elevation of the aircraft. We will model this 
#   behavior using a loop. Your plane's elevation starts at 5, and every period
#   (iteration) the plane goes up or down by one unit. Use a while loop to model
#   this behavior, keep track of iterations using the variable 'time', and print 
#   "CRASH! You lasted 't' periods." when the elevation hits zero.

# Hint: every period, set elevation <- elevation + (sample(0:1, 1)*2 - 1)
elevation <- 5
time <- 0
position <- NA
while(elevation > 0){
  elevation <- elevation + (sample(0:1, 1)*2 - 1) 
  time <- time + 1
  position[time] <- elevation
}
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

iterations <- 1000000
seq <- 0
add <- 1
for(i in 1:iterations){
  if(i %% 2 == 1){
    if(add == 1){
      seq <- seq + 4/i
      add <- 0
    } else {
      seq <- seq - 4/i
      add <- 1
    }
    
  }
}
seq




