# Econ 5/Poli 5D, Lab 6
# In-class Activity
# 
# Instructions: Below is some partially completed code. Using the comments as a 
# guide, finish the code. Remember to use help() if you cannot remember how a 
# function works, for example, help("mean"). Feel free to ask questions and
# help your classmates. 
#
# If you finish early, you can finish class19.R and class20.R. If you've finished
# those as well, you can work on the problem set or your final project. 
#
################################################################################

# Start-up commands
rm(list = ls())

################################################################################
# In Class Exerices
################################################################################

### Factorial Calculator

## 1a. Your goal is to use loops to calculate the factorial of some number provided, x.
#   The factorial of x = x! = x*(x-1)*(x-2)*...*(1). Use a for loop. Store the 
#   factorial of x as the object 'factorial'.

x <- sample(1:10, 1)
factorial <- 1

 # YOUR CODE HERE

x
factorial
factorial == factorial(x) # checks your work


## 1b.  Now repeat the tasks but use a while loop instead.

x <- sample(1:10, 1)
x.copy <- x
factorial <- 1


# YOUR CODE HERE

x.copy
factorial
factorial == factorial(x.copy) # checks your work


#--------------------------------------------------------------------

### Wild Mouse

## 2a. Remy is a mouse who every second runs one unit away from his 
#   current position. However, he randomly decides to turn left, turn right,
#   or continue straight, all with equal probabilities. We will model
#   Remy's behavior with code.

#   Remy starts at position (0, 0) in the x-y plane, initially moving one-unit 
#       forward along the positive y axis. 
#   If he chooses to turn left, he will start moving in the minus x direction, 
#       v.x = -1, v.y = 0.
#   If he chooses to turn right, he will start moving in the positive x direction,
#       v.x = 1, v.y = 0.
#   If he chooses to continue straight, he will continue moving in the positive y 
#       direction, v.x = 0, v.y = 1.

#   You are given the total number of periods that Remy will run ('iterations').
#   For each step of the iteration, keep track of Remy's position using
#   two objects called 'position.x' and 'position.y'.

#   Add code to the five places labeled YOUR CODE HERE below.


iterations <- 400
position.x <- rep(0, iterations)
position.y <- position.x
randn <- position.x
v.x <- 0
v.y <- 1 # set intitial velocity 

# YOUR CODE HERE: add a for loop. Use 'i' as your counter. Be careful when picking your starting point.
  turn <- sample(-1:1, 1)
  # YOUR CODE HERE: add a condition to do the following when turn == -1 (turn left)
    if(abs(v.x) == 1) {  
      v.y <- v.x
      v.x <- 0
    } else {
      v.x <- -v.y
      v.y <- 0
    }
  } # YOUR CODE HERE: add a condition to do the following when turn == 1 (turn right)
    if(abs(v.x) == 1) {
      v.y <- -v.x
      v.x <- 0
    } else {
      v.x <- v.y
      v.y <- 0
    }
  } 
  position.x[i] <- # YOUR CODE HERE: Add the x velocity to last period's x position
  position.y[i] <- # YOUR CODE HERE: Add the y velocity to last period's y position
}

# This plots Remy's journey
dev.off()
range <- max(abs(range(position.x)[2]), abs(range(position.x)[1]), 
             abs(range(position.y)[2]), abs(range(position.y)[1]) )
plot(-range:range, -range:range, type = "n")
lines(position.x, position.y, type = "l")



## 2b. Try the above again using a while loop instead of a for loop.
