# Descriptive statistics using psych package
# packages for R are made by developers and injected in R, we can see what packages are installed in our R library.
# we need to install the psych package to learn descriptive stat as it gives diff functionality to use in R 

# install.packages("psych")
# call or activate the package by using command
library(psych)

# we can see the available data sets by using the following command
data()
# To check what data are inside a particular data set
AirPassengers
BOD
# we can utilize the available data sets (relatively small) to practice in R
# however, we need to install packages for large data sets

# Using the New York airport flight data, it provides us with data set
# install.packages("nycflights13")
library(nycflights13)

# To obtain particular variable data from the above data set
attach(nycflights13::flights)

# Lets look at the first 6 records using the head() function, head function only gives the idea of a data set
head(nycflights13::flights)

# if we run the command without the head function, the full data set will appear.
# To visualize a summary of a particular data point in a this data set, here distance between airports are seen.
distance
summary(distance)
# we can use the describe function from the psych package to see detailed description of distance variable
describe(distance)

# To see details multiple variables of a data set in a single data set, use column bind command
demo = cbind(arr_delay, dep_delay, distance)

# To visualize in console, press ctrl + run
demo

describe(demo)

# To change the default column names for better understanding
# Introducing the colnames() function
colnames(demo) = c('Arrival delay', 'Departure delay', 'Distance travelled')

# Now we will visualize the changed column names
describe(demo)

# Plotting histogram
# Introducing the hist() function
# At first, we will plot histogram with the departure delay values
dep_delay
hist(dep_delay)

# How to group descriptive statistics
# we want to connect two variables
head(nycflights13::flights)

# To see the summary of the carrier variable
summary(carrier)

# To determine the frequency of each data in the carrier variable, convert this vector into factor
carrierfact = factor(carrier)
summary(carrierfact)

# To get the descriptive stat of each carrier's distance traveled, use describeBy function 
describeBy(distance, group = carrier)

# To connect 3 variables
#Two levels of aggregation
aggregate(distance, by = list(carrier, month), FUN = mean, na.rm = TRUE)
aggregate(distance, by = list(carrier, month), FUN = sd, na.rm = TRUE)

# Output explanation, group 1 = carrier abbreviation, group 2 = month, x = mean of distance traveled in that month.
# Fun = function, na.rm = remove the missing values while calculating the mean distance traveled.
# sd = standard deviation, can be calculated the same way. 
