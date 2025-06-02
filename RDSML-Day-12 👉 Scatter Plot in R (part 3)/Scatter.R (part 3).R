library(ggplot2)
dataset = mtcars

# Converting cyl column from a numeric to a factor variable
dataset$cyl = as.factor(dataset$cyl)

# Adding regression lines based on multiple groups
ggplot(dataset, aes(x = wt, y = mpg, color = cyl, shape = cyl)) +
  geom_point() +
  geom_smooth(method = lm)

# Interpretation: orange color represents the regression line (steeper, higher mpg with lower wt) for 4 cylinder, 
# green for 6 cyl and blue for 8 cyl.

# Removing the confidence intervals, se = standard error
ggplot(dataset, aes(x = wt, y = mpg, color = cyl, shape = cyl)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE)

# Extending the regression lines
ggplot(dataset, aes(x = wt, y = mpg, color = cyl, shape = cyl)) +
  geom_point() +
  geom_smooth(method=lm, se = FALSE, fullrange=TRUE)

# Filling the color of confidence bands
ggplot(dataset, aes(x = wt, y = mpg, color = cyl, shape = cyl)) +
  geom_point() +
  geom_smooth(method = lm, aes(fill = cyl), fullrange = TRUE)

# We need to omit the full range function as the plot is difficult to interpret
ggplot(dataset, aes(x = wt, y = mpg, color = cyl, shape = cyl)) +
  geom_point() +
  geom_smooth(method = lm, aes(fill = cyl))

# Changing point shapes manually
ggplot(dataset, aes(x = wt, y = mpg, color = cyl, shape = cyl)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE, fullrange = TRUE) +
  scale_shape_manual(values = c(16,3,17)) +
  theme(legend.position = "top")
# ^ to change legend position on the plot


# Changing point colors manually
ggplot(dataset, aes(x = wt, y = mpg, color = cyl, shape = cyl)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE, fullrange = TRUE) +
  scale_shape_manual(values = c(16,3,17)) +
  scale_color_manual(values = c('orange', 'purple','darkgreen')) +
  theme(legend.position = "top")


# Customizing scatter plots
ggplot(dataset, aes(x = wt, y = mpg, color = cyl, shape = cyl)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE, fullrange = TRUE) +
  scale_shape_manual(values = c(16,3,17)) +
  scale_color_manual(values = c('orange', 'purple','darkgreen')) +
  labs(title="Miles per gallon \naccording to weight", x="weight", y= "miles per gallon") +
  theme(legend.position = "top")

# \n is used to break the existing line and start a new one


# Customizing themes
plot = ggplot(dataset, aes(x = wt, y = mpg, color = cyl, shape = cyl)) +
  geom_point() +
  geom_smooth(method = lm, se = FALSE, fullrange = TRUE) +
  scale_shape_manual(values = c(16,3,17)) +
  scale_color_manual(values = c('orange', 'purple','darkgreen')) +
  labs(title="Miles per gallon \naccording to weight", x="weight", y= "miles per gallon") +
  theme(legend.position = "top")

plot + theme_classic()
plot + theme_minimal()
