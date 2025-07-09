# Styling plots for publications
# Installing and loading necessary packages & libraries

library(ggplot2)
# install.packages("ggthemes")
library(ggthemes)
# install.packages("viridis")
library(viridis)

# Viridis will give us colorblind friendly color palettes.

# Sample data set loading (df = data frame)
df = mtcars

# We will plot with the mpg (miles per gallon)
# and wt (weight) variables and style it. 
# Based on the cylinder (cyl) variable, we will color the plot.
# We need to convert cyl variable into factor variable.

df$cyl = as.factor(df$cyl)
class(df$cyl)

# Styling plot
ggplot(df, aes(x = wt, y = mpg)) +
  geom_point()

# If we change plot colors according to cylinder numbers,
ggplot(df, aes(x = wt, y = mpg, color = cyl)) +
  geom_point(size = 2)

# If we want to write CYLINDER, instead of cyl in the plot,
ggplot(df, aes(x = wt, y = mpg, color = cyl)) +
  geom_point(size = 2) +
  scale_color_viridis_d(name = "Cylinders")

# Changing the axis labels manually,
p = ggplot(df, aes(x = wt, y = mpg, color = cyl)) +
  geom_point(size = 3) +
  scale_color_viridis_d(name = "Cylinders") +
  labs(
    title = "Fuel Efficiency by Car Weight",
    x = "Weight (1000 lbs)",
    y = "Miles per Gallon"
  ) +
  theme_classic(base_size = 14, base_family = "serif") +
  theme(plot.title = element_text(face = "bold", size = 16, hjust = 0.5),
        axis.title = element_text(face = "bold", size = 14),
        axis.text = element_text(size = 12),
        legend.position = "right", 
        legend.title = element_text(face = "bold"),
        legend.text = element_text(size = 12)
        )


# hjust is the plot title's alignment

# Saving the plot for publication.(measurements in inch, dpi = resolution)
ggsave("publication_ggplot.png", p, width = 6, height = 4, dpi = 300)