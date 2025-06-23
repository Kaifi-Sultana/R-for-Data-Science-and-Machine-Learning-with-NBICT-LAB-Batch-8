# Creating a data frame/set and barplot with those data.
# Barplot is appropriate for short dataset, mostly for discrete data type.
# histogram is perfect for long dataset and decimal data type.

dataset = data.frame(dose = c("D0.5", "D1", "D2"), 
                     len = c(4.2, 10, 29.5))

library(ggplot2)

# Basic barplot, (vertical barplot)
ggplot(data = dataset, aes(x = dose, y = len)) +
  geom_bar(stat = "identity")

# Horizontal barplot

ggplot(data = dataset, aes(x = dose, y = len)) +
  geom_bar(stat = "identity") +
  coord_flip()

# Changing the width of bars
ggplot(data = dataset, aes(x = dose, y = len)) +
  geom_bar(stat = "identity", width = .5)

# Changing the colors of bar borders
ggplot(data = dataset, aes(x = dose, y = len)) +
  geom_bar(stat = "identity", width = .5, color = "black")

# Changing the colors of bars
ggplot(data = dataset, aes(x = dose, y = len)) +
  geom_bar(stat = "identity", width = .5, color = "black", fill = "orange")

# Minimal theme with blue fill color
ggplot(data = dataset, aes(x = dose, y = len)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  theme_minimal()

# Barplot with label. label outside the bars
ggplot(data = dataset, aes(x = dose, y = len)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_text(aes(label = len), vjust = -0.5) +
  theme_minimal()
# vjust is the variable to adjust the location of labels.
# minus sign for label outside the bar.

# Changing the size of the variables/fonts in the bar
ggplot(data = dataset, aes(x = dose, y = len)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_text(aes(label = len), vjust = -0.5, size = 3, color = "black") +
  theme_minimal()

# Barplot with label. label inside the bars
ggplot(data = dataset, aes(x = dose, y = len)) +
  geom_bar(stat = "identity", fill = "steelblue") +
  geom_text(aes(label = len), vjust = 3.5, size = 3, color = "white") +
  theme_minimal()

# stat = identity is used as we used data directly

myCarData = mtcars
# Barplot of counts
# To create a barplot of counts, we'll use mtcars dataset.

ggplot(data = myCarData, aes(x = factor(cyl))) +
  geom_bar(stat = "count", width = 0.7, fill = "steelblue") +
  theme_minimal()
