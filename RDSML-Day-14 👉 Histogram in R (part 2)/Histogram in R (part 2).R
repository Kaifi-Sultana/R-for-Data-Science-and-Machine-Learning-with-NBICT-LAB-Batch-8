# Importing the dataset 
dataset = read.csv("data.csv")

# Importing the library
library(ggplot2)

# Creating the basic histogram
ggplot(dataset, aes(x = weight)) +
  geom_histogram(color = "white", fill = "lightblue")


# Changing histogram plot line colors by groups
ggplot(dataset, aes(x = weight, fill = sex)) +
  geom_histogram(color = "white", alpha = 1)

# To overcome the overlapping points on the histogram,
ggplot(dataset, aes(x = weight, fill = sex)) +
  geom_histogram(color = "white", alpha = 0.5, position = "identity")

# We can change the position adjustment
# to use for overlapping points on the layer.
# Possible values for the argument position are "identity", "stack",
# "dodge". Default value is "stack". 

# Interleaved histogram
ggplot(dataset, aes(x = weight, fill = sex)) +
  geom_histogram(color = "white", alpha = 0.5, position = "dodge") +
  theme(legend.position = "top")

# The plyr package is used to calculate the mean weight of each group. 

# install.packages("plyr")
library(plyr)
group_means = ddply(dataset, "sex", summarise, grp.mean = mean(weight))
group_means

# Adding mean lines for specific groups, male and female for our dataset
myPlot = ggplot(dataset, aes(x = weight, fill = sex)) +
  geom_histogram(color = "white", alpha = 1, position = "dodge") +
  geom_vline(data = group_means, aes(xintercept = grp.mean, color = sex), linetype = "dashed") +
  theme(legend.position = "top")

myPlot

# Using custom color palattes
myPlot + scale_color_manual(values = c("red", "blue")) +
  scale_fill_manual(values = c("red", "blue"))

# Hexadecimal values for colors, grey = #999999, orange = #E69F00

# Using color brewer color palettes
myPlot + scale_color_brewer(palette = "Dark2") +
  scale_fill_brewer(palette = "Dark2")
  

# Using grey scale
myPlot + scale_color_grey() +
  scale_fill_grey() + 
  theme_classic()
