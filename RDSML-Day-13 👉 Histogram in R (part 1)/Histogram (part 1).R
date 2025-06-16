# Working on a pre-made data set. 
# Histogram is popular for predicting data distribution in a data set.
# Histogram mainly used for continuous data, data with decimals.
# Bar diagram is mainly used for discrete data, without decimal.

# Importing the data set
dataset = read.csv("data.csv")

# Importing the library
library(ggplot2)

# Basic histogram preparation by using ggplot2
ggplot(dataset, aes(x=weight))+
  geom_histogram()

# Changing the width of bins
ggplot(dataset, aes(x=weight))+
  geom_histogram(binwidth = 1, color = "black")

# Changing colors
ggplot(dataset, aes(x=weight))+
  geom_histogram(binwidth = 1, color = "black", fill = "white")

# Adding the mean line
myPlot = ggplot(dataset, aes(x = weight))+
  geom_histogram(color = "black", fill = "white")

myPlot + geom_vline(aes(xintercept = mean(weight)), 
                    color = "blue", linetype = "dashed", size = 1)

# Histogram with density plot
ggplot(dataset, aes(x = weight))+
  geom_histogram(aes(y = after_stat(density)), color = "black", fill = "white")+
  geom_density(fill = "blue", alpha = 0.2)

# Density plot is the smooth version of histogram.
# Alpha is the level of transparency of the density plot. 

# The histogram we get here is bi-modal type. 

# Changing bin border color and bin fill color
ggplot(dataset, aes(x = weight))+
  geom_histogram(color = "darkblue", fill = "lightblue")
