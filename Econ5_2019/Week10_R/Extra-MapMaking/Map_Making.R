# Author: Arushi Kaushik
# Extra Material on Map-making

## The material closely follows Imai's QSS

library(maps)

## to call an in-built database in R, use data()
data(us.cities)

head(us.cities)
## The variable capital captures capital of the country (==1),
## capital of a state (==2) or neither (==0)



## We will use map function to plot US map using the argument "usa" for database
map(database="usa")
## Add capitals on the map
capitals <- subset(us.cities, capital==2) ## Subsetted state capitals from us.cities data

# add the above capitals as points where points are proportional to population size
points(x= capitals$long, y= capitals$lat,
       cex= capitals$pop/500000, pch=19)
title("US capitals") # adds a title

## plotting only California state by giving arguments: database="state" 
## and regions= "California"
map(database="state", regions="California")

## Lets plot top 7 cities in CA by population size
cal.cities= us.cities[us.cities$country.etc=="CA",] # subsetting cities in CA
sind= order(cal.cities$pop, decreasing=TRUE) # ordering these cities in decreasing order

top7= sind[1:7] #picking up the largest 7 cities in CA

# Lets add these cities with their names using text()
map(database="state", regions= "California")
points(x= cal.cities$long[top7], y=cal.cities$lat[top7], pch=19)

# adding a constant to logitudes so that names do not overlap
text(x= cal.cities$long[top7]+2.25, 
     y= cal.cities$lat[top7],
     label= cal.cities$name[top7])
title("Largest Cities of California")


## Using a different dataset- pres08.csv- now

pres08 <- read.csv("pres08.csv")

## Plotting red-blue states by who won 2008 elections:

## Creating var to capture relative shares of two parties
pres08$Dem <- pres08$Obama/(pres08$Obama+ pres08$McCain)
pres08$Rep <- pres08$McCain/(pres08$Obama+ pres08$McCain)

## plotting 
map(database="state") #create a map
for (i in 1:nrow(pres08)) {
  if ((pres08$state[i] != "HI") & (pres08$state[i] != "AK") 
      & (pres08$state[i] != "DC")) { 
    map(database = "state", regions = pres08$state.name[i],
    col = ifelse(pres08$Rep[i] > pres08$Dem[i], "red", "blue"),
    fill = TRUE, add = TRUE) #add argument adds to current plot instead of making a new plot
    
  }
}

## Chloropeth map using ggplot2
install.packages("usmap")
library(usmap)
library(ggplot2)

plot_usmap(data = pres08, values = "Dem", color = "blue") + 
  scale_fill_continuous(low = "white", high = "blue", name = "Democrat share (2008)", label = scales::comma) +  
  labs(title= "Share of votes polled for Democrats in 2008") + theme(legend.position = "right") 

