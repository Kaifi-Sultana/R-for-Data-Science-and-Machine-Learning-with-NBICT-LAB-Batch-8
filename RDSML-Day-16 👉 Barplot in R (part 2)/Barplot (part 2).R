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

# Day 16 works
# Changing barplot border line colors by groups
print(dataset)
ggplot(dataset, aes(x = dose, y = len, color = dose)) +
  geom_bar(stat = "identity", fill = "white")

# Using custom color palettes,to change border lines of plots
ggplot(dataset, aes(x = dose, y = len, color = dose)) +
  geom_bar(stat = "identity", fill = "white") +
  scale_color_manual(values = c("blue", "red", "green"))

# we can also use hexadecimal color picker from Google 

# Using brewer color palettes
ggplot(dataset, aes(x = dose, y = len, color = dose)) +
  geom_bar(stat = "identity", fill = "white") +
  scale_color_brewer(palette = "Dark2")

# Using grey scale
ggplot(dataset, aes(x = dose, y = len, color = dose)) +
  geom_bar(stat = "identity", fill = "white") +
  scale_color_grey() +
  theme_classic()

# Changing barplot fill colors by groups
ggplot(dataset, aes(x = dose, y = len, fill = dose)) +
  geom_bar(stat = "identity")

# Apply a minimal theme on the previous barplot
ggplot(dataset, aes(x = dose, y = len, fill = dose)) +
  geom_bar(stat = "identity") +
  theme_minimal()

# Customize barplot fill colors
p = ggplot(dataset, aes(x = dose, y = len, fill = dose)) +
  geom_bar(stat = "identity") +
  theme_minimal()

p + scale_fill_manual(values = c("blue", "red", "green"))

p + scale_fill_brewer(palette = "Dark2")

p + scale_fill_grey()  

# Using black outline color for barplot borders
ggplot(dataset, aes(x = dose, y = len, fill = dose)) +
  geom_bar(stat = "identity", color = "black") +
  scale_color_manual(values = c("blue", "red", "green")) +
  theme(legend.position = "top")

# We have learned how to publish a folder in GitHub,
# when GitHub is not installed beforehand. 
                      
    