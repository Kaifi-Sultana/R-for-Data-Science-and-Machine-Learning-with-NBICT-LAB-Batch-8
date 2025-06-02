# install.packages("ggplot2")
library(ggplot2)

# we will work on a built-in data set 
dataset = mtcars

# mpg = miles per gallon (dependent variable, wt = weight (independent variable) 
# Generating a basic scatter plot, independent variable against X axis, Y axis = dependent variable
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point()

# Changing the point size and shape
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size = 1, shape = 18)

# Adding the regression line, aesthetics = x and y axis determination
ggplot(dataset, aes(x = wt, y = mpg)) +
geom_point(size = 1, shape = 18) +
  geom_smooth(method = lm)

# lm = linear model, that will be used to plot the regression line
# inverse relationship between vehicle weight and miles per gallon, as we can see by the regression line

# Removing the confidence interval, viewing the best fit line only
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE)

# Loess method (loess line is a distinct regression line, will be developed by connecting the neighboring scatter dots)
# linearity/linear relationship of the data can be predicted by Loess line
# graphical prediction of data linearity, apart from numeric values
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point() +
  geom_smooth()

# Change the line type and color
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size = 1, shape = 18) +
  geom_smooth(method = lm, linetype = "dotted",
              color = "red")

# Changing the confidence interval color
ggplot(dataset, aes(x = wt, y = mpg)) +
  geom_point(size = 1, shape = 18, color = "orange") +
  geom_smooth(method = lm, linetype = "dotted",
              color = "red", fill = "blue")

# all we have done above, is summed up in the confidence interval color code.
# we can do everything mentioned with this code only. 
# To enhance picture quality of the plots, the width and length need to be edited while exporting.

# Scatter plot with multiple groups

dataset$cyl 
# Converting the cyl column from numeric to factor variable
dataset$cyl= as.factor(dataset$cyl)

# Changing the point shapes by the levels of cyl (cylinder variable in the data set
ggplot(dataset, aes(x = wt, y = mpg, shape = cyl)) +
  geom_point()

# Changing the point shapes and colors for better interpretation
ggplot(dataset, aes(x = wt, y = mpg, shape = cyl, color = cyl)) +
  geom_point()

# Changing point shapes, colors, and sizes
ggplot(dataset, aes(x = wt, y = mpg, shape = cyl, color = cyl, size = cyl)) +
  geom_point()

# we can put the shape, size or color of the variable as required. 