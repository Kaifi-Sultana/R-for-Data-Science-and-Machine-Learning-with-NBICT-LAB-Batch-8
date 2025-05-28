# Descriptive statistics using psych package
# packages for R are made by developers and injected in R, we can see what packages are installed in our R library.
# we need to install the psych package to learn descriptive stat as it gives diff functionality to use in R 

install.packages("psych")
# call or activate the package by using command
library(psych)

# we can see the available data sets by using the following command
data()
# To check what data are inside a particular data set
AirPassengers
BOD
# we can utilize the available data sets to practice in R
# however, we need to install packages for large data sets

#Using the New York airport flight data, it provides us with data set
install.packages("nycflights13")
library(nycflights13)

# To obtain particular data from the above data set
attach(nycflights13::flights)

# Lets look at the first 6 records using the head() function, head function only gives the idea of a data set
head(nycflights13::flights)

# if we run the command without the head function, the full data set will appear.
# To visualize a summary of a particular data point in a this data set, here distance between airports are seen.
summary(distance)
# we can use the describe function from the psych package to see detailed description of distance variable
describe(distance)

# To see details multiple variables of a data set in a single data set
demo = cbind(arr_delay, dep_delay, distance)

# To visualize in console, press ctrl + run
demo

describe(demo)
