# install.packages("ggplot2")
library(ggplot2)

dataset = mtcars

# mpg = miles per gallon (dependent variable, wt = weight (independent variable) 
# generating a basic scatter plot, independent variable against X axis, Y axis = dependent variable
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point()

# Changing the point size and shape
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size = 1, shape = 18)

# Adding the regression line
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size = 1, shape = 18) +
  geom_smooth()

